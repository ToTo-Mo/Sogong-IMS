<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

<title>회원 등록</title>
</head>
<body>
	<div class="container">

        <div class="row col-auto justify-content-center mt-5">

            <form action="${pageContext.request.contextPath}/memberManage/enroll.do" id="form" method="POST">

                <!-- ID 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">회원ID</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputId"
                            aria-describedby="basic-addon1" autocomplete="off" required>
                    </div>
                </div>

                <!-- 비밀번호 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">회원PW</span>
                        </div>
                        <input type="password" class="form-control" placeholder="입력" name="inputPassword"
                            aria-describedby="basic-addon2" autocomplete="off" required>
                    </div>
                </div>

                <!-- 성명 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">성명</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputName"
                            aria-describedby="basic-addon3" autocomplete="off" required>
                    </div>
                </div>

                <!-- 전화번호 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">전화번호</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputPhoneNumber"
                            aria-describedby="basic-addon4" autocomplete="off">
                    </div>
                </div>

                <!-- 주소 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">주소</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputAddress"
                            aria-describedby="basic-addon5" autocomplete="off">
                    </div>
                </div>

                <!-- 이메일 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon6">이메일</span>
                        </div>
                        <input type="email" class="form-control" placeholder="입력" name="inputEmail"
                            aria-describedby="basic-addon6" autocomplete="off">
                    </div>
                </div>

                <!-- Type 필수 입력 input tag 안에 required가 있습니다.-->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon7">Type</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputType"
                            aria-describedby="basic-addon7" autocomplete="off" required>
                    </div>
                </div>

                <!-- 부서 일반 텍스트 -->
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">부서</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputDepartment"
                            aria-describedby="basic-addon8" autocomplete="off">
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-4">
                        <button type="submit" class="btn btn-secondary bg-dark">등록</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-4">
                        <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                    </div>
                </div>
            </form>
            <!-- 입력 양식 끝 -->
        </div>
   </div>
</body>
</html>