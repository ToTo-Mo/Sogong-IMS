<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Sogong.IMS.model.AuthorityGroup" %>
<%@ page import="Sogong.IMS.dao.AuthorityGroupDAO" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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
    <script src="${pageContext.request.contextPath}/js/authority-enroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" type="text/javascript"></script>


    <!-- 화면 이름 -->
    <title>권한 등록</title>
</head>

<body>

<!-- 전체 화면 영역 설정 container -->
<div class="container">

    <!-- row : 행으로 구분된 영역, justify : 가운데 정렬-->
    <div class="row col-auto justify-content-center mt-5">

        <!-- 입력 양식 -->
        <form action="${pageContext.request.contextPath}/authorityManage/enroll.do" id="form" method="POST">

            <!-- 일반 텍스트 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputMemberID" id="inputMemberID"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>

            <!-- 읽기전용 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">부서</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText2"
                           aria-describedby="basic-addon2" autocomplete="off" readonly>
                </div>
            </div>

            <!-- 읽기전용 -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon3">유형</span>
                    </div>
                    <input type="text" class="form-control" placeholder="입력" name="inputText2"
                           aria-describedby="basic-addon3" autocomplete="off" readonly>
                </div>
            </div>

            <%--    select가 필요하실 수도 있을 겁니다. 그럴때는 이걸 사용하세요.--%>
            <div class="input-group mb-3 mr-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon4">권한 부여</span>
                </div>
                <select multiple class="form-control" aria-describedby="basic-addon4" name="selectedAuthorities"
                        id="selectedAuthorities" size="10" required>
                </select>
            </div>

            <%-- 권한 설정을 위한 위 아래 선택 버튼 --%>
            <div class="row justify-content-center">
                <div class="col-auto">
                    <div class="form-group">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-secondary" id="btn_setListAll">
                                <svg class="bi bi-chevron-double-up-square-fill" width="1em" height="1em"
                                     viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M7.646 2.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 3.707 2.354 9.354a.5.5 0 1 1-.708-.708l6-6z"/>
                                    <path fill-rule="evenodd"
                                          d="M7.646 6.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 7.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                                </svg>
                            </button>
                            <button type="button" class="btn btn-secondary" id="btn_setList">
                                <svg class="bi bi-chevron-up-square-fill" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
                                </svg>
                            </button>
                            <button type="button" class="btn btn-secondary" id="btn_resetList">
                                <svg class="bi bi-chevron-down-square-fill" width="1em" height="1em" viewBox="0 0 16 16"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </button>
                            <button type="button" class="btn btn-secondary" id="btn_resetListAll">
                                <svg class="bi bi-chevron-double-down-square-fill" width="1em" height="1em"
                                     viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                                    <path fill-rule="evenodd"
                                          d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <%
                List<AuthorityGroup> authorityGroups = Arrays.asList(new AuthorityGroupDAO().lookup());
            %>

            <div class="input-group mb-3 mr-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon5">권한 목록</span>
                </div>
                <select multiple class="form-control" aria-describedby="basic-addon5" name="listedAuthorities"
                        id="listedAuthorities" size="10">
                    <% for (AuthorityGroup ag : authorityGroups) {%>

                    <option value="<%= ag.getAuthorityGroupID()%>"><%= ag.getAuthorityGroupName()%>
                    </option>

                    <%
                        }
                    %>
                </select>
            </div>

            <%-- 등록과 취소 버튼입니다. 등록 버튼을 누르게 되면, form태그의  action에 기술된 url대로 요청이 가게 됩니다. --%>
            <%-- justify-content-center는 요소들을 중간에 위치시키겠다는 의미입니다. --%>
            <div class="row justify-content-center">
                <div class="col-4">
                    <button type="submit" class="btn btn-secondary bg-dark">등록</button>
                </div>
                <div class="col-1"></div>
                <div class="col-4">
                    <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                </div>
            </div>
        </form>
        <!-- 입력 양식 끝 -->
    </div>

    <script>
        $(document).ready(function () {
            $("#btn_setListAll").click(function () {
                JSopt.doOpt("addall");
            });
            $("#btn_setList").click(function () {
                JSopt.doOpt("add");
            });
            $("#btn_resetList").click(function () {
                JSopt.doOpt("back");
            });
            $("#btn_resetListAll").click(function () {
                JSopt.doOpt("backall");
            });
        });

        var JSopt = {
            doOpt: function (_mode) {
                if (_mode == 'add') {  // >
                    // listedAuthorities : 하단 select box id
                    $("#listedAuthorities").find("option").each(function () {
                        if (this.selected) {
                            // selectedAuthorities : 상단 select box id
                            $("#selectedAuthorities").append("<option value='" + this.value + "'>" + this.text + "</option>");
                            $("#form").append($('<input/>', {
                                value: this.value,
                                name: 'inputAuthorities',
                                style: 'display:none'
                            }));
                            $("#selectedAuthorities").removeAttr("required")
                            $(this).remove();
                        }
                    });
                } else if (_mode == "addall") {   // >>
                    $("#listedAuthorities").find("option").each(function () {
                        $("#selectedAuthorities").append("<option value='" + this.value + "'>" + this.text + "</option>");
                        $("#form").append($('<input/>', {
                            value: this.value,
                            name: 'inputAuthorities',
                            style: 'display:none'
                        }));
                        $("#selectedAuthorities").removeAttr("required")
                        $("#listedAuthorities").empty();
                    });
                } else if (_mode == "back") {   // <
                    $("#selectedAuthorities").find("option").each(function () {
                        if (this.selected) {
                            $("#listedAuthorities").append("<option value='" + this.value + "'>" + this.text + "</option>");
                            var inputs = $("#form").find("input[name='inputAuthorities']");

                            for (var i = 0; i < inputs.length; i++) {
                                if (this.value === inputs[i].value) {
                                    inputs[i].remove();
                                }
                            }
                            $(this).remove();
                        }
                    });

                    if ($("#selectedAuthorities").find("option").length <= 0) {
                        $("#selectedAuthorities").attr('required',true);
                    }

                } else if (_mode == "backall") {   // <<
                    $("#selectedAuthorities").find("option").each(function () {
                        $("#listedAuthorities").append("<option value='" + this.value + "'>" + this.text + "</option>");
                        $("#form").find("input[name='inputAuthorities']").remove();
                        $("#selectedAuthorities").attr('required',true);
                        $("#selectedAuthorities").empty();
                    });
                }
            }
        }
    </script>   
</body>
</html>