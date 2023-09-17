<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService"%>
<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cha102.diyla.commodityOrder.CommodityOrderVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>訂單查詢</title>

<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.5/css/dataTables.jqueryui.min.css" />
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
	text-align: center;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: center;
}

.btn {
	cursor: pointer;
}

#main_content {
	min-height: 600px;
	padding-top: 50px;
	width: 100%;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.swal-button-container {
	justify-content: center;
}

.swal-footer {
	text-align: center;
}

.heading {
	width: 100%;
	text-align: center;
	margin-bottom: 20px;
	font-size: 25px;
	padding: 25px 10px;
	background-color: #FFEEDD;
	border-radius: 5px;
}

.status {
	visibility: hidden;
}

.status-unpaid {
	background-color: #FFCC00; /* 未結帳的顏色 */
}

.status-processing {
	background-color: #3399FF; /* 備貨中的顏色 */
}

.status-paid {
	background-color: #A6FFA6; /*已付款的顏色*/
}

.status-shipping {
	background-color: #FF79BC; /*出貨*/
}

.status-completed {
	background-color: #66FF66; /* 已完成的顏色 */
}

.status-canceled {
	background-color: #FF3333; /* 已取消的顏色 */
}
.status-canceling{
	background-color: #FF9797;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tr_title {
	background-color: #8080C0;
	color: white;
}

.title th {
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.order_content_title td {
	padding: 10px;
	text-align: center;
	font-size: 16px;
}

.order_content {
	padding: 10px;
	text-align: center;
}

.noneOrder {
	font-size: 40px;
	text-align: center;
}

.status {
	padding: 5px 10px;
	background-color: #e0e0e0;
	border-radius: 5px;
	font-weight: bold;
}

form {
	display: inline;
}

.cancel_order {
	background-color: #d9534f;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.cancel_order:hover {
	background-color: #c9302c;
}

.shopLink {
	display: inline-block;
	padding: 30px 60px;
	border: 2px solid #ccc;
	border-radius: 5px;
	text-decoration: none;
	color: #333;
	box-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
	transition: transform 0.2s, box-shadow 0.2s;
	margin-bottom: 50px;
}

.shopLink:hover {
	transform: scale(1.05);
	box-shadow: 5px 5px 8px rgba(0, 0, 0, 0.5);
}

div.goShopping {
	text-align: center;
	padding-top: 50px;
}

#memberOrder {
	border-radius: 3px;
	box-shadow: 8px;
}

.noneOrder {
	padding-bottom: 50px;
}

.orderTable {
	border: 1px solid black;
}

#showDetail {
	border-radius: 5px;
	background-color: #84C1FF;
	color: white;
	border: none;
	padding: 8px 3px;
}

.goTopButton {
	z-index: 999;
	position: fixed;
	bottom: 20px;
	padding: 10px;
	border: none;
	outline: none;
	background-color: #333;
	color: white;
	cursor: pointer;
	border-radius: 4px;
	right: 20px;
}

.goTopButton:hover {
	background-color: #555;
}

p.discounted {
	text-decoration: line-through !important;
}

p.hidden-actual-price {
	display: none !important;
}

.orderPrice, .actualPrice {
	margin: 0px;
	padding: 0px;
}

#memberOrder_wrapper {
	border: 1px solid rgba(128, 128, 128, 0.5);
	box-shadow: 5px;
	padding: 30px 15px;
	border-radius: 5px;
	box-shadow: 3px 2px rgb(107,107,107,0.6);
}

.subbar {
	width: 100px;
	
}

