<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.text.SimpleDateFormat" %>
      <%@ page import="java.util.List" %>
        <%@ page import="java.util.Date" %>
          <%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherVO" %>
            <%@ page import="com.cha102.diyla.sweetclass.teaModel.TeacherService" %>
              <%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
                <%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
                  <!DOCTYPE html>
                  <html lang='en'>

                  <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>課程行事曆</title>
                    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
                    <meta name="keywords" content="" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
                      <link rel="stylesheet" type="text/css"
                        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
                    </script>
                    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css.map" />
                    <!-- Custom styles for this template -->
                    <link href="${ctxPath}/css/style.css" rel="stylesheet" />
                    <!-- responsive style -->
                    <link href="${ctxPath}/css/responsive.css" rel="stylesheet" />
                    <link rel="stylesheet" type="text/css" href="${ctxPath}/desertcourse/css/desertcourse_style.css" />
                    <script>

                      document.addEventListener('DOMContentLoaded', function () {
                        var calendarEl = document.getElementById('calendar');
                        var calendar = new FullCalendar.Calendar(calendarEl, {
                          initialView: 'dayGridMonth',
                          events: '${ctxPath}' + '/getAllCourse',
                          eventClick: function (info) {
                            var courseId = info.event.id;
                            window.location.href = '${ctxPath}' + '/desertcourse/coursedetail.jsp?courseid=' + courseId;
                          },
                          eventContent: function (arg) {
                              var startTime = arg.event.start;
                              var timeCategory = getTimeCategory(startTime);
                              
                              // 只顯示早上/下午/晚上之一，根據時間分類
                              var timeHtml = '<div class="event-item"><div class="event-time">' + timeCategory + '</div>';
                              var titleHtml = '<div class="event-title">' + arg.event.title + '</div></div>';
                              
                              return { html: timeHtml + titleHtml };
                          }
                        });
                        calendar.render();
                      });
                      function getTimeCategory(startTime) {
                        var hour = startTime.getHours();
                        if (hour >= 6 && hour < 12) {
                            return '早上 ';
                        } else if (hour >= 12 && hour < 18) {
                            return '下午 ';
                        } else {
                            return '晚上 ';
                        }
                    }
                    </script>
                    <style>
                    .event-time{
                      margin-right: 10px;
                      font-size: 1rem;
                      font-weight:bold;
                      color:brown;
                      white-space: nowrap;
                    }
                    .event-title{
                      font-size: 1rem;
                      color:black;
                      
                    }
                    .event-item{
                      display:flex;
                      flex-direction: row;
                      width: 100%;
                      margin-right: 10px;
                      white-space: wrap;
                      border-radius: 5px;
                      background: #a3a3c2;
                    }
                    </style>
                    <link rel="stylesheet" type="text/css" href='${ctxPath}/desertcourse/css/calendar_style.css'>
                  </head>

                  <body>
                    <div id="pageContent">
                      <div id="indexBlock">
                          <jsp:include page="/index.jsp" />
                      </div>
                      <div id="naviContentBlock">
                        <div id="naviBlock">
                          <jsp:include page="/desertcourse/navibar.jsp" />
                        </div>
                        <div id="titleBlock" style="margin-top: 5vh; margin-bottom: 5vh">
                          <h2 id="title" class="title-tag">課程行事曆</h2>
                        </div>
                        <div id="contentBlock">
                          <div id='calendar'></div>
                        </div>
                      </div>
                    </div>
                  </body>

                  </html>