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
  </head>
  <body>
  <style>
    html, body{
      margin: 0;
      height: 100%;
      overflow: hidden;
    }
  </style>
  <%@ include file="../Common/topBar.jsp" %>
<%--    <p>상품패키지 관리화면</p>--%>
  <div style="width: 100%; height: 100%;">
    <div style="float: left; height: 100%;">
      <%@ include file="../Common/menu.jsp" %>
    </div>
    <div>
      <div style="font-size: 20px;padding-left: 5px;border-width: 0 0 2px 0;border-style: solid; width: auto;display: block;overflow: hidden">판매 상품 관리</div>
      <div style="padding: 2vh 2vw 2vh 2vw; display: block;overflow: hidden"><%@ include file="PackageLookup.jsp" %></div>
    </div>
  </div>
  </body>
</html>
