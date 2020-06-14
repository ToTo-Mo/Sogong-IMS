<%--
  Created by IntelliJ IDEA.
  User: kdh97
  Date: 2020-06-11
  Time: 오후 7:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" property='stylesheet' rel='stylesheet'
          type="text/css" media="screen"/>

    <title></title>
</head>

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


                    <!-- 관광지 선택 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="selectedWorkspace">관광지</label>
                        </div>
                        <select class="custom-select" id="selectedWorkspace">
                            <option selected>관광지 선택</option>
                        </select>
                    </div>

                    <!-- 시설 선택 -->
                    <div class="input-group mb-3 mr-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="selectedFacility">시설</label>
                        </div>
                        <select class="custom-select" id="selectedFacility">
                            <option selected>시설 선택</option>
                        </select>
                    </div>
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
                    <span class="input-group-text" id="fieldResistrant">등록자</span>
                </div>
                <input type="text" class="form-control" placeholder="등록자" name="inputResistrant"
                       aria-describedby="fieldResistrant" autocomplete="off">
            </div>
        </div>

        <!-- 조회 버튼 -->
        <div class="input-group mb-3 mr-3">
            <button type="submit" class="btn btn-secondary bg-dark">조회</button>
        </div>
        </form>
</div>

<div class="row">

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
                        <th style="width : 10%">#</th>
                        <th style="width : 10%">부서</th>
                        <th style="width : 10%">ID</th>
                        <th style="width : 10%">유형</th>
                        <th style="width : 50%">권한</th>
                        <th style="width : 10%"></th>
                    </tr>
                    </thead>

                    <tbody>
                    <%
                        ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members");

                        if (members != null) {
                            for (Member m : members) {%>

                    <tr>
                        <td>-</td>
                        <td><%= m.getDepartment() %>
                        </td>
                        <td><%= m.getMemberID() %>
                        </td>
                        <td><%= m.getMemberType() %>
                        </td>

                        <%
                            String authorityGroups = "";
                            ArrayList<MemberAuthorityGroup> mag = (ArrayList<MemberAuthorityGroup>) m.getMemberAuthorityGroups();

                            int size = mag.size();

                            for (int i = 0; i < size; i++) {
                                authorityGroups += mag.get(i).getAuthorityGroup().getAuthorityGroupName() + (i < size - 1 ? ", " : " ");
                            }
                        %>

                        <td><%=authorityGroups%>
                        </td>

                        <td>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-secondary mr-2" onclick="">수정</button>
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
</div>


</main>
</div>

</div>
</body>
</html>
