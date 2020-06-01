<%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-05-15
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="Sogong.IMS.model.Member"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title></title>
</head>

<body>
    <style>
        data {
            border-width: 0;
        }
    </style>
    <form action="/AuthorityManage/lookup.do" method="post">
        <div>
            <label for="department">부서</label>
            <input type="text" id="department" name="department" />
            <label for="memberID">ID</label>
            <input type="text" id="memberID" name="memberID" />
            <label for="memberType">유형</label>
            <input type="text" id="memberType" name="memberType" />
            <label for="authorityGroupName">권한</label>
            <input type="text" id="authorityGroupName" name="authorityGroupName" />

            <button type="submit" name="lookup"> 조회 </button>
        </div>
    </form>
    <table>
        <table border="1">
            <thead>
                <th>no<th>
                <th>부서</th>
                <th>ID</th>
                <th>유형</th>
                <th>권한</th>
            </thead>

            <%
                List<Member> memberList = (ArrayList<Member>) request.getAttribute("memeberList");

                for(Member m : memberList){
                    pageContext.setAttribute("memberList",memberList);
                }
            %>

        </table>
        <input type="button" onclick="enrollPopup()" value="추가">
        <script>
            function enrollAndSubmit(data) {
                var form = document.createElement("form");
                var packageName = document.createElement("input");
                packageName.setAttribute("name", "packageName");
                packageName.setAttribute("value", data.packageName);
                var packagePrice = document.createElement("input");
                packagePrice.setAttribute("name", "packagePrice");
                packagePrice.setAttribute("value", data.packagePrice);
                var packageCompany = document.createElement("input");
                packageCompany.setAttribute("name", "packageCompany");
                packageCompany.setAttribute("value", data.packageCompany);
                var packageRegistrant = document.createElement("input");
                packageRegistrant.setAttribute("name", "packageRegistrant");
                packageRegistrant.setAttribute("value", data.packageRegistrant);
                var button = document.createElement("input");
                button.setAttribute("name", "enroll");
                button.setAttribute("value", "enroll");
                form.appendChild(packageName);
                form.appendChild(packagePrice);
                form.appendChild(packageCompany);
                form.appendChild(packageRegistrant);
                form.appendChild(button);
                document.body.appendChild(form);
                form.submit();
            }
            function enrollPopup() {
                var wintype = "toolbar=no,width=500,height=300,top=150,left=150,directories=no,menubar=no,scrollbars=yes";
                var child = window.open("AuthorityEnroll.jsp", "childWin", wintype);
                child.focus();
            }
        </script>
    </table>
</body>

</html>