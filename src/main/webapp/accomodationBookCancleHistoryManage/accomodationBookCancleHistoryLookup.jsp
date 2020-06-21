<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.AccomodationBookCancleHistory" %>

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
                <h1 class="h2">숙박 시설 예약 취소 관리</h1>
            </div>

        </div>

        <div class="row mb-3">

            <%--    조회 필드 --%>
            <form action="${pageContext.request.servletPath}/lookup.do" method="POST">

                <%-- 한 줄애 여러개의 입력 필드를 두고 싶을때 사용합니다.
                    줄이 넘어가면 바로 밑으로 넘어가기 때문에 게속해서 추가해도 괜찮습니다.--%>
                <div class="form-inline">

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">예약번호</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputAccomodationBookHistoryID"
                               aria-describedby="basic-addon1" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">등록자</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputRegister"
                               aria-describedby="basic-addon2" autocomplete="off">
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
                            <th style="width: 15%">예약취소번호</th>
                            <th style="width: 15%">예약번호</th>
                            <th style="width: 20%">취소일자</th>
                            <th style="width: 25%">취소사유</th>
                            <th style="width: 15%">등록자</th>
                            <%-- 이 th는 수정과 삭제 버튼을 위한 th입니다. --%>
                            <th style="width: 10%"><th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<AccomodationBookCancleHistory> accomodationBookCancleHistories = (ArrayList<AccomodationBookCancleHistory>) request.getAttribute("accomodationBookCancleHistories");

                            if (accomodationBookCancleHistories != null) {
                                for (AccomodationBookCancleHistory acc : accomodationBookCancleHistories) {%>

                        <tr>
                            <td><%= acc.getAccomodationBookCancleHistoryID() %></td>
                            <td><%= acc.getAccomodationBookHistoryID() %></td>
                            <td><%= acc.getCancleDate()%></td>
                            <td><%= acc.getCancleReason() %></td>
                            <td><%= acc.getRegistrantID() %></td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2" onclick="modifyPopup('<%= acc.getAccomodationBookCancleHistoryID()%>')">수정</button>
                                    <button type="button" class="btn btn-secondary">삭제</button>
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
    
    function enrollPopup() {
        var url = "/accomodationBookCancleHistoryEnroll"
        var name = "enroll popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"

        var child = window.open(url, name, option);
        child.focus();

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 50;
            var hei = child.document.body.offsetHeight + 80;        //30 과 40은 넉넉하게 하려는 임의의 값임

            child.resizeTo(wid, hei);
        };
    }

    function modifyPopup(accomodationBookCancleHistoryID) {
    
        var url = "${pageContext.request.contextPath}/accomodationBookCancleHistoryModify/" + accomodationBookCancleHistoryID;
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