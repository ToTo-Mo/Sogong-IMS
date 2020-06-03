<%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-05-15
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
  <style>
    .contents{
      margin: 2vh 0 0 2vw;
    }
  </style>
  <%@ include file="../index.jsp" %>
<%--    <p>상품패키지 관리화면</p>--%>

  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 contents">
    <%@ include file="PackageLookup.jsp" %>
  </main>

  </body>
</html>
