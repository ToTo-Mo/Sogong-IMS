<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.Example" %>
<%@ page import="Sogong.IMS.model.Member" %>
<%@ page import="Sogong.IMS.model.MemberAuthorityGroup" %>
<%@ page import="java.util.Iterator" %>

<%--
  Created by IntelliJ IDEA.
  User: bum44
  Date: 2020-06-01
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
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
                <h1 class="h2">권한 관리</h1>
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
                            <span class="input-group-text" id="basic-addon1">부서</span>
                        </div>
                        <input type="text" class="form-control" placeholder="부서명" name="inputDepartment"
                               aria-describedby="basic-addon1" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">ID</span>
                        </div>
                        <input type="text" class="form-control" placeholder="ID" name="inputMemberID"
                               aria-describedby="basic-addon3" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">유형</span>
                        </div>
                        <input type="text" class="form-control" placeholder="유형" name="inputMemberType"
                               aria-describedby="basic-addon3" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">권한</span>
                        </div>
                        <input type="text" class="form-control" placeholder="권한명" name="inputAuthorityName"
                               aria-describedby="basic-addon4" autocomplete="off">
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
                            <th style="width : 10%">#</th>
                            <th style="width : 10%">부서</th>
                            <th style="width : 10%">ID</th>
                            <th style="width : 10%">유형</th>
                            <th style="width : 50%">권한</th>
                            <th style="width : 10%"></th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                            ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members");

                            if (members != null) {
                                for (Member m : members) {%>

                        <tr>
                            <td>-</td>
                            <td><%= m.getDepartment() %>
                            </td>
                            <td><%= m.getMemberID() %>
                            </td>
                            <td><%= m.getMemberType() %>
                            </td>

                            <%
                                String authorityGroups = "";
                                ArrayList<MemberAuthorityGroup> mag = (ArrayList<MemberAuthorityGroup>) m.getMemberAuthorityGroups();

                                int size = mag.size();

                                for (int i = 0; i < size; i++) {
                                    authorityGroups += mag.get(i).getAuthorityGroup().getAuthorityGroupName() + (i<size-1 ? ", " : " ");
                                }
                            %>

                            <td><%=authorityGroups%>
                            </td>

                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2" onclick="modifyPopup('<%= m.getMemberID()%>')">수정</button>
                                    <button type="button" class="btn btn-secondary" onclick="deleteRow('<%= m.getMemberID()%>')">삭제</button>
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
    function deleteRow(memberID) {

        var $form = $("<form></form>");
        $form.attr("action","${pageContext.request.contextPath}/authorityManage/delete.do");
        $form.attr("method","post");

        var $input = $("<input>");
        $input.attr("name","inputMemberID");
        $input.attr("value",memberID)

        $form.append($input);
        $('body').append($form);
        $form.submit();
    };

    function modifyPopup(memberID) {
    
        // 해당 url은 Authority
        var url = "${pageContext.request.contextPath}/authorityModify/" +memberID;
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

