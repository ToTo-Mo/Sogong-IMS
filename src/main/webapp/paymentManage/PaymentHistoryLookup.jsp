<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.PaymentHistory" %>
<%@ page import="Sogong.IMS.model.Member" %>
<%@ page import="java.util.Iterator" %>

<%--
  Created by IntelliJ IDEA.
  User: bum44
  Date: 2020-06-01
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid">
    <!-- 작업 화면 -->
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
        <div class="chartjs-size-monitor"
             style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
            <div class="chartjs-size-monitor-expand"
                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
            </div>
            <div class="chartjs-size-monitor-shrink"
                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
            </div>
        </div>

        <div class="row">

            <%-- 화면 이름 --%>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">결제 내역 관리</h1>
            </div>

        </div>


        <!-- mb-3 는 spacing 요소이며 margin-buttom-3의 약자입니다. 자세한 내용은 아래 링크를 참고하세요.
            https://getbootstrap.com/docs/4.5/utilities/spacing/-->
        <div class="row mb-3">

            <%--    조회 필드 --%>
            <form action="${pageContext.request.servletPath}/lookup.do" method="POST">

                <%-- 한 줄애 여러개의 입력 필드를 두고 싶을때 사용합니다.
                    줄이 넘어가면 바로 밑으로 넘어가기 때문에 게속해서 추가해도 괜찮습니다.--%>
                <div class="form-inline">

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">숙박시설명</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputAccomodationID"
                               aria-describedby="basic-addon1" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">결제수단</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputPaymentMethod"
                               aria-describedby="basic-addon2" autocomplete="off">
                    </div>

                    
                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">고객이름</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputCustomerName"
                               aria-describedby="basic-addon2" autocomplete="off">
                    </div>
                    

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">등록자</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="registrantName"
                               aria-describedby="basic-addon2" autocomplete="off">
                    </div>

                    <%-- 이건 특정 범위를 지정할때 사용하세요
                        예 : 물건의 가격 2000원 ~ 3000원--%>
                    <%-- 입력 창의 크기가 크시면 col-3를 추가하셔서 크기를 조절할 수 있습니다.
                    여기서 3의 의미는  --%>
                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">결제 금액</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" name="inputStartPaymentPrice" value=""
                               aria-describedby="basic-addon5">

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" name="inputEndPaymentPrice" value="">
                    </div>


                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">결제 시간</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputStartPaymentTime"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputEndPaymentTime"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>
                    </div>



                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">체크 아웃</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputStartCheckOut"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputEndCheckOut"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>
                    </div>


                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">체크 인</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputStartCheckIn"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputEndCheckIn"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>
                    </div>
                    <%-- 조회 버튼 --%>
                    <div class="input-group mb-3 mr-3">
                        <button type="submit" class="btn btn-secondary bg-dark">조회</button>
                    </div>
                </div>
            </form>
            <%-- 조회 필드 끝 --%>

        </div>


        <%-- 추가 버튼  justify-content-end는 요소들을 오른쪽 정렬하겠다는 의미 입니다. --%>
        <div class="row justify-content-end">
            <div class="col-auto">
                <div class="input-group mb-3 mr-3">
                    <button type="button" class="btn btn-secondary bg-dark" onclick="enrollPopup()">추가</button>
                </div>
            </div>
        </div>

</div>

</main>



<script>

    $(function () {

        $('input[name="inputDateTimeRange"]').daterangepicker({
            autoUpdateInput: false,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 30,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[name="inputDateTimeRange"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD hh:mm') + '-' + picker.endDate.format('YYYY/MM/DD hh:mm'));
        });


        $('input[name="inputDateTimeRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });

    function enrollPopup() {
        var url = "/paymentEnroll"
        var name = "enroll popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"

        var child = window.open(url, name, option);
        child.focus();

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 30;
            var hei = child.document.body.offsetHeight + 40;        //30 과 40은 넉넉하게 하려는 임의의 값임

            child.resizeTo(wid, hei);
        };
    }
</script>


