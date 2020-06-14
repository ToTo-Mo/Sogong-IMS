<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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

    <!-- 화면 이름 -->
    <title>숙박 시설 예약 정보 등록</title>
</head>

<body>

<!-- 전체 화면 영역 설정 container -->
<div class="container">

    <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
    <div class="row col-auto justify-content-center mt-5">

        <!-- 입력 양식 -->
        <form action="${pageContext.request.servletPath}/enroll.do" method="POST">

            <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약인 이름</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">인원</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">연락처</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

            <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약상태</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제금액</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">체크인</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>


             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">입실상태</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>


             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">회원ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">숙박시설</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>

             <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">호실</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText"
                           aria-describedby="basic-addon1" autocomplete="off">
                </div>
            </div>
 

            <%-- 등록과 취소 버튼입니다. 등록 버튼을 누르게 되면, form태그의  action에 기술된 url대로 요청이 가게 됩니다. --%>
            <%-- justify-content-center는 요소들을 중간에 위치시키겠다는 의미입니다. --%>
            <div class="row justify-content-center">
                <div class="col-3">
                    <button type="submit" class="btn btn-secondary bg-dark">등록</button>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                </div>
            </div>
        </form>
        <!-- 입력 양식 끝 -->
    </div>
    <!-- 행으로 구분된 영역 끝 -->

    <!-- mb-5 는 spacing 요소이며 margin-buttom-5의 약자입니다. 자세한 내용은 아래 링크를 참고하세요.
    https://getbootstrap.com/docs/4.5/utilities/spacing/-->
    <div class="mb-5"></div>
</body>
</html>