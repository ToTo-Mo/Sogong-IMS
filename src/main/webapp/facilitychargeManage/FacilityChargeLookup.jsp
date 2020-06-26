<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.FacilityCharge" %>

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
            <!--  -->
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">시설 요금 및 할인율 관리</h1>
            </div>
        </div>

        <div class="row mb-3">

            <!-- 조회 필드 -->
            <form action="${pageContext.request.servletPath}/lookup.do" method="POST">

                <!-- 한 줄에 여러개의 입력 필드를 두고 싶을때 사용합니다. 줄이 넘어가면 바로 밑으로 넘어가기 때문에 게속해서 추가해도 괜찮습니다. -->
                <div class="form-inline">


                    <!-- 관광ID 입력필드 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="fieldWorkspaceID">관광지</span>
                        </div>
                        <input type="text" class="form-control" placeholder="관광지ID" name="inputWorkspaceID"
                               aria-describedby="fieldWorkspaceID" autocomplete="off">
                    </div>

                    <!-- 시설ID 입력필드 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="fieldFacilityID">시설</span>
                        </div>
                        <input type="text" class="form-control" placeholder="시설ID" name="inputFacilityID"
                               aria-describedby="fieldFacilityID" autocomplete="off">
                    </div>
                </div>

                <div class="form-inline">

                    <!-- 요금명 입력필드 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="fieldChargeName">요금명</span>
                        </div>
                        <input type="text" class="form-control" placeholder="요금명" name="inputChargeName"
                               aria-describedby="fieldChargeName" autocomplete="off">
                    </div>

                    <!-- 등록자 입력필드 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="fieldResistrantID">등록자ID</span>
                        </div>
                        <input type="text" class="form-control" placeholder="등록자ID" name="inputResistrantID"
                               aria-describedby="fieldResistrantID" autocomplete="off">
                    </div>

                    <!-- 조회 버튼 -->
                    <div class="input-group mb-3 mr-3">
                        <button type="submit" class="btn btn-secondary bg-dark">조회</button>
                    </div>

                </div>
            </form>
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
                            <th style="width : 5%">#</th>
                            <th style="width : 50%">요금명</th>
                            <th style="width : 20%">요금</th>
                            <th style="width : 5%">할인여부</th>
                            <th style="width : 10%">할인율</th>
                            <th style="width : 10%">등록자</th>
                        </tr>
                        </thead>

                        <tbody>
                        <%
                            ArrayList<FacilityCharge> facilityCharges = (ArrayList<FacilityCharge>) request.getAttribute("facilityCharges");

                            if (facilityCharges != null) {
                                int cnt = 0;
                                for (FacilityCharge fc : facilityCharges) {
                                    cnt++;
                        %>
                        <tr>
                            <td><%=cnt%>
                            </td>
                            <td><%=fc.getChargeName() %>
                            </td>
                            <td><%=fc.getCharge() %>
                            </td>
                            <td><%=fc.isDiscount() %>
                            </td>
                            <td><%=fc.getDiscountRate() %>
                            </td>
                            <td><%=fc.getResistrantID() %>
                            </td>

                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2"
                                            onclick="modifyPopup('<%=fc.getWorkspaceID()%>', '<%=fc.getFacilityID()%>', '<%=fc.getChargeName()%>')">수정</button>
                                    <button type="button" class="btn btn-secondary mr-2"
                                            onclick="deleteRow('<%=fc.getWorkspaceID()%>', '<%=fc.getFacilityID()%>', '<%=fc.getChargeName()%>')">삭제</button>
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
    </main>
</div>

<script>
    function deleteRow(workspaceID, facilityID, chargeName) {
        var form = document.createElement("form");

        form.setAttribute("action", "${pageContext.request.contextPath}/facilityManage/delete.do");
        form.setAttribute("method", "post");

        var inputWorkspaceID = document.createElement("input");
        inputWorkspaceID.setAttribute("name", "inputWorkspaceID");
        inputWorkspaceID.setAttribute("value", workspaceID);

        var inputFacilityID = document.createElement("input");
        inputFacilityID.setAttribute("name", "inputFacilityID");
        inputFacilityID.setAttribute("value", facilityID);

        var inputChargeName = document.createElement("input");
        inputChargeName.setAttribute("name", "inputChargeName");
        inputChargeName.setAttribute("value", chargeName);

        form.appendChild(inputWorkspaceID);
        form.appendChild(inputFacilityID);
        form.appendChild(inputChargeName);

        document.body.appendChild(form);

        form.submit();
    }

    function modifyPopup(workspaceID, facilityID, chargeName) {
        sessionStorage.setItem("workspaceID", workspaceID);
        sessionStorage.setItem("facilityID", facilityID);
        sessionStorage.setItem("chargeName", chargeName);

        var url = "${pageContext.request.contextPath}/facilityChargeModify";
        var name = "modify popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"
        var child = window.open(url, name, option);

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 50;
            var hei = child.document.body.offsetHeight + 200;        //30 과 40은 넉넉하게 하려는 임의의 값임
            child.resizeTo(wid, hei);
        };
    }
</script>