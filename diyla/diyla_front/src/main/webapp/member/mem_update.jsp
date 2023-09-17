<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.member.*"%>


<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
<title>會員資訊管理</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>

    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-rounded/css/uicons-thin-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <style>
        * {
            box-sizing: border-box;
            font-family:"jf open 粉圓 1.1";

        }
        body {
            margin: 0;
        }
        div.title {
            width: 800px;
            height: 700px;
            color: #B26021;
            position: relative;
            top:50%;
            left:50%;
            transform: translateX(-50%);
            letter-spacing: 3px;
            margin:50px 0;
            display:flex;
        }
        aside{
            width: 200px;
            border: 1px solid #B26021;
            margin-right:1.5rem;
            border-radius: 6px;
            background-color:snow;
        }
        h4.member{
            margin-top:30px;
            margin-bottom:20px;
            font-weight:bold;
        }
        span.error {
            color:red;
            font-weight:bold;
        }
        div.member {
            border: 1px solid #B26021;
            flex:1;
            padding: 10px 10px 10px 1.5rem;
            font-size: 1rem;
            width: 400px;
            height: 700px;
            position: relative;
            border-radius: 6px;
            background-color:snow;
        }
        input.inputform {
            border: 1px solid #B26021;
            border-radius: 0.3rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
            padding: 0 8px;
            margin-top:5px;
            width:220px;
        }
        input.inputform:focus {
              outline: 1.5px solid #B26021;
              box-shadow: 2px;
        }
        select {
            border: 1px solid #B26021;
            border-radius: 0.3rem;
            font-size: 1rem;
            color: #B26021;
            height: 35px;
            letter-spacing: 1px;
            padding: 0 25px 0 8px;
            margin-top:5px;

        }
        /* 移除瀏覽器預設藍色背景 */
        input.inputform:-webkit-autofill,
        input.inputform:-webkit-autofill:focus {
               -webkit-box-shadow: 0 0 0 30px white inset;
               -webkit-text-fill-color:#B26021;
        }
        button.member {
            border-radius: 0.5rem;
            background-color: #B26021;
            color: #FCE5CD;
            border: 1px #B26021;
            width: 199.33px;
            height: 35px;
            letter-spacing: 3px;
            margin-top: 40px;
            font-size: 1rem;
            position:relative;
            left:58%;
        }
        button.member:hover {
            background-color: #FCE5CD;
            color:  #B26021;
            transition: all 0.3s;
        }
         button.member:focus{
             outline: none;
         }
        p {
            margin-top: 5px;
            margin-bottom: 20px;
        }
        aside > ul{
            margin-top:2rem;
            padding-left:0
        }
        aside > ul >li{
            margin-bottom:1rem;
            list-style:none;
            padding:1rem;
            position:relative;
            width:198px;
            display:block;
        }
        aside > ul >li:hover {

            background:#F1F1F1;
        }
        aside > ul >li>a {
            display:block;
            text-decoration: none;
            color:#B26021;
            width:100%;
            height:100%;
        }
        aside > ul >li>a:hover {
            text-decoration: none;
            color:#B26021;
        }
        i{
            padding-right:0.3rem;
        }
        form > div{
            display:inline-block;
        }
        div.gender{
            position:relative;
            left:25%;
            vertical-align:top;
            line-height: 2.1rem;
        }
        input#address{
            width:283px;
        }
        input[type="radio"]{
            margin-right: 10px;
        }
        input#f{
            margin-left: 40px;
        }
        #a1::before {
            content: "";
            position: absolute;
            top:7px;
            left:0px;
            height: 40px;
            width: 4px;
            background-color: #B26021;
        }
        #a1{
            font-weight:bold;
        }
        .success{
            position:absolute;
            right:80px;
            margin-top:5px;
        }
        select:focus {
            outline:none;
        }
        </style>


