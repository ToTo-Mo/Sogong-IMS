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

    function enrollAndSubmit(data){
        var form = document.createElement("form");
        var name = document.createElement("input");
        name.setAttribute("name", "name");
        name.setAttribute("value", data.name);
        var memberID = document.createElement("input");
        memberID.setAttribute("name", "memberID");
        memberID.setAttribute("value", data.memberID);
        var memberPW = document.createElement("input");
        name.setAttribute("name", "memberPW");
        name.setAttribute("value", data.memberPW);
        var phoneNumber = document.createElement("input");
        phoneNumber.setAttribute("name", "phoneNumber");
        phoneNumber.setAttribute("value", data.phoneNumber);
        var address = document.createElement("input");
        address.setAttribute("name", "address");
        address.setAttribute("value", data.address);
        var button = document.createElement("input");
        button.setAttribute("name", "enroll");
        button.setAttribute("value", "enroll");
        form.appendChild(name);
        form.appendChild(memberID);
        form.appendChild(memberPW);
        form.appendChild(phoneNumber);
        form.appendChild(address);
        form.appendChild(email);
        form.appendChild(button);
        document.body.appendChild(form);
        form.submit();
    }

    function modifyPopup() {
        var wid = child.document.body.offsetWidth + 30;
        var hei = chile.document.body.offsetHeight + 40;

        child.resizeTo(wid, hei);
    }
</script>
</body>
</html>