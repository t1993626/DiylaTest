<%@page import="com.cha102.diyla.tokenModel.TokenService"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.cha102.diyla.member.MemberService"%>
<%@page import="com.cha102.diyla.member.MemVO"%>
<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫付款資訊</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 引入其他所需的 CSS 和 JavaScript 檔案 -->
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">

<style>
.mainContent {
	width: 70%;
	margin: 20px auto;
	padding: 20px;
	border: 1px solid rgba(107, 107, 107, .6);;
	border-radius: 10px;
	box-shadow: 2px 8px 4px 1px rgba(0, 0, 0, 0.1);
}

.orderDetail {
	margin-bottom: 20px;
}

.orderDetail table {
	width: 100%;
	border-collapse: collapse;
}

.orderDetail th, .orderDetail td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.title {
	background-color: #f2f2f2;
}

.total {
	/* 	display: block; */
	padding: 0px;
	background-color: #FFFFDF;
	margin-top: 30px;
	text-align: right;
	font-weight: bold;
	text-align: right;
}

.form-row {
	margin-bottom: 10px;
}

label {
	display: inline-block;
	width: 150px;
	font-weight: bold;
}

input[type="text"], input[type="tel"], select {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.confirmButton {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.confirmButton:hover, #paidByCard:hover {
	background-color: #0056b3;
}

.totalblock {
	float: right;
	background-color: #FFFFDF;
	margin-top: 17px;
	padding: 9px 5px;
	border-radius: 5px;
}

.actualPrice {
	background-color: #ECF5FF;
	padding: 7px 1px;
}

.container {
	border: 1px solid #ccc;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 20px;
}

.title {
	cursor: pointer;
	padding: 15px 10px;
	background-color: #FFE4CA;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	border-radius: 5px;
}

.form-container {
	display: none;
}

.form-container.active {
	display: block;
}

.form-row {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

a.canceled {
	display: inline-block;
	/* 	float: right; */
	padding: 10px 20px;
	border: 1px solid black;
	color: teal;
	background-color: #red;
	border-radius: 4px;
	cursor: pointer;
	border: 1px solid black;
}

a.canceled::hover {
	color: green;
	background-color: #red;
}

#card {
	margin-top: 10px;
	padding: 0px;
}

#paidByCard {
	display: inline-block;
	padding: 10px 20px;
	width: 120px;
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	border: none;
}

.actualPrice {
	float: right;
}

#tokenLabel {
	color: white;
	background-color: black;
	border-radius: 3px;
	padding: 5px 3px;
	left: 10px;
}

