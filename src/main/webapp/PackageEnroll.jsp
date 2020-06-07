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
        var pkg = {
            packageName : "",
            packageRegistrant : "",
            packageCompany : "",
            packagePrice : ""
        }
        pkg.packageName = document.getElementById("packageName").value;
        pkg.packagePrice = document.getElementById("packagePrice").value;;
        pkg.packageCompany = document.getElementById("packageCompany").value;;
        pkg.packageRegistrant = document.getElementById("packageRegistrant").value;;
        window.opener.enrollAndSubmit(pkg);
        window.close()
    }
</script>

    <form action="">
    <label for="packageName">상품명</label>
    <input type="text" id="packageName" required/><br>
    <label for="packagePrice" >최대가격</label>
    <input type="text" id="packagePrice" required/><br>
    <label for="packageCompany">납품처</label>
    <input type="text" id="packageCompany" required/><br>
    <label for="packageRegistrant">등록자</label>
    <input type="text" id="packageRegistrant" required/><br>
    <input type="submit" onclick="self.closeAndSubmit()" value="추가"/>
    <input type="button" onclick="window.close()" value="취소"/>
    </form>

</body>
</html>
