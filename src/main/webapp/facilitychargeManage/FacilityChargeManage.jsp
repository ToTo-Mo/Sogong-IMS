<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>
<body>

<%@ include file="../index.jsp"%>
<%@ include file="FacilityChargeLookup.jsp"%>

<div class="mb-3"></div>

<div class="row justify-content-end">
    <div class="col-auto">
        <div class="input-group mb-3 mr-3">
            <button type="button" class="btn btn-secondary bg-dark" onclick="enrollPopup()">추가</button>
        </div>
    </div>
</div>

<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script>
    function enrollPopup() {

        sessionStorage.setItem("workspaceID", document.getElementsByName("inputWorkspaceID").value);
        sessionStorage.setItem("facilityID", document.getElementsByName("inputFacilityID").value);

        var url = "/facilityChargeEnroll";
        var name = "enroll popup";
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"

        var child = window.open(url, name, option);
        cjild.focus();

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 30;
            var hei = child.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

            child.resizeTo(wid, hei);
        };
    }
</script>
</body>
</html>
