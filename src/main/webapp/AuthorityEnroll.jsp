<%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-05-15
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
<script>
    function closeAndSubmit() {
        var member = {
            memberID : "",
            department : "",
            type : ""
            authority : []
        }
        member.memberID = document.getElementById("memberID").value;
        member.department = document.getElementById("department").value;
        member.type = document.getElementById("type").value;
        window.opener.enrollAndSubmit(pkg);
        window.close()
    }
</script>

    <form action="">
    <label for="memberID">ID</label>
    <input type="text" id="memberID" required/><br>
    <label for="department" >부서</label>
    <input type="text" id="department"/><br>
    <label for="type">유형</label>
    <input type="text" id="type"/><br>
    <input type="submit" onclick="self.closeAndSubmit()" value="추가"/>
    <input type="button" onclick="window.close()" value="취소"/>
    </form>


</body>
</html>