</head>
<body>

    <jsp:include page="../front_header.jsp"/>
    <div class="title">

        <aside>
        <ul>
            <li><a  id="a1" href="${ctxPath}/member/update?action=select&memId=${memId}"><i class="fi fi-ts-user-gear"></i>會員資訊管理</a></li>
            <li><a  href="${ctxPath}/member/updatePw.jsp"><i class="fi fi-tr-key-skeleton-left-right"></i>修改密碼</a></li>
            <li><a  href="${ctxPath}/allOrder/allOrder?memId=${memId}"><i class="fi fi-ts-ballot"></i>我的訂單</a></li>
            <li><a  href="${ctxPath}/track/track?memId=${memId}"><i class="fi fi-tr-hand-love"></i>我的商品追蹤</a></li>
            <li><a  href="${ctxPath}/token/MyToken.jsp"><i class="fi fi-ts-piggy-bank"></i>我的代幣</a></li>
            <li><a  href="${ctxPath}/member/login?action=logout"><i class="fi fi-tr-hand-wave"></i>登出</a></li>
        </ul>
        </aside>
        <div class="member">
        <h4 class="member">會員資訊管理</h4>
            <form method="post" action="update" class="member">
                <label>姓名<br>
                <input type="text" name="memName" value="${memVO.memName}" class="inputform"></label><br>
                <span id ="memName.errors" class="error">${exMsgs.memName}<br/></span>
                <label>帳號<br>
                <input type="email" name="user" value="${memVO.memEmail}" disabled class="inputform"></label><br>
                <br>
                <div>
                <label>生日<br>
                <input type="date" name="birthday" id="birthday" value="${memVO.memBirthday}" disabled class="inputform"></label>
                </div>
                <div class="gender">
                    <label for="gender" >性別<br>
                    <input  type="radio" name="gender" value="0" disabled ${(0==memVO.memGender)? 'checked':'' }>男
                    <input id="f" type="radio" name="gender" value="1" disabled ${(1==memVO.memGender)? 'checked':'' }>女</label>
                </div>
                <br><br>
                <label>聯絡電話<br>
                <input type="tel" name="phone" minlength="10" value="${memVO.memPhone}" class="inputform"></label><br>
                <span  id ="memPhone.errors" class="error">${exMsgs.memPhone}<br/></span>
                <div>聯絡地址<br>
                    <label for="city">縣市<br>
                    <select id="city" name="city" ></select></label>
                    <label for="district">地區<br>
                    <select id="district" name="district" ></select></label>
                    <label for="address">
                    <input type="text" id="address" name="address" value="${addMap.address}" class="inputform"></label><br>
                    <span  id ="memAddress.errors" class="error">${exMsgs.memAddress}<br/></span>
                </div>
                <input type="hidden" name="memId" value="${memId}">
                <input type="hidden" name="action" value="update">
                <button type="submit" value="update"  class="member" >送出修改</button><br/>
                <div class="success">${success.success}</div>
            </form>
            </div>
        </div>
    </div>


    <jsp:include page="../front_footer.jsp"/>
    <script>

        window.addEventListener("load",function(){
            let today = new Date().toISOString().split('T')[0];
            document.getElementById('birthday').setAttribute('max',today);
        })

        let cityDistrict = {
            '台北市': ['中正區', '大同區', '中山區', '松山區', '大安區', '萬華區', '信義區', '士林區', '北投區', '內湖區', '南港區', '文山區'],
            '新北市': ['板橋區', '三重區', '中和區', '永和區', '新莊區', '新店區', '樹林區', '鶯歌區', '三峽區', '淡水區', '汐止區', '瑞芳區', '土城區', '蘆洲區', '五股區', '泰山區', '林口區', '深坑區', '石碇區', '坪林區', '三芝區', '石門區', '八里區', '平溪區', '雙溪區', '貢寮區', '金山區', '萬里區', '烏來區'],
            '桃園市': ['桃園區', '中壢區', '大溪區', '楊梅區', '蘆竹區', '龜山區', '八德區', '龍潭區', '平鎮區', '新屋區', '觀音區', '復興區'],
            '台中市': ['中區', '東區', '南區', '西區', '北區', '北屯區', '西屯區', '南屯區', '太平區', '大里區', '霧峰區', '烏日區', '豐原區', '后里區', '石岡區', '東勢區', '和平區', '新社區', '潭子區', '大雅區', '神岡區', '大肚區', '沙鹿區', '龍井區', '梧棲區', '清水區', '大甲區', '外埔區', '大安區', '石洞區', '石里區', '霧峰營區'],
            '台南市': ['中西區', '東區', '南區', '北區', '安平區', '安南區', '永康區', '歸仁區', '新化區', '左鎮區', '玉井區', '楠西區', '南化區', '仁德區', '關廟區', '龍崎區', '官田區', '麻豆區', '佳里區', '西港區', '七股區', '將軍區', '學甲區', '北門區', '新營區', '後壁區', '白河區', '東山區', '六甲區', '下營區', '柳營區', '鹽水區', '善化區', '大內區', '山上區', '新市區', '安定區'],
            '高雄市': ['新興區', '前金區', '苓雅區', '鹽埕區', '鼓山區', '旗津區', '前鎮區', '三民區', '楠梓區', '小港區', '左營區', '仁武區', '大社區', '岡山區', '路竹區', '阿蓮區', '田寮區', '燕巢區', '橋頭區', '梓官區', '彌陀區', '永安區', '湖內區', '鳳山區', '大寮區', '林園區', '鳥松區', '大樹區', '旗山區', '美濃區', '六龜區', '內門區', '杉林區', '甲仙區', '桃源區', '那瑪夏區', '茂林區', '茄萣區'],
            '基隆市': ['仁愛區', '信義區', '中正區', '中山區', '安樂區', '暖暖區', '七堵區'],
            '新竹市': ['東區', '北區', '香山區'],
            '新竹縣': ['竹北市', '竹東鎮', '新埔鎮', '關西鎮', '湖口鄉', '新豐鄉', '峨眉鄉', '寶山鄉', '北埔鄉', '芎林鄉', '橫山鄉', '尖石鄉', '五峰鄉'],
            '苗栗縣': ['苗栗市', '頭份市', '竹南鎮', '後龍鎮', '通霄鎮', '苑裡鎮', '卓蘭鎮', '造橋鄉', '西湖鄉', '頭屋鄉', '公館鄉', '銅鑼鄉', '三義鄉', '大湖鄉', '獅潭鄉', '三灣鄉', '南庄鄉', '泰安鄉'],
            '彰化縣': ['彰化市', '員林市', '和美鎮', '鹿港鎮', '溪湖鎮', '二林鎮', '田中鎮', '北斗鎮', '花壇鄉', '芬園鄉', '大村鄉', '永靖鄉', '伸港鄉', '線西鄉', '福興鄉', '秀水鄉', '埔心鄉', '埔鹽鄉', '大城鄉', '芳苑鄉', '竹塘鄉', '社頭鄉', '二水鄉', '田尾鄉', '埤頭鄉', '溪州鄉'],
            '南投縣': ['南投市', '埔里鎮', '草屯鎮', '竹山鎮', '集集鎮', '名間鄉', '鹿谷鄉', '中寮鄉', '魚池鄉', '國姓鄉', '水里鄉', '信義鄉', '仁愛鄉'],
            '雲林縣': ['斗六市', '斗南鎮', '虎尾鎮', '西螺鎮', '土庫鎮', '北港鎮', '古坑鄉', '大埤鄉', '莿桐鄉', '林內鄉', '二崙鄉', '崙背鄉', '麥寮鄉', '東勢鄉', '褒忠鄉', '臺西鄉', '元長鄉', '四湖鄉', '口湖鄉', '水林鄉'],
            '嘉義市': ['東區', '西區'],
            '嘉義縣': ['太保市', '朴子市', '布袋鎮', '大林鎮', '民雄鄉', '溪口鄉', '新港鄉', '六腳鄉', '東石鄉', '義竹鄉', '鹿草鄉', '水上鄉', '中埔鄉', '竹崎鄉', '梅山鄉', '番路鄉', '大埔鄉', '阿里山鄉'],
            '屏東縣': ['屏東市', '潮州鎮', '東港鎮', '恆春鎮', '萬丹鄉', '長治鄉', '麟洛鄉', '九如鄉', '里港鄉', '鹽埔鄉', '高樹鄉', '萬巒鄉', '內埔鄉', '竹田鄉', '新埤鄉', '枋寮鄉', '新園鄉', '崁頂鄉', '林邊鄉', '南州鄉', '佳冬鄉', '琉球鄉', '車城鄉', '滿州鄉', '枋山鄉', '霧台鄉', '瑪家鄉', '泰武鄉', '來義鄉', '春日鄉', '獅子鄉', '牡丹鄉', '三地門鄉'],
            '宜蘭縣': ['宜蘭市', '羅東鎮', '蘇澳鎮', '頭城鎮', '礁溪鄉', '壯圍鄉', '員山鄉', '冬山鄉', '五結鄉', '三星鄉', '大同鄉', '南澳鄉'],
            '花蓮縣': ['花蓮市', '鳳林鎮', '玉里鎮', '新城鄉', '吉安鄉', '壽豐鄉', '光復鄉', '豐濱鄉', '瑞穗鄉', '富里鄉', '秀林鄉', '萬榮鄉', '卓溪鄉'],
            '台東縣': ['台東市', '成功鎮', '關山鎮', '長濱鄉', '海端鄉', '池上鄉', '東河鄉', '鹿野鄉', '延平鄉', '卑南鄉', '金峰鄉', '大武鄉', '達仁鄉', '綠島鄉', '蘭嶼鄉', '太麻里鄉'],
            '金門縣': ['金城鎮', '金湖鎮', '金沙鎮', '金寧鄉', '烈嶼鄉', '烏坵鄉'],
            '連江縣': ['南竿鄉', '北竿鄉', '莒光鄉', '東引鄉'],
            '澎湖縣': ['馬公市', '湖西鄉', '白沙鄉', '西嶼鄉', '七美鄉', '望安鄉', '吉貝嶼', '鳥嶼']
        };

        let city_el = document.getElementById("city");
        let district_el = document.getElementById("district");


        for ( let city in cityDistrict){
            let option = document.createElement("option");
            option.text = city;
            option.value = city;
            city_el.add(option);
          }
        city_el.value="${addMap.city}";
        city_el.addEventListener("change",function(){

            let districts = cityDistrict[city_el.value];
            // 清空地區選項
            while (district_el.options.length > 0) {
                district_el.remove(0);
            }


            for(let district of districts){
                let option = document.createElement("option");
                option.textContent = district;
                district_el.add(option);
            }
        });
        // 初始化地區選項
        city_el.dispatchEvent(new Event('change'));

        district_el.value="${addMap.district}";






    </script>

</body>


</html>