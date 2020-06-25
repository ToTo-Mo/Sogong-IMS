<%@ page import="Sogong.IMS.model.Package" %>
<%@ page import="Sogong.IMS.dao.PackageDAO" %>
<%@ page import="Sogong.IMS.model.Facility" %>
<%@ page import="Sogong.IMS.model.Device" %><%--
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
                <span class="input-group-text">장비 번호</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="facilityName">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">시설 속성 번호</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="facilityID">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">등록자ID</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="registrantID">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">장비명</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="workspaceID">
        </div>

        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">도입처</span>
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
                <th width="15%">장비 번호</th>
                <th width="15%">시설 속성 번호</th>
                <th width="15%">등록자ID</th>
                <th width="15%">장비명</th>
                <th width="15%">도입처</th>
                <th width="15%">도입 비용</th>
                <th width="5%"></th>
                <th width="5%"></th>
            </tr>
            </thead>
            <tbody>
            <%
                Device[] lookupResult = request.getAttribute("lookupResult") != null ? (Device[]) request.getAttribute("lookupResult") : null;
                if(lookupResult != null) {
                for(Device device : lookupResult){
                    pageContext.setAttribute("device", device);
                    %>
                <tr>
                    <td>${device.deviceID}</td>
                    <td>${device.facilityPropertyID}</td>
                    <td>${device.registrantID}</td>
                    <td>${device.deviceName}</td>
                    <td>${device.instruction}</td>
                    <td>${device.instructionCost}</td>
                    <td><button type='button' class='btn btn-secondary btn-sm' onclick="modifyPopup('${device.deviceID}')">수정</button></td>
                    <td><a class='btn btn-secondary btn-sm' href='delete.do/${device.deviceID}'>삭제</a></td>
                </tr>
                <%}}
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function modifyPopup(deviceID) {
        var url = "${pageContext.request.contextPath}/facilityDeviceModify/" +deviceID;
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