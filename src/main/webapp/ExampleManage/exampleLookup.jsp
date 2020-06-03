<%@ page import="java.util.ArrayList" %>
<%@ page import="Sogong.IMS.model.Example" %>

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
                <h1 class="h2">예제 관리</h1>
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
                            <span class="input-group-text" id="basic-addon1">속성1</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputField1"
                               aria-describedby="basic-addon1" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon2">속성2</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputField2"
                               aria-describedby="basic-addon2" autocomplete="off">
                    </div>

                    <%-- 달력 선택으로 하단의 javascript 코드가 있습니다. "inputDateRange"로 검색하면 하단에 코드가 있습니다.
                    시간의 format은 "년/월/일-년/월/일"으로 시작일과 종료일의 구분자는 '-' 기호를 사용합니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">날짜 선택</span>
                        </div>
                        <input type="text" class="form-control" id="inputDateRange" name="inputDateRange" value=""
                               aria-describedby="basic-addon3" autocomplete="off"/>
                    </div>

                    <%-- 달력에 시간 까지 선택합니다. 하단의 javascript 코드가 있습니다. "inputDateTimeRange"로 검색하면 하단에 코드가 있습니다.
                        시간의 format은 "년/월/일 시간:분-년/월/일 시간:분"으로 시작일과 종료일의 구분자는 '-' 기호를 사용합니다. --%>
                    <div class="input-group col-4 mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon4">날자+시간 선택</span>
                        </div>
                        <input type="text" class="form-control" id="inputDateTimeRange" name="inputDateTimeRange"
                               value=""
                               aria-describedby="basic-addon4" autocomplete="off"/>
                    </div>

                    <%-- 이건 특정 범위를 지정할때 사용하세요
                        예 : 물건의 가격 2000원 ~ 3000원--%>
                    <%-- 입력 창의 크기가 크시면 col-3를 추가하셔서 크기를 조절할 수 있습니다.
                    여기서 3의 의미는  --%>
                    <div class="input-group col-3  mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon5">가격 범위</span>
                        </div>

                        <%--  name 태그 값은 예시닌간 다르게 사용하셔도 됩니다.   예 : inputInitPrice --%>
                        <input type="text" class="form-control" name="inputStartPrice" value=""
                               aria-describedby="basic-addon5">

                        <div class="input-group-prepend">
                            <span class="input-group-text">~</span>
                        </div>

                        <input type="text" class="form-control" name="inputEndPrice" value="">
                    </div>


                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon6">속성3</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputField3"
                               aria-describedby="basic-addon6" autocomplete="off">
                    </div>

                    <%-- 하나의 입력 필드 입니다. --%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon7">속성4</span>
                        </div>
                        <input type="text" class="form-control" placeholder="입력" name="inputField4"
                               aria-describedby="basic-addon7" autocomplete="off">
                    </div>


                    <%--    select가 필요하실 수도 있을 겁니다. 그럴때는 이걸 사용하세요.--%>
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon8">시설명</span>
                        </div>
                        <select class="custom-select" aria-describedby="basic-addon8" name="selectFacilityName">
                            <option selected>선택</option>
                            <option value="1">체험존</option>
                            <option value="2">행사장</option>
                            <option value="3">운동장</option>
                        </select>
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
                            <th style="width: 10%">ID</th>
                            <th style="width: 50%">title</th>
                            <th style="width: 30%">생성일</th>
                            <%-- 이 th는 수정과 삭제 버튼을 위한 th입니다. --%>
                            <th style="width: 10%"><th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Example> examples = (ArrayList<Example>) request.getAttribute("examples");

                            if (examples != null) {
                                for (Example e : examples) {%>

                        <tr>
                            <td><%= e.getId() %>
                            </td>
                            <td><%= e.getTitle() %>
                            </td>
                            <td><%= e.getCreateDate() %>
                            </td>
                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-secondary mr-2">수정</button>
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

