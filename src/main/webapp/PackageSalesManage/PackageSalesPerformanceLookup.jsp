<%@ page import="Sogong.IMS.model.Package" %>
<%@ page import="Sogong.IMS.dao.PackageDAO" %>
<%@ page import="Sogong.IMS.model.PackageSalesPerformance" %><%--
  Created by IntelliJ IDEA.
  User: djh20
  Date: 2020-05-15
  Time: 오후 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>


<form action="${pageContext.request.servletPath}/lookup.do" method="POST">
    <div class="form-inline">
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">상품명</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="packageName">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">분류</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="type">
        </div>
        <div class="input-group mb-sm-n3 col-2 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">회사</span>
            </div>
            <input type="text" class="form-control"aria-describedby="basic-addon3" name="company">
        </div>
        <div class="input-group col-3 mb-sm-n3 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon5">전체 판매 수량</span>
            </div>
            <input type="number" class="form-control" name="minSalesNum" aria-describedby="basic-addon5" oninput="negativeHandler(this)">
            <div class="input-group-prepend">
                <span class="input-group-text">~</span>
            </div>
            <input type="number" class="form-control" name="maxSalesNum" oninput="negativeHandler(this)">
        </div>
    </div>
    <div class="form-inline mt-4" style="position: relative">
        <div class="input-group col-3 mb-sm-n3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">수익 합계</span>
            </div>
            <input type="number" class="form-control" name="minSumSalesPrice" aria-describedby="basic-addon5" oninput="negativeHandler(this)">
            <div class="input-group-prepend">
                <span class="input-group-text">~</span>
            </div>
            <input type="number" class="form-control" name="maxSumSalesPrice" oninput="negativeHandler(this)">
        </div>

        <div class="input-group col-6 mb-sm-n3 mb-3 mr-1">
            <div class="input-group-prepend">
                <span class="input-group-text">판매 기간</span>
            </div>
            <input type="datetime-local" class="form-control" name="minSalesDay" aria-describedby="basic-addon5">
            <div class="input-group-prepend">
                <span class="input-group-text">~</span>
            </div>
            <input type="datetime-local" class="form-control" name="maxSalesDay">
        </div>
        <button type="submit" class="btn btn-secondary bg-dark mb-sm-n3" >조회</button>
    </div>
</form>
<div style="width: 100%; max-height: 700px; overflow: auto" class="mt-5  mb-3">
    <div class="table-responsive text-md-center">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th width="10%">상품번호</th>
                <th width="20%">상품명</th>
                <th width="14%">분류</th>
                <th width="14%">회사</th>
                <th width="14%">가격</th>
                <th width="14%">수익 합계</th>
                <th width="14%">전체 판매 수량</th>
            </tr>
            </thead>
            <tbody>
            <%
                PackageSalesPerformance[] lookupResult = request.getAttribute("lookupResult") != null ? (PackageSalesPerformance[]) request.getAttribute("lookupResult") : null;
                if(lookupResult != null) {
                for( PackageSalesPerformance packageSalesPerformance : lookupResult){
                    pageContext.setAttribute("packageSalesPerformance", packageSalesPerformance);
                    %>
                <tr>
                    <td>${packageSalesPerformance.packageID}</td>
                    <td>${packageSalesPerformance.packageName}</td>
                    <td>${packageSalesPerformance.type}</td>
                    <td>${packageSalesPerformance.company}</td>
                    <td>${packageSalesPerformance.price}</td>
                    <td>${packageSalesPerformance.totalPrice}</td>
                    <td>${packageSalesPerformance.numTotalPurchase}</td>
                </tr>
                <%}}
                %>
            </tbody>
        </table>
    </div>
</div>

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
    function negativeHandler(input){
        if(input.value < 0){
            alert("음수는 허용되지 않습니다");
            input.value = 0;
        }
    }
</script>