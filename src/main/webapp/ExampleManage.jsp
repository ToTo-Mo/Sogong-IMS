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
    <meta charset="EUC-KR">
  </head>
  <body>
  <%@ include file="topBar.jsp" %>
<%--<p>예시 관리화면</p>--%>
  <section style="float: left;">
    <%@ include file="menu.jsp" %>
  </section>
  <section style="float: left">
    <div style="font-size: 20px;padding-left: 5px;border-width: 0 0 2px 0;border-style: solid; width: 75vw">권한 관리</div>
    <div style="padding: 5px 0 0 5px"><%@ include file="ExampleLookup.jsp" %></div>
  </section>
  </body>
</html>
