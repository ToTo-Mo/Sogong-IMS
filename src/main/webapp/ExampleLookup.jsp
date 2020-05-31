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
<form action="/ExampleManage/lookup.do" method="post">
    <div>
        <label for="item">항목</label>
        <input type="text" id="item" name="item" />

        <button type="submit" name="lookup"> 조회 </button>
    </div>
</form>
<table>
    <div style="overflow-x:auto;">
        <table class="result" border="1">
            <tr>
                <th>no<th>
                <th>항목</th>
            <tr>
                ${data}

        </table>
    </div>
    
    <div class="pager">
        <ul>
            <c:if test="${ curPageNum > 5 && !empty kwd }">
                <li><a href="/ExampleLookup/lookup.do?page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
            </c:if>

            <c:if test="${ curPageNum > 5 }">
                <li><a href="/ExampleLookup/lookup.do?page=${ blockStartNum - 1 }">◀</a></li>
            </c:if>

            <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                <c:choose>
                    <c:when test="${ i > lastPageNum }">
                        <li>${ i }</li>
                    </c:when>
                    <c:when test="${ i == curPageNum }">
                        <li class="selected">${ i }</li>
                    </c:when>
                    <c:when test="${ !empty kwd}">
                        <li><a href="/ExampleLookup/lookup.do?a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/ExampleLookup/lookup.do?page=${ i }">${ i }</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
                <li><a href="/ExampleLookup/lookup.do?a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
            </c:if>

            <c:if test="${ lastPageNum > blockLastNum }">
                <li><a href="/ExampleLookup/lookup.do?page=${ blockLastNum + 1 }">▶</a></li>
            </c:if>
        </ul>
    </div>

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