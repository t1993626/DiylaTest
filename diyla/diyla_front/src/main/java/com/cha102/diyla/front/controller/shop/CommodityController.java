package com.cha102.diyla.front.controller.shop;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/shop/CommodityController")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CommodityController extends HttpServlet {
    CommodityService service = new CommodityService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("listAll".equals(action)) {
            List<CommodityVO> commodityVOS = service.getAllState();
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("findByID".equals(action)) {
            Integer comNO = Integer.valueOf(req.getParameter("comNO"));
            CommodityVO commodityVO = service.findByID(comNO);
            RequestDispatcher requestDispatcher ;
            if (commodityVO != null && !commodityVO.getComState().equals(0)) {
                req.setAttribute("commodity", commodityVO);
                requestDispatcher = req.getRequestDispatcher("/shop/commodityPage.jsp");
                requestDispatcher.forward(req, resp);
            } else {
                requestDispatcher = req.getRequestDispatcher("/shop/commodityNotFound.jsp");
                requestDispatcher.forward(req, resp);
            }

        }

        if ("search".equals(action)) {
            String keyword = req.getParameter("keyword");
            List<CommodityVO> commodityVOS = service.findByNameKeyword(keyword);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }

        if ("findByClassNO".equals(action)) {
            Integer comClassNO = Integer.valueOf(req.getParameter("comClassNo"));
            List<CommodityVO> commodityVOS = service.findByComClass(comClassNO);
            req.setAttribute("commodityList", commodityVOS);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/listCommodity.jsp");
            requestDispatcher.forward(req, resp);
        }


    }
}

