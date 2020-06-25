<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
<title>회원관리</title>
</head>
<body>


	<%@ include file="../index.jsp" %>
	<%@ include file="MemberLookup.jsp"%>
	
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
        var url = "/memberEnroll"
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
</script>
</body>
</html>