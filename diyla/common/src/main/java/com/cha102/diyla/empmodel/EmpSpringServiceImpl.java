package com.cha102.diyla.empmodel;


import com.alibaba.fastjson.JSONObject;
import com.cha102.diyla.enums.AuthFunEnum;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import redis.clients.jedis.Jedis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Service
public class EmpSpringServiceImpl implements EmpSpringService {

    @Autowired
    private EmpJPADAO empJPADAO;

    @Autowired
    private MailService mailService;

//    @Autowired
//    private MainDataBaseMapper mainDataBaseMapper;

    @Override
    public String getAllEmp(JSONObject jsonObject) {
        int pageIndex = jsonObject.getIntValue("pageIndex");
        int pageSize = jsonObject.getIntValue("pageSize");
        String chooseTypeFun = jsonObject.getString("chooseTypeFun");
//      前端傳入值 pageIndex 1 , pageSize 10 第一頁取10筆, 第二頁為 10 * (2-1),10...
        List<Object[]> allEmpObjArr = empJPADAO.getAllEmp(pageSize * (pageIndex - 1), pageSize, chooseTypeFun);
//      將ObjectArr 透過stream流轉換成 stream<ObjectArr> 透過map方法做轉換-> stream<EmpDTO>,
        List<EmpDTO> empDTOList = allEmpObjArr.stream().map(EmpDTO::new)
//      stream<EmpDTO>在此處代名詞為 o (隨便取都行),o先拿著自己的TypeFun英文傳入參數去調用AuthFunEnum方法
//      拿到TypeFunChinese 再返回 o , 此時stream<EmpDTO> 裡的英文已透過setTypeFun換成中文,但TypeFun的Key不變,可以透過map去做一些操作
                .map(o ->
                        {
                            o.setTypeFun(AuthFunEnum.getTypeFunChinese(o.getTypeFun()));
                            return o;
                        }
                )
                .collect(Collectors.toList());
        Integer allEmpCount = empJPADAO.getAllEmpCount(chooseTypeFun);
//      JSONObject 也是用put放入資料
//    TODO優化   正確做法為寫一個VO裝取資料,報錯時才知道是哪一欄位出問題,若使用JSONObject Key就是字串不好除錯
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("totalSize", allEmpCount);
        returnJSONObject.put("empList", empDTOList);
        return JSONObject.toJSONString(returnJSONObject);
    }

    @Override
    public String changeEmpStatus(JSONObject jsonObject) {
        int empId = jsonObject.getIntValue("empId");
        Boolean empStatus = jsonObject.getBooleanValue("empStatus");
        int changeEmpStatusNumber = empJPADAO.changeEmpStatus(empId, jsonObject.getIntValue("empStatus"));
        JSONObject returnJSONObject = new JSONObject();
        returnJSONObject.put("empStatus", empStatus);
        if (changeEmpStatusNumber > 0) {
            return JSONObject.toJSONString(returnJSONObject);
        } else {
            return "";
        }
    }

