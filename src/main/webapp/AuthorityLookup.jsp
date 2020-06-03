<%@ page import="Sogong.IMS.model.Member" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.AuthorityGroup" %>
<%@ page import="Sogong.IMS.model.MemberAuthorityGroup" %>
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
        <h1 class="h2">권한 관리</h1>
    </div>

    <%-- 조회 필드 --%>
    <form action="${pageContext.request.servletPath}/lookup.do" method="POST">
        <div class="form-inline">
z
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">부서명</span>
                </div>
                <input type="text" class="form-control" placeholder="부서명" name="inputDepartment" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon2">ID</span>
                </div>
                <input type="text" class="form-control" placeholder="ID" name="inputMemberID" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon3">유형</span>
                </div>
                <input type="text" class="form-control" placeholder="유형" name="inputMemberType" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon4">권한</span>
                </div>
                <input type="text" class="form-control" placeholder="권한명" name="inputAuthorityGroupName" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <button type="submit" class="btn btn-primary btn-dark">조회</button>

            <div class="col-md-1 ml-5"></div>

            <button type="button" class="btn btn-primary btn-dark" onclick="enrollPopup()">추가</button>
        </div>
    </form>
    <%-- 조회 필드 끝 --%>

    <div class="col-md-1 mt-5"></div>

    <%-- 테이블 --%>
    <div style="width: 100%; height : 600px; overflow: auto">
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>부서</th>
                <th>ID</th>
                <th>유형</th>
                <th>권한</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members");

                if (members != null) {
                    for (Member m : members) {%>

            <tr>
                <td><%= m.getDepartment() %></td>
                <td><%= m.getMemberID() %></td>
                <td><%= m.getMemberType() %></td>

                <%
                    String authorityGroups = "";
                    ArrayList<MemberAuthorityGroup> mag = (ArrayList<MemberAuthorityGroup>) m.getMemberAuthorityGroups();

                    for(int i=0; i<m.getMemberAuthorityGroups().size() && i<5; i++){
                        authorityGroups += mag.get(i).getAuthorityGroup().getAuthorityGroupName() + " ";
                    }
                %>

                <td><%=authorityGroups%></td>

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
    </div>
    <%-- 테이블 끝 --%>

</main>
</body>
</html>
