<%@ page import="Sogong.IMS.model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- <%
    if (request.getSession().getAttribute("member") == null) {
        request.setAttribute("form", "<form action=\"/login\" method=\"POST\" name=\"form\">\n" +
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
    } else {
        Member member = (Member) request.getSession().getAttribute("member");
        request.setAttribute("form", "<form action=\"/logout\" method=\"POST2\" name=\"form\" >\n" +
                "    <div class=\"form-inline mt-1 mb-1\" style=\"margin-right: 10vw\">\n" +
                "        <div class=\"input-group col-12 align-items-md-center\">\n" +
                "            <span class=\"mr-2\" style=\"color: white; font-size: 0.8rem\">" + member.getName() + "님</span>\n" +
                "            <button type=\"submit\" class=\"btn btn-secondary bg-dark d-flex align-items-md-center\" style='height:3vh;margin-right:1vw;margin-left: 1.5vw '>로그아웃</button>\n" +
                "            <a href=\"myPage\" class=\"btn btn-secondary bg-dark d-flex align-items-md-center\" style='height:3vh;'>내 정보</a>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</form>");
    }
%>
${form} --%>

<%
    if(request.getSession().getAttribute("member") == null) {
%>

<form action="/login" method="POST" name="form">
    <div class="form-inline mt-1">
        <div class="input-group mr-0 col-4">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon0" style='height:2.8vh;'> 아이디</span>
            </div>
            <input type="text" class="form-control mr-0 pr-0" placeholder="id" name="id"
                   aria-describedby="basic-addon0" autocomplete="off" style='height:2.8vh;' required>
        </div>
        <div class="input-group ml-0 col-4">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1" style='height:2.8vh;'>비밀번호</span>
            </div>

            <input type="password" class="form-control mr-0 pr-0" placeholder="pw" name="pw"
                   aria-describedby="basic-addon1" autocomplete="off" style='height:2.8vh;margin-right:0px;' required>
        </div>
        <div class="col-1">
            <button type="submit" class="btn btn-secondary bg-dark d-flex align-items-md-center" style='height:3vh;'>
                로그인
            </button>
        </div>
    </div>
</form>

<%
} else {
    Member member = (Member) request.getSession().getAttribute("member");
%>

<form action="/logout" method="POST" name="form">
    <div class="form-inline mt-1 mb-1" style="margin-right: 10vw">
        <div class="input-group col-12 align-items-md-center">
            <span class="mr-2" style="color: white; font-size: 0.8rem"><%=member.getName() + "님"%></span>
            <button type="submit" class="btn btn-secondary bg-dark d-flex align-items-md-center"
                    style='height:3vh;margin-right:1vw;margin-left: 1.5vw '>로그아웃
            </button>
            
            <button type="button" class="btn btn-secondary bg-dark d-flex align-items-md-center"
                    style='height:3vh; ' onclick="myPagePopup('<%=member.getMemberID()%>')">내정보
            </button>
        </div>
    </div>
</form>

<%
    }
%>

<script>
    function myPagePopup(memberID) {

        // 해당 url은 Authority
        var url = "${pageContext.request.contextPath}/myPage/" + memberID;
        var name = "modify popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"
        var child = window.open(url, name, option);

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 50;
            var hei = child.document.body.offsetHeight + 200;        //30 과 40은 넉넉하게 하려는 임의의 값임
            child.resizeTo(wid, hei);
        };
    }
</script>