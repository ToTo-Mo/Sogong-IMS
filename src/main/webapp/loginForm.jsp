<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Sogong.IMS.model.Member" %>

<%
    PrintWriter writer = response.getWriter();
    if(request.getSession().getAttribute("member") == null){
        request.setAttribute("form", "    <form method='post'>\n" +
                "    <input type=\"text\" name=\"id\" placeholder=\"아이디\" style=\"text-align: center; width: 80px;\">\n" +
                "    <input type=\"pass\" name=\"pw\" placeholder=\"비밀번호\" style=\"text-align: center; width: 80px;\">\n" +
                "    <button type=\"submit\" name=\"login\">로그인</button>\n" +
                "    </form>");
    }
    else{
        Member member = (Member) request.getSession().getAttribute("member");
        request.setAttribute("form", member.getName() + "님 반갑습니다");
    }
%>
    ${form}
