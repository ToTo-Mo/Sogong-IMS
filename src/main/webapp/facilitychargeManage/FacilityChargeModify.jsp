<%--
  Created by IntelliJ IDEA.
  User: kdh97
  Date: 2020-06-11
  Time: 오전 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>

<head>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet'
        type="text/css" media="screen" />

    <title>Title</title>
</head>

<script>
    var workspaceID = sessionStorage.getItem("workspaceID");
    var facilityID = sessionStorage.getItem("facilityID");
    var prevChargeName = sessionStorage.getItem("chargeName");
</script>

<body>

    <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
    <div class="row col-auto justify-content-center mt-5">
        <!-- 입력 양식 -->
        <form action="${pageContext.request.servletPath}/modify.do" method="POST">

            <input type="hidden" name="workspaceID" value="$('workspaceID')">
            <input type="hidden" name="facilityID" value="$('facilityID')">
            <input type="hidden" name="prevChargeName" value="$('prevChargeName')">

            <div class="form-group">

                <!-- 요금명 필드 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="fieldChargeName">요금명</span>
                    </div>
                    <input type="text" class="form-control" placeholder=""
                        name="inputChargeName" aria-describedby="fieldChargeName" autocomplete="off">
                </div>

                <!-- 요금 필드 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="fieldCharge">요금</span>
                    </div>
                    <input type="text" class="form-control" placeholder="" name="inputCharge"
                        aria-describedby="fieldCharge" autocomplete="off">
                </div>

                <!-- 할인여부 선택 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="selectedDiscount">할인여부</label>
                    </div>
                    <select class="custom-select" id="selectedDiscount">
                        <option selected>할인여부 선택</option>
                        <option value="0">아니오</option>
                        <option value="1">예</option>
                    </select>
                </div>

                <!-- 할인율 필드 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="fieldDiscountRate">할인율</span>
                    </div>
                    <input type="text" class="form-control" placeholder=""
                        name="inputDiscountRate" aria-describedby="fieldDiscountRate" autocomplete="off">
                </div>
            </div>

            <%-- 등록과 취소 버튼입니다. 등록 버튼을 누르게 되면, form태그의  action에 기술된 url대로 요청이 가게 됩니다. --%>
            <%-- justify-content-center는 요소들을 중간에 위치시키겠다는 의미입니다. --%>
            <div class="row justify-content-center">
                <div class="col-3">
                    <button type="submit" class="btn btn-secondary bg-dark">수정</button>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                </div>
            </div>
        </form>
    </div>

</body>

</html>