.barblcok {
	margin-bottom: 5px;
	background-color: #ECECFF;
	padding: 20px 5px;
	border-radius: 8px;
	width: 300px;
	white-space: nowrap;
}
a.subbarlink{
color: black;
font-size: 18px;
}
a.subbarlink:hover {
	color:blue;
}
tr:nth-child(even) {
    background-color: #f2f2f2 !important; 
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div id="main_content">
		<div class="barblcok">
			<span id="memberInfo" class="subbar"><a href="${ctxPath}/member/update?action=select&memId=${memId}" class="subbarlink">會員資訊管理</a></span>> <span
				id="orderitem" class="subbar"><a  href="${ctxPath}/allOrder/allOrder?memId=${memId}" class="subbarlink">我的訂單</a></span>> <span
				id="shoporder" class="subbar"><a  href="${ctxPath}/memberOrder/OrderController?action=listOrder&memId=${memId}" class="subbarlink">商店訂單</a></span>
		</div>
		<p class="heading">
		<svg fill="#000000" xmlns="http://www.w3.org/2000/svg" width="36px" height="36px" viewBox="0 0 52 52" enable-background="new 0 0 52 52" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M39.3,26.9c0,1-0.9,1.9-1.9,1.9H14.6c-1,0-1.9-0.9-1.9-1.9V25c0-1,0.9-1.9,1.9-1.9h22.9c1,0,1.9,0.9,1.9,1.9 v1.9H39.3z M35.5,38.3c0,1-0.9,1.9-1.9,1.9h-19c-1,0-1.9-0.9-1.9-1.9v-1.9c0-1,0.9-1.9,1.9-1.9h19.1c1,0,1.9,0.9,1.9,1.9v1.9H35.5z M12.7,13.5c0-1,0.9-1.9,1.9-1.9h19.1c1,0,1.9,0.9,1.9,1.9v1.9c0,1-0.9,1.9-1.9,1.9H14.6c-1,0-1.9-0.9-1.9-1.9 C12.7,15.4,12.7,13.5,12.7,13.5z M41.2,4H10.8C7.6,4,5,6.6,5,9.7v32.4c0,3.1,2.6,5.7,5.7,5.7h30.5c3.1,0,5.7-2.6,5.7-5.7V9.7 C47,6.6,44.4,4,41.2,4z"></path> </g></svg>
			商店訂單一覽
			</h1>
		<c:choose>
			<c:when test="${not empty commodityOrderVOList}">
				<div id="orderTable">
					<table id="memberOrder">
						<thead>
							<tr class="tr_title">
								<th class="title" style="width: 80px;">訂單編號</th>
								<th class="title" style="width: 100px;">訂單金額</th>
								<th class="title" style="width: 100px;">訂單狀態</th>
								<th class="title" style="width: 150px;">下單時間</th>
								<th class="title" style="width: 180px;">收件地址</th>
								<th class="title" style="width: 110px;">查看明細</th>
								<th class="title" style="width: 110px;">訂單處理</th>
								<th class="title" style="width: 30px;">代幣使用</th>

							</tr>
						</thead>

						<tbody id="order-list">
							<c:forEach var="orderVO" items="${commodityOrderVOList}"
								varStatus="loop">
								<tr class="order_content_title">
									<td class="order_content">${orderVO.orderNO}</td>
									<td class="order_content">

										<p class="orderPrice">$${orderVO.orderPrice}</p>
										<p class="actualPrice">$${orderVO.actualPrice}</p>
									</td>
									<td class="order_content orderStatus"><span class="status">${orderVO.orderStatus}</span></td>
									<td class="order_content"><fmt:formatDate
											value="${orderVO.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td class="order_content">${orderVO.recipientAddress}</td>
									<td class="order_content" class="orderAction">
										<form action="${ctxPath}/memberOrder/OrderController"
											method="post">
											<input name="action" value="showDetail" type="hidden">
											<input name="orderNO" value="${orderVO.orderNO}"
												type="hidden">
											<button type="submit" id="showDetail">查看明細</button>

										</form>
									</td>

									<td>
										<form action="${ctxPath}/memberOrder/OrderController"
											method="post" id="form${loop.index}">
											<input name="action" value="cancelOrder" type="hidden">
											<input name="orderNO" value="${orderVO.orderNO}"
												type="hidden">
											<button type="submit" class="cancel_order"
												data-order-status="${orderVO.orderStatus}
											form="form${loop.index}">
										取消訂單</button></form>
									</td>
									<td class="discountSymbol">${orderVO.discountPrice}</td>
								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
			</c:when>
			<c:otherwise>

				<div class="noneOrder">尚未有購買紀錄</div>
				<div class="goShopping">
					<a class="shopLink"
						href="${ctxPath}/shop/CommodityController?action=listAll"> <span
						style="font-size: 30px;">去商店選購</span> <br> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"
							version="1.1" id="Capa_1" width="100px" height="100px"
							viewBox="0 0 902.86 902.86" xml:space="preserve">
					<g>
					<g>
					<path
								d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z" />
					<path
								d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z" /></g></g>
		</svg></a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<button class="goTopButton">▲</button>
	<jsp:include page="../front_footer.jsp" />
	<script
		src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(document).ready(function() {
		
		$(window).scroll(function() {
			if ($(this).scrollTop() > 20) {
				$(".goTopButton").fadeIn();
			} else {
				$(".goTopButton").fadeOut();
			}
		});

		$(".goTopButton").click(function() {
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
			return false;
		});
		 $(".cancel_order").on("click", function(e) {
					e.preventDefault();
					  let form = $(this).closest("form"); // 找到最近的父級 form
					  var orderStatus = parseInt($(this).data('order-status'));
					  console.log(orderStatus);
					  if (orderStatus === 3) {
						  swal({
							    title: "商品已出貨，無法取消訂單",
							    icon:"error",
							    buttonsStyling: false,
							    confirmButtonClass: 'btn btn-primary btn-block'
							});
				            return;
				        }
					  if (orderStatus == 4||orderStatus==5) {
						  swal({
							    title: "訂單已完成，無法取消訂單",
							    icon:"error",
							    buttonsStyling: false,
							    confirmButtonClass: 'btn btn-primary btn-block'
							});
				            return;
				        }
					  if (orderStatus == 6) {
						  swal({
							    title: "申請已送出，請耐心等候",
							    icon:"warning",
							    buttonsStyling: false,
							    confirmButtonClass: 'btn btn-primary btn-block'
							});
				            return;
				        }
					swal({
						title : "確定取消訂單?",
						 text: "取消代幣將無法退回。",		
						icon : "warning",
						buttons : true,
						 buttonsStyling: false,
						 confirmButtonClass: 'btn btn-primary btn-block'
					}).then((cancel)=>{
						if(cancel){
							 Swal.fire({
						            title: '取消申請已送出',
						            icon: 'success',
						            timer: 1000, // 顯示成功提示 1 秒
						            showConfirmButton: false
						        }).then(() => {
						            setTimeout(() => {
						                form.submit();
						            }, 1000);
						        });
						    }
				});
				});

		  
		  const statusMapping = {
				  "0" : "訂單成立",
					"1" : "已付款",
					"2" : "備貨中",
					"3" : "已出貨",
					"4" : "已完成",
					"5" : "已取消",
					"6" : "審核中"
			    };
			    // 找到所有的訂單狀態欄位
		  $(".orderStatus").each(function() {
		        const orderStatus = $(this).text().trim(); // 取得表格內容的文字，並移除前後空白
		        const textStatus = statusMapping[orderStatus]; // 取得對應的文字狀態
		        $(this).text(textStatus); // 將文字狀態設定回表格欄位
		        if (orderStatus === "0") {
		            $(this).addClass("status-unpaid");
		            
		        }else if (orderStatus === "1") {
		            $(this).addClass("status-paid");
		        }else if (orderStatus === "2") {
		            $(this).addClass("status-processing");
		        }else if (orderStatus === "3") {
		            $(this).addClass("status-shipping");
		        }else if (orderStatus === "4") {
		            $(this).addClass("status-completed");
		        }else if (orderStatus === "5") {
		            $(this).addClass("status-canceled");
		        }else if (orderStatus === "6") {
					$(this).addClass("status-canceling");
				}
		    });
			    

		  $(".discountSymbol").each(function () {
		        const $cell = $(this);
		        //獲得discountPrice值
		        const discountPrice = parseInt($cell.text());
		        const $td = $cell.closest("td");
				//有用代幣就打勾 沒用打x
		        if (discountPrice == 0) {
		            $cell.text("❌"); // X
		        } else {
		            $cell.text("✅"); // 打勾
		        }
		    });


		    });
		 
</script>
	<script>
		$(document).ready(function() {$("#memberOrder").DataTable(
			{
				"lengthMenu" : [   10 ],
				"searching" : true, //搜尋功能, 預設是開啟
				"paging" : true, //分頁功能, 預設是開啟
				"ordering" : true, //排序功能, 預設是開啟
				"language" : {
				"processing" : "處理中...",
				"loadingRecords" : "載入中...",
				"lengthMenu" : "顯示 _MENU_ 筆結果",
				"zeroRecords" : "沒有符合的結果",
				"info" : "顯示第 _START_ 至 _END_ 筆結果，共<font color=red> _TOTAL_ </font>筆",
				"infoEmpty" : "顯示第 0 至 0 筆結果，共 0 筆",
				"infoFiltered" : "(從 _MAX_ 筆結果中過濾)",
				"infoPostFix" : "",
				"search" : "搜尋:",
				"paginate" : {
				"first" : "第一頁",
				"previous" : "上一頁",
				"next" : "下一頁",
				"last" : "最後一頁"
					},
					"aria" : {
						"sortAscending" : ": 升冪排列",
						"sortDescending" : ": 降冪排列"
													}
												},
												//讓分頁也渲染
												 "drawCallback": function (settings) {
												        handlePrice();
												        handleOrderPrice();
												    }

											});
		function handlePrice() {
		    const actualPriceElements = document.querySelectorAll('.actualPrice');
		    const orderPriceElements = document.querySelectorAll('.orderPrice');
		    actualPriceElements.forEach(function (element) {
		        const actualPrice = element.textContent;
		        const orderPriceElement = element.previousElementSibling; 
		        const orderPrice =orderPriceElement.textContent;
		        console.log(actualPrice);
		        console.log(orderPrice);
		        if (actualPrice == orderPrice) {
		            element.classList.add('hidden-actual-price');
		        }
		    });
		}

		function handleOrderPrice() {
		    const orderPriceElements = document.querySelectorAll('.orderPrice');
		    orderPriceElements.forEach(function (element) {
		        const orderPrice = element.textContent;
		        const actualPrice = element.nextElementSibling.textContent;
		        if (actualPrice != orderPrice) {
		            element.classList.add('discounted');
		        }
		    });
		}
		   handlePrice();
		    handleOrderPrice();
						});
</script>

</body>
</html>
