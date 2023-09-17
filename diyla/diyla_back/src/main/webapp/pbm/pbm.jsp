<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>常見問題</title>
    <link rel="stylesheet" href="${ctxPath}/css/style.css">
    <style>
    body{
    margin-left:280px;
    }
    </style>
</head>
<body>
    <h1>常見問題</h1>
<ul>
     <li class="li">
         <a class="a" href='pbmall.jsp'>查詢全部常見問題</a>
     </li>

    <jsp:useBean id="pbmSvc" scope="page" class="com.cha102.diyla.commonproblemmodel.PbmService" />

  <li>
     <FORM METHOD="post" ACTION="PbmController" >
       <b>選擇員工編號:</b>
       <select size="1" name="pbmNo">
         <c:forEach var="pbmVO" items="${pbmSvc.all}" >
          <option value="${pbmVO.pbmNo}">${pbmVO.pbmTitle}
         </c:forEach>
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
        <li class="li"><a class="a" href='addpbm.jsp'>新增常見問題</a></li>

</ul>


</body>
</html>