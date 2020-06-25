<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Sogong.IMS.model.Workspace" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid">
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

        <div class="row">

            <%-- 화면 이름 --%>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">사업장 관리</h1>
            </div>

        </div>

        <div class="row mb-3">

            <%--    조회 필드 --%>
            <form action="${pageContext.request.servletPath}/lookup.do" method="POST">

                <%-- 한 줄애 여러개의 입력 필드를 두고 싶을때 사용합니다.
                    줄이 넘어가면 바로 밑으로 넘어가기 때문에 게속해서 추가해도 괜찮습니다.--%>
                <div class="form-inline">

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">사업장 명</span>
                        </div>
                        <input type="text" class="form-control" placeholder="사업장 명" name="workspaceName"
                               aria-describedby="basic-addon1" autocomplete="off">
                    </div>

                    <%-- 조회 버튼 --%>
                    <div class="input-group mb-3 mr-3">
                        <button type="submit" class="btn btn-secondary bg-dark">조회</button>
                    </div>
                </div>
            </form>
            <%-- 조회 필드 끝 --%>

        </div>


        <div class="row">

            <%-- 테이블 --%>
            <!-- 테이블에 스크롤 기능을 추가하기 위해 div태그를 추가합니다. -->
            <div style="width: 100%; height : 600px; overflow: auto">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <%-- 테이블 속성 필드의 간격을 조절하고 싶으시면 style 태그를 이용하여야 합니다.
                              width의 합은 100%가 되도록 해주세요.--%>
                        <tr>
                            <th style="width : 10%">no.</th>
                            <th style="width : 90%">사업장 명</th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                            ArrayList<Workspace> workspaces = (ArrayList<Workspace>) request.getAttribute("workspaces");

                            if (workspaces != null) {
                                int count = 0;
                                for (Workspace workspace : workspaces) {%>

                        <tr>
                            <td><%=count++%></td>
                            <td><%= workspace.getWorkspaceName() %></td>

                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2" onclick="modifyPopup('<%= workspace.getWorkspaceID()%>')">수정</button>
                                    <button type="button" class="btn btn-secondary" onclick="deleteRow('<%= workspace.getWorkspaceID()%>')">삭제</button>
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
        </div>
</div>

</main>

<script>
    function deleteRow(workspaceID) {

        var $form = $("<form></form>");
        $form.attr("action","${pageContext.request.contextPath}/workspaceManage/delete.do");
        $form.attr("method","post");

        var $input = $("<input>");
        $input.attr("name","workspaceID");
        $input.attr("value",workspaceID)

        $form.append($input);
        $('body').append($form);
        $form.submit();
    };

    function modifyPopup(workspaceID) {
    
        // 해당 url은 Authority
        var url = "${pageContext.request.contextPath}/workspaceModify/" +workspaceID;
        var name = "modify popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"
        var child = window.open(url, name, option);

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 50;
            var hei = child.document.body.offsetHeight + 200;        //30 과 40은 넉넉하게 하려는 임의의 값임
            child.resizeTo(wid, hei);
        };
    }
</script>

