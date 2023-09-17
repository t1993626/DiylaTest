<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.member.*"%>
<% MemVO memVO = (MemVO) request.getAttribute("memVO");%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>會員登入</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>
    
    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <style>
        * {
            box-sizing: border-box;
            font-family:"jf open 粉圓 1.1";

        }

        body {
            margin: 0;
        }

        div.title {
            border: 1px solid #B26021;
            text-align: center;
            width: 400px;
            color: #B26021;
            position: relative;
            top:50%;
            left:50%;
            transform: translateX(-50%);
            border-radius: 5px;
            letter-spacing: 3px;
            margin:50px 0;
            background-color:snow;
        }
        h4.member{
            margin-top:30px;
            margin-bottom:20px;
            font-weight:bold;
        }

        div.error {
            padding: 10px;
            background-color: #FCE5CD;
        }

        div.member {
            padding: 10px;
            font-size: 1rem;
            width: 400px;
            height: 400px;
            position: relative;
        }

        label.user {
            position: absolute;
            top: 22px;
            left: 95px;
            letter-spacing: 3px;
        }
        label.pw {
            position: absolute;
            top: 110px;
            left: 95px;
            letter-spacing: 3px;
        }

        input.inputform {
            border: 1px solid #B26021;
            margin: 15px;
            border-radius: 0.5rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
            padding: 0 8px 0 8px;
            width:220px;
        }
        input.inputform:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }

        /* 移除瀏覽器預設藍色背景 */
        input.inputform:-webkit-autofill,
        input.inputform:-webkit-autofill:focus {
               -webkit-box-shadow: 0 0 0 30px white inset;
               -webkit-text-fill-color:#B26021;
        }


        label.remember {
               font-size: 0.85rem;
               text-align: center;
               position: absolute;
               top: 190px;
               left: 103px;
               letter-spacing: 1px;

        }

        button.member {
            border-radius: 0.5rem;
            background-color: #B26021;
            color: #FCE5CD;
            border: 1px #B26021;
            width: 220px;
            height: 35px;
            letter-spacing: 3px;
            margin-top: 40px;
            font-size: 1rem;
        }
        button.member:hover {
            background-color: #FCE5CD;
            color:  #B26021;
            transition: all 0.3s;
        }


        p {
            margin-top: 5px;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            font-size: 0.9rem;
        }

        a:hover {
            text-decoration: underline;
            font-size: 1rem;
            color: #B26021;
        }
         button.member:focus{
             outline: none;
         }


    </style>

</head>
<body>

	<jsp:include page="../front_header.jsp"/>

    <div class="title">
        <h4 class="member">會員登入</h4>
        <c:if test="${not empty exMsgs}">
            <div style="color:red" class="error">
                <c:forEach var="message" items="${exMsgs}">
                    ${message}
                </c:forEach>
            </div>
        </c:if>
        <div class="member">
            <form method="post" action="login">
                <label class="user">帳號</label><br>
                <input type="email" name="user" placeholder="請輸入信箱" class="inputform"><br>
                <label class="pw">密碼</label><br>
                <input type="password" name="password" placeholder="請輸入6-12字(含英數字)" minlength="6" maxlength="12"
                    class="inputform"><br>
                <input type="hidden" name="action" value="login">
                <button type="submit" value="login" class="member">登入</button><br>
                <br>
                <p>or</p>
                <a href="${ctxPath}/member/forgetPw.jsp" class="forget">忘記密碼</a>
                <span>|</span>
                <a href="${ctxPath}/member/mem_register.jsp" class="reg">前往註冊</a><br>



        </div>
    </div>




</body>
</html>