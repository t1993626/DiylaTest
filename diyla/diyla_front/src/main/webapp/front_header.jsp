<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <!-- Basic -->
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">

    <title>
        DIYLA
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
    <script src="${ctxPath}/js/axios/axios.min.js"></script>
    <style>
        .cartQuantity {
            position: absolute;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            right: -9px;
            top: -8px;
        }
        .dropdown-content {
          display: none;
          position: absolute;
          min-width: 400px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          z-index: 1;
          top:195px;
          right:50px;
          border-radius: 0.5rem;
          border-bottom:0px;
          background-color: snow !important ;
        }

        .dropdown-content p {
          color:#B26021;
          padding: 10px;
          margin: 0;
          width:500px;
          border-radius: 0.5rem;
          background-color: snow;
          border:0px !important;
        }
        .dropdown-content p:hover {
            background-color:#F1F1F1;
        }
    </style>
</head>

<body onload="connect();" onunload="disconnect();">
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="${ctxPath}/index.jsp">
                <img src="${ctxPath}/images/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                    <li class="nav-item ">
                        <a class="nav-link" href="${ctxPath}/latestnews/lat.jsp">最新消息
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="${ctxPath}/aboutus/aboutus.jsp">關於我們
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/diyOrder/Front.jsp">
                            DIY體驗
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/desertcourse/findclasslist.jsp">
                            甜點課程
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/shop/CommodityController?action=listAll">
                            商店
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/art/ArtController?action=selectAll">
                            社群分享
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/pbm/pbm.jsp">
                            常見問題
                        </a>
                    </li>
                </ul>
                <div class="user_option">
                    <c:choose>
                        <c:when test="${empty memVO}">
                            <a href="${ctxPath}/member/mem_login.jsp">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>登入</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div>
                                <a href="${ctxPath}/member/update?action=select&memId=${memId}">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <span>${memVO.memName}你好</span>
                                </a>
                            </div>
                            <div onclick="toggleNotifications();">
                                <i class="fa fa-bell" aria-hidden="true" style="color:#FCE5CD;"></i>
                                <span class="badge" id="notification-count"></span>
                            </div>
                            <div class="dropdown-content" id="notification-dropdown" onclick="toggleNotifications();">

                            </div>
                            <a href="${ctxPath}/shopR/getlist/${memId}" id="shoppingcart"
                               class="position-relative">

                                <svg fill="#fce5cd" height="28px" width="28px" version="1.1" id="Layer_1"
                                     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                     viewBox="0 0 512.004 512.004" xml:space="preserve" stroke="#fce5cd"><g
                                        id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                                    <g id="SVGRepo_iconCarrier">
                                        <g>
                                            <g>
                                                <circle cx="153.6" cy="448.004" r="12.8"></circle>
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <circle cx="409.6" cy="448.004" r="12.8"></circle>
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M499.2,435.204h-26.889c-5.931-29.21-31.744-51.2-62.711-51.2c-30.959,0-56.781,21.99-62.711,51.2H216.277 c-5.726-28.015-29.824-49.229-59.179-50.85l-42.035-283.827c-0.401-2.722-1.673-5.222-3.61-7.177l-89.6-89.6 C16.853-1.25,8.755-1.25,3.754,3.75c-5,5-5,13.099,0,18.099l86.613,86.596l41.421,279.62 c-24.559,8.951-42.189,32.29-42.189,59.938c0,35.345,28.655,64,64,64c30.959,0,56.781-21.99,62.711-51.2h130.577 c5.931,29.21,31.753,51.2,62.711,51.2s56.781-21.99,62.711-51.2H499.2c7.074,0,12.8-5.726,12.8-12.8 C512,440.93,506.274,435.204,499.2,435.204z M153.6,486.404c-21.171,0-38.4-17.229-38.4-38.4c0-21.171,17.229-38.4,38.4-38.4 c21.171,0,38.4,17.229,38.4,38.4C192,469.175,174.771,486.404,153.6,486.404z M409.6,486.404c-21.171,0-38.4-17.229-38.4-38.4 c0-21.171,17.229-38.4,38.4-38.4s38.4,17.229,38.4,38.4C448,469.175,430.771,486.404,409.6,486.404z"></path>
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M506.837,138.185c-4.838-6.409-12.407-10.18-20.437-10.18H171.52c-7.424,0-14.473,3.217-19.337,8.823 s-7.057,13.047-5.999,20.395l25.6,179.2c1.792,12.612,12.595,21.982,25.335,21.982H435.2c11.426,0,21.478-7.578,24.619-18.569 l51.2-179.2C513.22,152.913,511.675,144.602,506.837,138.185z M435.2,332.804H197.12l-25.6-179.2H486.4L435.2,332.804z"></path>
                                            </g>
                                        </g>
                                    </g></svg>
                                <span class="cartQuantity text-white bg-warning" id="cartQuantity"
                                      data-memid="<%=session.getAttribute("memId")%>">0</span>
                            </a>

                        </c:otherwise>
                    </c:choose>
                    <%--可自行更改href連結--%>
                    <form class="form-inline ">
                    </form>
                </div>
            </div>
        </nav>
    </header>

    <!-- end header section -->