.heading {
	text-align: center;
	padding: 20px;
	background-color: #C7C7E2	;
	border-radius: 15px;
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<h1  class="heading">訂購明細</h1>

		<form action="${ctxPath}/memberOrder/OrderController" method="post">
			<div class="orderDetail">
				<table class="detail">
					<tr class="title">
						<td class="subtitle">商品名稱</td>
						<td class="subtitle">單價</td>
						<td class="subtitle">數量</td>
						<td class="subtitle">小計</td>
					</tr>
					<c:forEach var="cartItem" items="${shoppingCartList}">
						<tr class="itemrow">
							<td class="itemInfo comName">${cartItem.comName}</td>
							<td class="itemInfo comPri">${cartItem.comPri}</td>
							<td class="itemInfo comAmount">${cartItem.comAmount}</td>
							<td class="itemInfo">${cartItem.comPri*cartItem.comAmount}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="totalblock">
					<span class="total">總金額:</span> <span class="total"
						id="totalPrice1">${totalPrice}</span> <span class="total">元</span>
				</div>
				<p><hr class="hr1">
				</p>
			</div>

			<div class="tokenblock">
				<p style="margin: 0;">
					目前擁有代幣:<span id="userToken">${maxToken}</span>
				</p>
				<label for="useTokens" style="width: 80px" id="tokenLabel">使用代幣</label>

				<c:choose>
					<c:when test="${totalPrice>=maxToken}">
						<input name="tokenUse" type="number" min="0" max="${maxToken}"
							id="tokenAmount" value="0">
					</c:when>
					<c:otherwise>
						<input name="tokenUse" type="number" min="0" max="${totalPrice}"
							id="tokenAmount" value="0">
					</c:otherwise>
				</c:choose>
				<span class="actualPrice">元</span> <span class="actualPrice"
					id="actualPriceSpan">${totalPrice}</span> <span class="actualPrice">實付金額:</span>
			</div>
			<div class="container">
				<div class="title">+填寫付款資訊</div>
				<div class="form-container">
					<div class="form-row">

						<label for="recipientName">收件人姓名：</label> <input type="text"
							id="recipientName" name="recipient" value="${memVO.memName}">
						<p style="display: block; color: red; padding: 0px 3px;">${errMsg["recipient"]}</div>
					<div c lass="form-row">

						<label for="recipientPhone">收件人電話：</label> <input type="tel"
							id="recipientPhone" name="phone" value="${memVO.memPhone}">
						<p style="display: block; color: red; padding: 0px 3px">${errMsg["phone"]}</p>
					</div>
					<div class="form-row">
						<label for="recipientAddress">收件人地址：</label> <input type="text"
							id="recipientAddress" name="recipientAddress"
							value="${memVO.memAddress}">
						<p style="display: block; color: red; padding: 0px 3px">${errMsg["recipientAddress"]}</p>

					</div>
				</div>
			</div>
			<div class="form-row">
				<label for="paymentMethod">付款方式：</label> <select id="paymentMethod"
					name="paymentMethod" required>
					<option value="cashOnDelivery">貨到付款</option>
					<option value="creditCard">信用卡</option>
				</select>
			</div>
			<input type="hidden" name="action" value="orderConfirm"
				id="actionInput"> <input type="submit" class="confirmButton"
				value="確認" id="orderconfirm"> 
				<button type="button" id="paidByCard">前往付款</button>
				<a href="${ctxPath}/shop/ShoppingCartServlet?action=getAll&memId=${memId}"
				class="canceled">返回購物車</a>
		</form>
		<div id="card">
			<form action="${ctxPath}/checkout/ecpay" method="post" id="cardForm">
				<input type="hidden" name="tokenUse" value="" id="tokenAmountCard">
				<input type="hidden" name="cardrecipient" value="${memVO.memName}"
					id="cardrecipient"> <input type="hidden"
					name="cardrecipientAddress" value="${memVO.memAddress}"
					id="cardrecipientAddress">
				<input type="hidden" name="cardphone" value="${memVO.memPhone}"
					id="cardphone">
				<input type="hidden" name="tradeDesc" value="信用卡付款"> <input
					type="hidden" name="totalPrice" value="${totalPrice}"> <input
					type="hidden" name="itemName" value="商品一批"> <input
					type="hidden" name="memId" value="${memId}">
			</form>
		</div>
	</div>

	<jsp:include page="../front_footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							const formContainer = document
									.querySelector('.form-container');
							//開合付款資訊
							$(".title").click(function() {
								formContainer.classList.toggle('active');
							});
							$("#paymentMethod")
									.change(
											function() {
												const selectedPaymentMethod = $(
														this).val();
												const actionInput = $("#actionInput");
												if (selectedPaymentMethod === "creditCard") {
													actionInput
															.val("orderConfirmCard");
												} else if (selectedPaymentMethod === "cashOnDelivery") {
													actionInput
															.val("orderConfirm");
												}
											});
							// 預設隱藏信用卡付款表單
							$("#paidByCard").hide();

							// 監聽付款方式選擇變化
							$("#paymentMethod").change(function() {
								const selectedPaymentMethod = $(this).val();

								// 如果選擇的是信用卡，顯示信用卡付款表單；否則隱藏
								if (selectedPaymentMethod === "creditCard") {
									$("#paidByCard").show();
									$(".confirmButton").hide();
								} else {
									$("#paidByCard").hide();
									$(".confirmButton").show();
								}
							});

							$("#paidByCard")
									.click(
											function(event) {
												if (!validateFormFields()) {
													event.preventDefault();
												} else {
													document
															.getElementsByName("itemName")[0].value = "DIYLA商品一批";
													document.getElementById(
															"cardForm")
															.submit();
												}
											});

							$("#orderconfirm").click(function(event) {
								if (!validateFormFields()) {
									event.preventDefault();
								}
							});

							$(
									"#recipientName, #recipientPhone, #recipientAddress, #tokenAmount")
									.on(
											"input",
											function() {
												// 獲取收件人相關欄位的值
												const recipient = $(
														"#recipientName").val();
												const recipientPhone = $(
														"#recipientPhone")
														.val();
												const recipientAddress = $(
														"#recipientAddress")
														.val();
												const token = $("#tokenAmount").val();
												

												// 將收件人值填入下面表單的對應欄位
												$("#cardrecipient").val(
														recipient);
												$("#cardrecipientAddress").val(
														recipientAddress);
												$("#cardphone").val(
														recipientPhone);
												$("#tokenAmountCard")
														.val(token);
											});

							function validateFormFields() {
								const recipientName = $("#recipientName").val();
								const recipientPhone = $("#recipientPhone")
										.val();
								const recipientAddress = $("#recipientAddress")
										.val();
								const phoneRegex = /^09\d{8}$/; // 電話號碼需以 "09" 開頭，總共 10 位數

								if (recipientName.trim() === "") {
									Swal.fire({
										icon : 'error',
										title : '錯誤',
										text : '請填寫收件人姓名'
									});
									return false;
								}

								if (!phoneRegex.test(recipientPhone)) {
									Swal.fire({
										icon : 'error',
										title : '錯誤',
										text : '請填寫正確的電話號碼，需以 09 開頭且總共 10 位數'
									});
									return false;
								}

								if (recipientAddress.trim() === "") {
									Swal.fire({
										icon : 'error',
										title : '錯誤',
										text : '請填寫收件人地址'
									});
									return false;
								}
								return true;
							}
							const tokenAmountInput = document
									.getElementById("tokenAmount");
							const maxTokenValue = tokenAmountInput
									.getAttribute("max");
							if (maxTokenValue == null || maxTokenValue == ""
									|| maxTokenValue == "null"
									|| maxTokenValue == "0") {
								tokenAmountInput.setAttribute("max", "0");
								tokenAmountInput.value = "0"; // 設置輸入框的值為 0
								tokenAmountInput.disabled = true; // 禁用輸入框
							}

						});
	</script>
	<script>
		// 		$(document).ready(function() {
		// 			const tokenAmountInput = $("#tokenAmount");
		// 			const maxToken = $("#userToken");

		// 			// 監聽輸入
		// 			tokenAmountInput.on("input", function() {
		// 				const currentValue = parseInt(tokenAmountInput.val());

		// 				if (currentValue > maxToken) {
		// 					tokenAmountInput.val(maxToken); // 超過上限則設為上限值
		// 				}
		// 			});
		// 		});
	</script>
	<script>
		// 抓取相關元素
		const tokenAmountInput = document.getElementById("tokenAmount");
		const actualPriceSpan = document.getElementById("actualPriceSpan");
		const totalPrice = document.getElementById("totalPrice1");
		const maxToken = document.getElementById("userToken");

		//監聽輸入
		tokenAmountInput.addEventListener("input", function() {
			// 取得使用量輸入
			let tokenAmount = parseInt(tokenAmountInput.value);
			let maxTokens = parseInt(maxToken.textContent);
			console.log(tokenAmount);
			console.log(maxTokens);
			// 確保不超過max
			if (tokenAmount >= maxTokens) {
				tokenAmountInput.value = maxTokens; // 限制输入框的值
				tokenAmount = maxTokens; // 更新 tokenAmount 的值
			}
			const total = parseInt(totalPrice.textContent);
			// 計算 最低為0
			const discountedPrice = Math.max(0, total - tokenAmount);

			// 更新金額
			actualPriceSpan.textContent = discountedPrice;
		});
	</script>

</body>
</html>
