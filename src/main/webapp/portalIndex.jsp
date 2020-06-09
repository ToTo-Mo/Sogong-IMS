<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <title>Page Title</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet' type="text/css" media="screen" />
    <link href="${pageContext.request.contextPath}/css/dashboard.css" property='stylesheet' rel='stylesheet' type="text/css" media="screen" />
</head>

<body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">소공도 통합 관광지 포털</a>
        <ul class="navbar-nav">
            <li class="nav-item text-nowrap ">
                <!-- 로그인 -->
                <%@ include file="Login.jsp" %>
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
                                상품 패키지 구매
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
        function enrollPopup() {
            var url = "enroll.html"
            var name ="enroll popup"
            var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=400,left=100,top=100"

            var child = window.open(url, name, option);
            child.focus();

            child.onload = function(){
                var wid = child.document.body.offsetWidth + 30;
                var hei = child.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

                child.resizeTo(wid, hei);
            };
        }

        function enrollAndSubmit(data){

            

            var form = document.createElement("form");
            var packageName = document.createElement("input");
            packageName.setAttribute("name", "packageName");
            packageName.setAttribute("value", data.packageName);
            var packagePrice = document.createElement("input");
            packagePrice.setAttribute("name", "packagePrice");
            packagePrice.setAttribute("value", data.packagePrice);
            var packageCompany = document.createElement("input");
            packageCompany.setAttribute("name", "packageCompany");
            packageCompany.setAttribute("value", data.packageCompany);
            var packageRegistrant = document.createElement("input");
            packageRegistrant.setAttribute("name", "packageRegistrant");
            packageRegistrant.setAttribute("value", data.packageRegistrant);
            var button = document.createElement("input");
            button.setAttribute("name", "enroll");
            button.setAttribute("value", "enroll");
            form.appendChild(packageName);
            form.appendChild(packagePrice);
            form.appendChild(packageCompany);
            form.appendChild(packageRegistrant);
            form.appendChild(button);
            document.body.appendChild(form);
            form.submit();
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