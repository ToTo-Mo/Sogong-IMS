<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.RefundHistory" %>
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
                <h1 class="h2">환불 내역 관리</h1>
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
                            <span class="input-group-text" id="basic-addon2">결제수단</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputPaymentMethod"
                               aria-describedby="basic-addon2" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">환불수단</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputRefundMethod"
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
                        <input type="text" class="form-control" placeholder="입력" name="inputRegistrantID"
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
                            <span class="input-group-text" id="basic-addon5">환불 금액</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" name="inputStartRefundPrice" value=""
                               aria-describedby="basic-addon5">

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" name="inputEndRefundPrice" value="">
                    </div>

                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">결제 시간</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputPaymentTime"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                     
                    </div>


                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">환불 시간</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputRefundTime"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                    </div>

                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">체크 아웃</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputCheckOut"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>

                    </div>


                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">체크 인</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputCheckIn"
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

        <div class="row">

            <%-- 테이블 --%>
            <!-- 테이블에 스크롤 기능을 추가하기 위해 div태그를 추가합니다. -->
            <div style="width: 100%; height : 600px; overflow: auto">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <%-- 테이블 속성 필드의 간격을 조절하고 싶으시면 style 태그를 이용하여야 합니다.
                              width의 합은 100%가 되도록 해주세요.--%>
                        <tr>
                            <th style="width : 8%">결제번호</th>
                            <th style="width : 8%">환불번호</th>
                            <th style="width : 8%">결제금액</th>
                            <th style="width : 8%">환불금액</th>
                            <th style="width : 8%">체크인</th>
                            <th style="width : 8%">체크아웃</th>
                            <th style="width : 8%">결제시간</th>
                            <th style="width : 8%">환불시간</th>
                            <th style="width : 6%">결제수단</th>
                            <th style="width : 6%">환불수단</th>
                            <th style="width : 8%">환불사유</th>
                            <th style="width : 8%">등록자</th>
                            <th style="width : 8%">고객이름</th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                            ArrayList<RefundHistory> refundHistories = (ArrayList<RefundHistory>) request.getAttribute("refundHistories");

                            if (refundHistories != null) {
                                for (RefundHistory refund : refundHistories) {
                        %>
                        <tr>
                            <td>-</td>
                            <td><%= refund.getPaymentHistoryID() %>
                            </td>
                            <td><%= refund.getRefundHistoryID() %>
                            </td>
                            <td><%= refund.getRefundPrice() %>
                            </td>
                            <td><%= refund.getRefundTime() %>
                            </td>
                            <td><%= refund.getRefundMethod() %>
                            </td>
                            <td><%= refund.getResonsRefund() %>
                            </td>
                            <td><%= refund.getRegistrantID() %>
                            </td>

                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2" onclick="modifyPopup('<%= refund.getRefundHistoryID()%>')">수정</button>
                                    <button type="button" class="btn btn-secondary" onclick="deleteRow('<%= refund.getRefundHistoryID()%>')">삭제</button>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%-- 테이블 끝 --%>
        </div>

</div>

</main>



<script>

    $(function () {

        $('input[id="inputDateTimeRange"]').daterangepicker({
            autoUpdateInput: false,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 30,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('input[id="inputDateTimeRange"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD hh:mm') + '-' + picker.endDate.format('YYYY/MM/DD hh:mm'));
        });

        $('input[id="inputDateTimeRange"]').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

    });

</script>