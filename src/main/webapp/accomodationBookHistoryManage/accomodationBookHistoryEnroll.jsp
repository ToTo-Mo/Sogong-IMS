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
    <title>숙박시설 예약 정보 등록</title>
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
                    <input type="text" class="form-control" placeholder="입력" name="inputName"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">인원</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputNumOfPeople"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

             <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">전화번호</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputPhoneNum"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약상태</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputBookState"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>
          
           <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제금액</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputPaymentPrice"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약일자</span>
                    </div>
                    <input type="text" id = "bookDate" class="form-control" placeholder="입력" name="inputBookDate"
                           aria-describedby="basic-addon1" autocomplete="off" readonly >
                </div>
            </div>

           

            <div class="form-group">
                <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">체크인 체크아웃</span>
                        </div>
                        
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputCheckDateTimeRange"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off" required>
                    </div>
            </div>
            
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">입실상태</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputEnteringState"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">회원ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">등록자ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputRegistrantID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">숙박시설</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputAccomodationID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

        <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">호실</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputRoomNum"
                           aria-describedby="basic-addon1" autocomplete="off" required>
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

<script>
   
   let today = new Date();
   let year =  today.getFullYear();
   let month = today.getMonth()+1;
   let date = today.getDate();
   
   
    $('input[name="inputBookDate"]').val(year +"/"+ month +"/"+date);

    $(function () {
        $('input[name="inputDateRange"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="inputDateRange"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + '-' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('input[name="inputDateRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });

    $(function () {

        $('input[name="inputCheckDateTimeRange"]').daterangepicker({
            autoUpdateInput: false,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 30,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="inputCheckDateTimeRange"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD hh:mm') + '-' + picker.endDate.format('YYYY/MM/DD hh:mm'));
        });


        $('input[name="inputCheckDateTimeRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });
</script>