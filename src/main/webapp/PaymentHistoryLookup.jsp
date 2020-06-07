<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.PaymentHistory" %>
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
        <div class="mb-3"></div>

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
        var url = "/exampleEnroll"
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