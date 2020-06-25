<%@ page import="Sogong.IMS.model.Package" %>
<%@ page import="Sogong.IMS.dao.PackageDAO" %>
<%@ page import="Sogong.IMS.model.Facility" %><%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-05-15
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>

<form action="${pageContext.request.servletPath}/lookup.do" method="POST">
    <div class="form-inline">
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">시설 번호</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="facilityID">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">시설명</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="facilityName">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">등록자ID</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="registrantID">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">소속 관광지ID</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="workspaceID">
        </div>

        <button type="submit" class="btn btn-secondary bg-dark mb-sm-n3">조회</button>
    </div>
</form>
<div style="width: 100%; max-height: 700px; overflow: auto" class="mt-5  mb-3">
    <div class="table-responsive text-md-center">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th width="20%">시설 번호</th>
                <th width="30%">시설 명</th>
                <th width="20%">등록자ID</th>
                <th width="20%">소속 관광지ID</th>
                <th width="5%"></th>
                <th width="5%"></th>
            </tr>
            </thead>
            <tbody>
            <%
                Facility[] lookupResult = request.getAttribute("lookupResult") != null ? (Facility[]) request.getAttribute("lookupResult") : null;
                if(lookupResult != null) {
                for(Facility facility : lookupResult){
                    pageContext.setAttribute("facility", facility);
                    %>
                <tr>
                    <td>${facility.facilityID}</td>
                    <td>${facility.facilityName}</td>
                    <td>${facility.registrantID}</td>
                    <td>${facility.workspaceID}</td>
                    <td><button type='button' class='btn btn-secondary btn-sm' onclick="modifyPopup('${facility.facilityID}')">수정</button></td>
                    <td><a class='btn btn-secondary btn-sm' href='delete.do/${facility.facilityID}'>삭제</a></td>
                </tr>
                <%}}
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function modifyPopup(facilityID) {
        var url = "${pageContext.request.contextPath}/facilityModify/" +facilityID;
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