    @Override
    public void validEmpLogin(String empAccount, String empPassword, HttpServletRequest req, HttpServletResponse resp) {
        ConcurrentHashMap<String, String> errorMsgMap = new ConcurrentHashMap<>();
        Integer empId = null;
        String empName = null;
        byte[] empPic = null;
        List<EmpDTO> empDTOList = new ArrayList<>();
        List<String> empTypeFunList = new ArrayList<>();
        int errorCount = 0;
        if (ObjectUtils.isEmpty(empAccount)) {
            req.setAttribute("empAccount", "account");
            errorCount++;
//            errorMsgMap.put("empAccount", "請輸入員工帳號");

        }
        if (ObjectUtils.isEmpty(empPassword)) {
            req.setAttribute("empPassword", "password");
            errorCount++;
//            errorMsgMap.put("empPassword", "請輸入員工密碼");
        }
        if(errorCount > 0){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("empLogin.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


//        if (!ObjectUtils.isEmpty(errorMsgMap)) {
//            req.setAttribute("errorMsgMap", errorMsgMap);
//            RequestDispatcher requestDispatcher = req.getRequestDispatcher("empLogin.jsp");
//            try {
//                requestDispatcher.forward(req,resp);
//            } catch (ServletException e) {
//                throw new RuntimeException(e);
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//            return;
//        }
        List<Object[]> empDataList = empJPADAO.validEmpLogin(empAccount, empPassword);
        if (empDataList.size() == 0) {
//            errorMsgMap.put("empLoginError", "員工帳號密碼不匹配,請重新確認");
            req.setAttribute("empAccount", "false");
            req.setAttribute("empPassword", "false");
//            req.setAttribute("errorMsgMap", errorMsgMap);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("empLogin.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        } else {
            empDTOList = empDataList.stream().map(o -> {
                EmpDTO empDTO = new EmpDTO();
                empDTO.setTypeFun((String) o[0]);
                empDTO.setEmpId((Integer) o[1]);
                empDTO.setEmpPic((byte[]) o[2]);
                empDTO.setEmpName((String) o[3]);
                return empDTO;
            }).collect(Collectors.toList());
            empId = empDTOList.stream().map(EmpDTO::getEmpId).findFirst().get();
            empPic = empDTOList.stream().map(EmpDTO::getEmpPic).collect(Collectors.toList()).get(0);
            empName = empDTOList.stream().map(EmpDTO::getEmpName).findFirst().get();
            empTypeFunList = empDTOList.stream().map(EmpDTO::getTypeFun).collect(Collectors.toList());
        }
        empDTOList = empDataList.stream().map(o -> {
            EmpDTO empDTO = new EmpDTO();
            empDTO.setTypeFun((String) o[0]);
            empDTO.setEmpId((Integer) o[1]);
            empDTO.setEmpPic((byte[]) o[2]);
            empDTO.setEmpName((String) o[3]);
            return empDTO;
        }).collect(Collectors.toList());
        empId = empDTOList.stream().map(EmpDTO::getEmpId).findFirst().get();
        empPic = empDTOList.stream().map(EmpDTO::getEmpPic).collect(Collectors.toList()).get(0);
        empName = empDTOList.stream().map(EmpDTO::getEmpName).findFirst().get();
        empTypeFunList = empDTOList.stream().map(EmpDTO::getTypeFun).collect(Collectors.toList());

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("empPic", empPic);
        empTypeFunList.stream().forEach(t -> System.out.println(t));
        req.getSession().setAttribute("typeFun", empTypeFunList);
        req.getSession().setAttribute("empId", empId);
        req.getSession().setAttribute("empName", empName);
        req.getSession().setAttribute("isEmpFlag", true);
        req.getSession().setAttribute("empPic", jsonObject.toJSONString());
        String location = (String) req.getSession().getAttribute("location");
        if (location != null) {
//          看有無來源網頁
//            req.getSession().removeAttribute("location");
            try {
                resp.sendRedirect(location);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }

        String url = ObjectUtils.isEmpty(empTypeFunList) ? "empLogin.jsp" : "welcome.jsp";
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(url);
        try {
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void logout(String empId, HttpServletRequest req, HttpServletResponse resp) {
        //清空Session
        req.getSession().removeAttribute("empId");
        req.getSession().removeAttribute("typeFun");

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("empLogin.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String compareEmpEmail(String empEmail, HttpServletRequest req, HttpServletResponse resp) {
        JSONObject jsonObject = JSONObject.parseObject(empEmail);
        String userEmail = jsonObject.getString("empEmail");
        Integer number = empJPADAO.checkEmail(userEmail);
        JSONObject resultObj = new JSONObject();
        if (number > 0) {
            String s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            String code = "";
            for (int i = 1; i <= 4; i++) {
                code += String.valueOf(s.charAt((int) (Math.random() * 61)));
            }
            String title = "重設您的 DIYLA 密碼";
            String context = "您的驗證碼為" + code + "請點選以下連結輸入驗證碼，重設密碼後重新登入。\n" +
                    req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/emp/empResetPassword.jsp";

            Jedis jedis = new Jedis("localhost", 6379);

            boolean result = mailService.sendMail(userEmail, title, context);
//            RequestDispatcher success = req.getRequestDispatcher("empResetPassword.jsp");
            //          將JSON 格式的Key "empEmail" getString 取出字串格式
            if (result) {
                jedis.setex(userEmail, 600, code);
                jedis.close();
                resultObj.put("result", "success");
                req.getSession().setAttribute("empEmail", userEmail);
            }
            return resultObj.toJSONString();
        }
        resultObj.put("result", "fail");
        return resultObj.toJSONString();
    }

    public void queryValidCodeResetPassword(String validCode, String doubleCheckPassword, HttpServletRequest req, HttpServletResponse resp) {
        // 建立一個Jedis連接
        String empEmail = (String) req.getSession().getAttribute("empEmail");
        Jedis jedis = new Jedis("", 6379);
        String redisValidCode = jedis.get(empEmail);
        RequestDispatcher requestDispatcher = null;
        if (validCode.equals(redisValidCode)) {
            empJPADAO.resertPassword(empEmail, doubleCheckPassword);
            req.setAttribute("newPassword", "succes");
            requestDispatcher = req.getRequestDispatcher("empLogin.jsp");
//             更新成功
            req.getSession().removeAttribute("empEmail");
        } else {
//            資料錯誤,請重新驗證
            req.setAttribute("validcode", false);
            requestDispatcher = req.getRequestDispatcher("empResetPassword.jsp");

        }
        try {
            requestDispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getChatPic(JSONObject empIdObj) {
        String empIdStr = empIdObj.getString("empId");
        // 驗證是否key為empId, 不然就是memId
        if (ObjectUtils.isEmpty(empIdStr)) {
            return empIdObj.toJSONString();
        }
        // 是否存在"_" ex: 1_襪襪
        if (!empIdStr.contains("_")) {
            return empIdObj.toJSONString();
        }
        // 拿empId去查詢
        return empJPADAO.getChatPic(Integer.valueOf(empIdStr.split("_")[1])).toJSONString();
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("1");
        list.add("5");
        list.add("2");
        list.add("3");
//      在每一個參數中放入, 形成字串
        String s = list.stream().collect(Collectors.joining(","));
        System.out.println(s);
//        filter = 過濾器,留下我要的資料類型去記,最後轉成List 印出 , List印出就會有[] 非陣列
        List<String> collect = list.stream().filter(o -> !o.equalsIgnoreCase("1")).collect(Collectors.toList());
        System.out.println(collect);
    }
}