<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="Sogong.IMS.model.AccomodationBookHistory" %>
<%@ page import="Sogong.IMS.dao.AccomodationBookHistoryDAO" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Sogong.IMS.model.Member" %>

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
    <title>숙박시설 예약 정보 수정</title>
    
</head>
<%
    String url = request.getRequestURI();
    String servletPath = request.getServletPath();
    String accomodationBookHistoryID = url.substring(servletPath.length()).split("/")[1];

    HashMap<String,Object> conditions = new HashMap<>();
    conditions.put("accomodationBookHistoryID", accomodationBookHistoryID);

    AccomodationBookHistory acc = new AccomodationBookHistoryDAO().lookup(conditions)[0];
%>
<body>

<!-- 전체 화면 영역 설정 container -->
<div class="container">

    <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
    <div class="row col-auto justify-content-center mt-5">

        <!-- 입력 양식 -->
        <form action="${pageContext.request.contextPath}/accomodationBookHistoryManage/modify.do" method="POST">

            <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약번호</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputAccomodationBookHistoryID"
                           aria-describedby="basic-addon1" autocomplete="off" required readonly value =<%=acc.getAccomodationBookHistoryID()%>>
                </div>
            </div>

            <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약인 이름</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputName"
                           aria-describedby="basic-addon1" autocomplete="off" required value =<%=acc.getName()%>>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">인원</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputNumOfPeople"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getNumOfPeople()%>>
                </div>
            </div>

             <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">전화번호</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputPhoneNum"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getPhoneNum()%>>
                </div>
            </div>


        <div class="form-group">
                <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">예약상태</span>
                        </div>
                        <select class="custom-select" aria-describedby="basic-addon8" name="inputBookState">
                            <option value="결제중" selected>결제중</option>
                            <option value="예약완료">예약완료</option>
                            <option value="예약취소">예약취소</option>
                        </select>
                </div>
          </div>
          
           <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">결제금액</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputPaymentPrice"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getPaymentPrice()%>>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">예약일자</span>
                    </div>
                    <input type="text" id = "bookDate" class="form-control" placeholder="입력" name="inputBookDate"
                           aria-describedby="basic-addon1" autocomplete="off" readonly value=<%=acc.getBookDate()%>>
                </div>
            </div>

           

            <div class="form-group">
                <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">체크인 체크아웃</span>
                        </div>
                        <%
                            String timeRange = acc.getCheckInTime() + "~" + acc.getCheckOutTime();
                        %>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputCheckDateTimeRange"
                               aria-describedby="basic-addon4" autocomplete="off" required value="<%=timeRange%>">
                    </div>
            </div>

             <div class="form-group">
                <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">입실상태</span>
                        </div>
                        <select class="custom-select" aria-describedby="basic-addon8" name="inputEnteringState" id="idEnteringState">
                            <option value="입실전" selected>입실전</option>
                            <option value="입실중">입실중</option>
                            <option value="퇴실">퇴실</option>
                        </select>
                </div>
          </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">회원ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getMemberID()%>>
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                    <%
                        String registrantID = ((Member)session.getAttribute("member")).getMemberID();
                    %>
                        <span class="input-group-text" id="basic-addon1">등록자ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputRegistrantID"
                           aria-describedby="basic-addon1" autocomplete="off" required value ="<%=registrantID%>" >
                </div>
            </div>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">숙박시설</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputAccomodationID"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getAccomodationID()%>>
                </div>
            </div>

        <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">호실</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputRoomNum"
                           aria-describedby="basic-addon1" autocomplete="off" required value=<%=acc.getRoomNum()%>>
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

<script>
   
  
   
   
    $(document).ready(function(){
    $("select option[value='<%=acc.getEnteringState()%>']").attr("selected", true);
     $("select option[value='<%=acc.getBookState()%>']").attr("selected", true);
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
            $(this).val(picker.startDate.format('YYYY-MM-DDThh:mm') + '~' + picker.endDate.format('YYYY-MM-DDThh:mm'));
        });


        $('input[name="inputCheckDateTimeRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });
</script>
    

</body>
</html>

