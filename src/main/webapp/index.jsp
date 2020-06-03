<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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

<body class="pt-5">
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">소공도 통합관리 시스템</a>
        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <div class="row">
                    <div class="col-md-5"></div>
                    <%@ include file="loginForm2.jsp" %>
                </div>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">

        <div class="row">

            <!-- 좌측 메뉴 -->

            <nav id="sidebar" class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                회원 정보 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/AuthorityManage">
                                권한 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                사업장 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                사업장 속성 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                시설 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                시설 속성 관리
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                시설 요금 및 할인율 관리
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                숙박시설 예약 정보 관리
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                숙박시설 예약 취소 관리
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                숙박 시설 결제 내역 관리
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                숙박 시설 환불 내역 관리
                            </a>
                        </li>

                        <li class="nav-item ">
                            <a class="nav-link" href="#">
                                판매 상품 실적 집계
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="/exampleManage">
                                예제 관리
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!-- 등록 팝업창 -->
    <script>
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