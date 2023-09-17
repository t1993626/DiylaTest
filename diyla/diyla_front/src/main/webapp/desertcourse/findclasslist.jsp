<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
            <jsp:include page="/front_header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>甜點課程列表</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/findclasslist.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <style> 
        #courseContainer{
    width: 80%;
    justify-content: space-between; /* 在上下空间中垂直居中 */
    align-items: center; /* 在水平方向上居中 */
}
#pageContent{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.title-tag {
    position: relative;
    padding: 1rem 2rem calc(1rem + 10px);
    background: #ffd9b3;
  }
  .title-tag:before {
    position: absolute;
    top: -7px;
    left: -7px;
    width: 100%;
    height: 100%;
    content: '';
    border: 4px solid #000;
  }
  #courseCatContainer {
    margin-bottom: 5vh;
    
    width: 80%;
  }
    #courseCatContainer .nav-item{
    width: calc(100% / 11);
    text-align: center;
    border-style:outset;
    border-radius: 1vw;    
    background: rgb(237,226,135);
    background: linear-gradient(0deg, rgba(237,226,135,1) 0%, rgba(238,205,138,1) 100%);
    margin: 1vw;
    }
    #courseCatContainer .nav-item:hover .nav-link {
    background-color: #f2f2f2;
    }

    #courseCatContainer .nav-item .nav-link{
        border-radius: 1vw;
        transition: background-color 1s ease;
        color: brown;
        white-space: nowrap;
    }
    li:hover.three {
      background-color: white;
    }

    li:hover.two {
      background-color: white;
    }

    li:hover.one {
      background-color: white;
    }
    .card-title{
        color: brown;
        font-weight: bold;
    }
    </style>
</head>

<body>


<section id="navibar">
<jsp:include page="/desertcourse/navibar.jsp" />
</section>
<div id="pageContent">
    <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
        <h2 id="title" class="title-tag" >甜點課程列表</h2>
    </div>

    <div id="courseCatContainer">
    <ul class="nav justify-content-center">
        <li class="nav-item">
          <a class="nav-link active categoryTab" data-category="-1" aria-current="page" href="#">全部</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active categoryTab" data-category="0" aria-current="page" href="#">糖果</a>
        </li>
        <li class="nav-item">
          <a class="nav-link categoryTab" data-category="1" href="#">蛋糕</a>
        </li>
        <li class="nav-item">
          <a class="nav-link categoryTab" data-category="2" href="#">餅乾</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="3" href="#">麵包</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="4" href="#">法式點心</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="5" href="#">中式甜點</a>
        </li>
        <li class="nav-item">
            <a class="nav-link categoryTab" data-category="6" href="#">其它</a>
        </li>
      </ul>
    </div>
<div id= "courseContainer">
</div>
</div>
    <div id="footer">
        <jsp:include page="/front_footer.jsp" />
    </div>
</body>
<script>
    $(document).ready(function() {
    function loadCourses(catId = -1) {
    $.ajax({
        url: '${ctxPath}/getDesertCourse',
        method: 'GET',
        data: { categoryId: catId },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: 'json',
        success: function (data) {
            var courseContainer = $('#courseContainer');
            $('#courseContainer').empty();
            var rowContainer = $('<div class="row"></div>');
            data.forEach(function (course, index) {
                var courseCardHtml = '<div class="col-md-4 col-sm-6 col-lg-4 wow fadeInUp">'; 
                courseCardHtml += '<div class="card shadow-sm">';
                courseCardHtml += '<img style="height: 40vh;"class="card-img-top" src="data:image/jpeg;base64,' + course.coursePic + '" alt="' + course.courseName + '">';
                courseCardHtml += '<div class="card-body">';
                courseCardHtml += '<h5 class="card-title">' + course.courseName + '</h5>';
                courseCardHtml += '<p class="card-text">上課時間: ' + course.courseDate + " " + course.courseSeq + '</p>';
                courseCardHtml += '<p class="card-text">報名截止日期: ' + course.regEndDate + '</p>';
                var courseIntro = course.courseIntro.length > 20 ? course.courseIntro.substring(0, 16) + '...' : course.courseIntro;
                courseCardHtml += '<p class="card-text">課程簡介: ' + courseIntro + '</p>';
                courseCardHtml += '<button class="detailButton btn btn-primary" data-courseid='+ course.courseId+'>課程詳情</button>'
                courseCardHtml += '</div>';
                courseCardHtml += '</div>';
                courseCardHtml += '</div>';
                rowContainer.append(courseCardHtml);

                if ((index + 1) % 3 === 0 || index === data.length - 1) {
                    rowContainer.css('margin-bottom', '5vh');
                    courseContainer.append(rowContainer);
                    rowContainer = $('<div class="row"></div>');
                }

            });
        },
        error: function () {
            console.log('Error fetching course data');
            }
        });
    }
        loadCourses();
        $('#courseCatContainer').on('click', '.categoryTab', function(){
            var category = $(this).data('category');
            loadCourses(category);
        });
        $('#courseContainer').on('click', '.detailButton', function(){
        var courseId = $(this).data('courseid');
        window.location.href = 'classdetail.jsp?id=' + courseId;
    });
    });
</script>
</html>
