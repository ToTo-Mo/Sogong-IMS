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
    <title>결제 내역 등록</title>
</head>

<body>

<!-- 전체 화면 영역 설정 container -->
<div class="container">

    <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
    <div class="row col-auto justify-content-center mt-5">

        <!-- 입력 양식 -->
        <form action="${pageContext.request.contextPath}/paymentHistoryManage/enroll.do" id="form" method="POST">

            <!-- 숙박시설명 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">숙박시설명</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputAccomodationID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <!-- 결제 금액 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제 금액</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputPrice"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <!-- 체크인 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">체크인</span>
                    </div>
                    <input type='text' class="form-control" id='inputDateTime' />
                </div>
            </div>
            <!-- 체크아웃 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">체크아웃</span>
                    </div>
                    <input type='text' class="form-control" id='inputDateTime' />
                </div>
            </div>

            <!-- 결제시간 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제시간</span>
                    </div>
                   <input type='text' class="form-control" id='inputDateTime' />
                </div>
            </div>
            <!-- 결제 수단 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제수단</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputPaymentMethod"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>
            <!-- 고객이름 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">고객이름</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputMemberID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>
            <!-- 예약번호 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약번호</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputAccomodationID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>
            <%-- 등록과 취소 버튼입니다. 등록 버튼을 누르게 되면, form태그의  action에 기술된 url대로 요청이 가게 됩니다. --%>
            <%-- justify-content-center는 요소들을 중간에 위치시키겠다는 의미입니다. --%>
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

    <script>
        $(function () {

           /* $('input[id="inputDateTime"]').datetimepicker({
                autoUpdateInput: false,
                timePicker: true,
                timePicker24Hour: true,
                timePickerIncrement: 30,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('input[id="inputDateTime"]').on('apply.datetimepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('YYYY/MM/DD hh:mm') + '-' + picker.endDate.format('YYYY/MM/DD hh:mm'));
            });


            $('input[id="inputDateTime"]').on('cancel.datetimepicker', function (ev, picker) {
                $(this).val('');
            });
                */
            $('input[id="inputDateTime"]').datetimepicker();
             
        });  
    </script>   
</body>
</html>