<%@ page import="Sogong.IMS.model.Member" %><%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-06-09
  Time: 오후 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("member") == null){
        request.setAttribute("form","<form action=\"/login\" method=\"POST\" name=\"form\">\n" +
                "<div class=\"form-inline mt-1\">\n" +
                "        <div class=\"input-group mr-0 col-4\">\n" +
                "            <div class=\"input-group-prepend\">\n" +
                "                <span class=\"input-group-text\" id=\"basic-addon0\" style='height:2.8vh;'> 아이디</span>\n" +
                "            </div>\n" +
                "            <input type=\"text\" class=\"form-control mr-0 pr-0\" placeholder=\"id\" name=\"id\"\n" +
                "                   aria-describedby=\"basic-addon1\" autocomplete=\"off\" style='height:2.8vh;' required>\n" +
                "        </div>\n" +
                "        <div class=\"input-group ml-0 col-4\">\n" +
                "            <div class=\"input-group-prepend\">\n" +
                "                <span class=\"input-group-text\" id=\"basic-addon1\" style='height:2.8vh;'>비밀번호</span>\n" +
                "            </div>\n" +
                "            <input type=\"password\" class=\"form-control mr-0 pr-0\" placeholder=\"pw\" name=\"pw\"\n" +
                "                   aria-describedby=\"basic-addon1\" autocomplete=\"off\" style='height:2.8vh;margin-right:0px;'>\n" +
                "        </div>\n" +
                "        <div class=\"col-1\">\n" +
                        "        <button type=\"submit\" class=\"btn btn-secondary bg-dark d-flex align-items-md-center\" style='height:3vh;'>로그인</button>\n" +
                        "</div>" +
                "</div>\n" +
                "</form>");
    }
    else{
        Member member = (Member) request.getSession().getAttribute("member");
        request.setAttribute("form", "<form action=\"/logout\" method=\"POST2\" name=\"form\" >\n" +
                "    <div class=\"form-inline mt-1 mb-1\" style=\"margin-right: 10vw\">\n" +
                "        <div class=\"input-group col-12 align-items-md-center\">\n" +
                "            <span class=\"mr-2\" style=\"color: white; font-size: 0.8rem\">"+ member.getName() +"님</span>\n" +
                "            <button type=\"submit\" class=\"btn btn-secondary bg-dark d-flex align-items-md-center\" style='height:3vh;margin-right:1vw;margin-left: 1.5vw '>로그아웃</button>\n" +
                "            <a href=\"#\" class=\"btn btn-secondary bg-dark d-flex align-items-md-center\" style='height:3vh;'>내 정보</a>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</form>");
    }
%>
${form}

