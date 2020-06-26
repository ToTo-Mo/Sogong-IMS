<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Sogong.IMS.model.Member" %>
<%@ page import="Sogong.IMS.dao.MemberDAO" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>
    <link href="${pageContext.request.contextPath}/css/dashboard.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/member-enroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>


    <!-- 화면 이름 -->
    <title>내정보</title>
</head>

<%
    String url = request.getRequestURI();
    String servletPath = request.getServletPath();
    String memberID = url.substring(servletPath.length()).split("/")[1];
    HashMap<String,Object> conditions = new HashMap<>();
    conditions.put("memberID", memberID);
    Member member = MemberDAO.getInstance().lookup(conditions)[0];
%>

<body>
    <!-- 전체 화면 영역 설정 container -->
    <div class="container">

        <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
        <div class="row col-auto justify-content-center mt-5">
    
            <!-- 입력 양식 -->
            <form action="${pageContext.request.contextPath}/myInfo/modify.do" method="POST">

                 <!-- ID 읽기전용 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">회원ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="memberID"
                           aria-describedby="basic-addon1" autocomplete="off" readonly value="<%=member.getMemberID()%>">
                </div>
            </div>

                <!-- 비밀번호 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">회원PW</span>
                        </div>
                        <input type="password" class="form-control" placeholder="입력" name="memberPW"
                               aria-describedby="basic-addon2" autocomplete="off" required value="<%=member.getMemberPW()%>">
                    </div>
                </div>
    
                <!-- 성명 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">성명</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="name"
                               aria-describedby="basic-addon3" autocomplete="off" required value="<%=member.getName()%>">
                    </div>
                </div>
    
                <!-- 전화번호 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">전화번호</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="phoneNumber"
                               aria-describedby="basic-addon4" autocomplete="off"  value="<%=member.getPhoneNumber()%>">
                    </div>
                </div>
    
                <!-- 주소 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">주소</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="address"
                               aria-describedby="basic-addon5" autocomplete="off" value="<%=member.getAddress()%>">
                    </div>
                </div>
    
                <!-- 이메일 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon6">이메일</span>
                        </div>
                        <input type="email" class="form-control" placeholder="입력" name="email"
                               aria-describedby="basic-addon6" autocomplete="off" value="<%=member.getEmail()%>">
                    </div>
                </div>
    
                <!-- Type 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon7">Type</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="memberType"
                               aria-describedby="basic-addon7" autocomplete="off" required value="<%=member.getMemberType()%>">
                    </div>
                </div>

                <!-- 부서 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">부서</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="department"
                               aria-describedby="basic-addon8" autocomplete="off" value="<%=member.getDepartment()%>">
                    </div>
                </div>
    
                <!-- 등록과 취소 버튼입니다. 등록 버튼을 누르게 되면, form태그의  action에 기술된 url대로 요청이 가게 됩니다. -->
                <!-- justify-content-center는 요소들을 중간에 위치시키겠다는 의미입니다. -->
                <div class="row justify-content-center">
                    <div class="col-4">
                        <button type="submit" class="btn btn-secondary bg-dark">수정</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-6">
                        <button type="button" class="btn btn-secondary bg-dark" onclick="remove('<%=member.getMemberID()%>')">회원삭제</button>
                    </div>
                </div>
            </form>
            <!-- 입력 양식 끝 -->
        </div>
     </div>
    
<script>
    function remove(memberID) {
        var $form = $("<form></form>");
        $form.attr("action", "${pageContext.request.contextPath}/myInfo/delete.do");
        $form.attr("method", "post");

        var $input = $("<input>");
        $input.attr("name", "memberID");
        $input.attr("value", memberID)

        $form.append($input);
        $('body').append($form);
        $form.submit();
    }
</script>
</body>
</html>