</div>
<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="${ctxPath}/js/custom.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js"></script>
<script>

    $("#shoppingcart").click(function (e) {
        let memVO = <%=session.getAttribute("memVO")%>;
        if (memVO == null) {
            e.preventDefault();
            Swal.fire({
                icon: 'warning',
                title: '請登入',
                text: '您需要登入才能使用購物車。',
                confirmButtonText: '前往登入',
                allowOutsideClick: false
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = './member/mem_login.jsp';
                }
            });
        }

    });

    $("#myOrder").click(function (e) {
        let memVO = <%=session.getAttribute("memVO")%>;
        if (memVO == null) {
            e.preventDefault();
            Swal.fire({
                icon: 'warning',
                title: '請登入',
                text: '您需要登入才能查看訂單。',
                confirmButtonText: '前往登入',
                allowOutsideClick: false
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = './member/mem_login.jsp';
                }
            });
        }
    });
</script>
<script>
    $(document).ready(function () {
        updateCartQuantity();
    });

    function updateCartQuantity() {

        let cartQuantitySpan = $("#cartQuantity");
        let memId = cartQuantitySpan.data("memid");
        console.log(cartQuantitySpan);
        console.log(memId);

// if (memId !== undefined && memId !== null) {
        $.ajax({
            url: "/diyla_front/shopR/getCartQuantity",
            type: "POST",
            data: JSON.stringify({memId: memId}),
            contentType: "application/json",
            dataType: "json",
            success: function (data) {
                console.log("Total Quantity:", data.totalQuantity);
                if (data.totalQuantity == 0 || data.totalQuantity == null) {
//                 cartQuantitySpan.text(""); //為0或null就隱藏

                    cartQuantitySpan.hide();
                } else {
                    cartQuantitySpan.text(data.totalQuantity); // 有則設定數量
                    cartQuantitySpan.show();
                }
            },
            error: function (error) {
                console.error("Error fetching cart quantity:", error);
            }
        });
// }
    }

</script>

<script>
    let host = window.location.host;
    let path = window.location.pathname;
    let webCtx = path.substring(0, path.indexOf('/', 1));
    let endPointURL = "ws://" + host + webCtx + "/NoticeWS/${memId}";
    let webSocket;


    function connect() {
        webSocket = new WebSocket(endPointURL);

        webSocket.onopen = function (event) {
            console.log("Connect Success");
        }

        webSocket.onmessage = function (event){
            let dropDN = document.querySelector("#notification-dropdown");
            let jsonObj = JSON.parse(event.data);
            console.log(jsonObj);
            addListener();
            dropDN.addEventListener("load",function(){
				setTimeout("loadNotice()",10000)
				})
            getNotices();
        }

        function addListener() {
            let jsonObj = {
                "message": "get"
            }
            webSocket.send(JSON.stringify(jsonObj));
        }

    };
	function loadNotice(){location.href+" #notification-dropdown"}
    function disconnect() {
        console.log("disconnect");
        webSocket.close();
    }

    //let notificationCount = 0; //重整時又會從0開始
    let notices = null;


    function toggleNotifications() {
        const dropdown = document.getElementById('notification-dropdown');
        if (dropdown.style.display === 'block') {
            dropdown.style.display = 'none';
            for (let i = 0; i < notices.length; i++) {
                if(notices[i].noticeStatus === 0){
                    console.log(notices[i].noticeNo);
                    let data = {
                        noticeNo:notices[i].noticeNo
                    };
                    fetch("${ctxPath}/notice/updateStatus", {
                        method: "post",
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(data)
                    }).then(function (response) {
                        if(response.ok){
                            console.log(response);
                            console.log("success");
                            let notificationCount = 0; // 重置通知
                            document.getElementById('notification-count').textContent = notificationCount;
                        }else{
                            console.log("ng");
                        }
                    }).catch(error => {
                            console.log("error");
                    });
                    }
                }

        } else {
            dropdown.style.display = 'block';
        }
    }

    function getNotices() {
        axios.get("${ctxPath}/notice/get/${memId}").then((res) => {

            notices = res.data;
            console.log(notices)
            let noticeLength = 0;
            let maxNotice = 5;
            $('#notification-dropdown').empty();
            for (let i = 0; i < notices.length && i<maxNotice; i++) {
                let htmlParagraphElement = document.createElement('p');
                htmlParagraphElement.textContent = notices[i].noticeTitle+"\n"+notices[i].noticeTime;
                $('#notification-dropdown').append(htmlParagraphElement);
                if (notices[i].noticeStatus === 0) {
                    noticeLength += 1;
                }
            }

            $('#notification-count').html(noticeLength);
        })
    }

</script>
</body>

</html>
