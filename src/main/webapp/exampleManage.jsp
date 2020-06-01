<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.Example" %>
<%--
  Created by IntelliJ IDEA.
  User: bum44
  Date: 2020-05-31
  Time: 오후 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <title>Page Title</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>
    <link href="${pageContext.request.contextPath}/css/dashboard.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

</head>
<body>

<%@ include file="index.jsp" %>

<!-- 작업 화면 -->
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
    <div class="chartjs-size-monitor"
         style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
        <div class="chartjs-size-monitor-expand"
             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
            <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
        </div>
        <div class="chartjs-size-monitor-shrink"
             style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
            <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
        </div>
    </div>

    <%-- 화면 이름 --%>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">예제 관리</h1>
    </div>

    <%-- 조회 필드 --%>
    <form action="${pageContext.request.servletPath}/lookup.do" method="POST">
        <div class="form-inline">

            <%-- 하나의 입력 필드 입니다. --%>
            <div class="form-group">
                <label for="inputID">ID</label>
                <input type="text" class="form-control" id="inputID" name="inputID" placeholder="ID">
            </div>

            <div class="form-group">
                <label for="inputTitle">title</label>
                <input type="text" class="form-control" id="inputTitle" name="inputTitle" placeholder="title">
            </div>

            <%-- 달력 선택으로 하단의 javascript 코드가 있습니다. "inputDateRange"로 검색하면 하단에 코드가 있습니다.--%>

            <div class="form-group">
                <label for="inputDateRange">기간</label>
                <div class="input-group input-daterange">
                    <input type="text" class="form-control" id="inputDateRange" name="inputDateRange" value="" autocomplete="off"/>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-dark">조회</button>

            <div class="col-md-1 ml-5"></div>

            <button type="button" class="btn btn-primary btn-dark" onclick="enrollPopup()">추가</button>
        </div>
    </form>
    <%-- 조회 필드 끝 --%>

    <div class="col-md-1 mt-5"></div>

    <%-- 테이블 --%>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>ID</th>
                <th>title</th>
                <th>생성일</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Example> examples = (ArrayList<Example>) request.getAttribute("examples");

                if (examples != null) {
                    for (Example e : examples) {%>

            <tr>
                <td><%= e.getId() %>
                </td>
                <td><%= e.getTitle() %>
                </td>
                <td><%= e.getCreateDate() %>
                </td>
                <td>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-secondary">수정</button>
                        <button type="button" class="btn btn-secondary">삭제</button>
                    </div>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
    <%-- 테이블 끝 --%>
</main>

<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script>

    $(function () {

        $('input[name="inputDateRange"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="inputDateRange"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY-MM-DD') + '~' + picker.endDate.format('YYYY-MM-DD'));
        });

        $('input[name="inputDateRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });

    // $(function() {
    //     $('.input-daterange input').datepicker({
    //         format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
    //         // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    //         // endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
    //         autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    //         calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
    //         clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
    //         // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
    //         // daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
    //         // daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
    //         disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
    //         immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
    //         multidate : ture, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
    //         multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
    //         templates : {   
    //             leftArrow: '&laquo;',
    //             rightArrow: '&raquo;'
    //         }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
    //         showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
    //         title: "Calender",	//캘린더 상단에 보여주는 타이틀
    //         todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false
    //         toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
    //         weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
    //         // language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    //     }).on("changeDate", function(e) {
    //         //이벤트의 종류
    //         //show : datePicker가 보이는 순간 호출
    //         //hide : datePicker가 숨겨지는 순간 호출
    //         //clearDate: clear 버튼 누르면 호출
    //         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
    //         //changeMonth : 월이 변경되면 호출
    //         //changeYear : 년이 변경되는 호출
    //         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간


    //         console.log(e);// 찍어보면 event 객체가 나온다.
    //         //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데
    //         // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
    //         // 위와 같은 형태로 보인다.
    //         // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다.
    //     });//datepicker end
    // });//ready end

    function enrollPopup() {
        var url = "${pageContext.request.contextPath}/exampleEnroll.jsp"
        var name = "enroll popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"

        var child = window.open(url, name, option);
        child.focus();

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 30;
            var hei = child.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

            child.resizeTo(wid, hei);
        };
    }

    // Add active class to the current button (highlight it)
    var btns = document.getElementsByClassName("nav-link");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function () {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>
</body>
</html>
