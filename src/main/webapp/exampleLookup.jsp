<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.Example" %>

<%--
  Created by IntelliJ IDEA.
  User: bum44
  Date: 2020-06-01
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
