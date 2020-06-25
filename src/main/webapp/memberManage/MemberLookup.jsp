<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Sogong.IMS.model.Member" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원조회</title>
    <script>
        function modify(memberID) {
        var url = "${pageContext.request.contextPath}/memberManagement/" +memberID;
        var name = "modify popup"
        var option = "scrollbars=no,resizable=no,status=no,location=no,toolbar=no,menubar=no,width=400,height=600,left=100,top=100"
        var child = window.open(url, name, option);

        child.onload = function () {
            var wid = child.document.body.offsetWidth + 50;
            var hei = child.document.body.offsetHeight + 200;        //30 과 40은 넉넉하게 하려는 임의의 값임
            child.resizeTo(wid, hei);
        };
        }
        function remove(memberID) {
            var $form = $("<form></form>");
        $form.attr("action","${pageContext.request.contextPath}/memberManagement/delete.do");
        $form.attr("method","post");

        var $input = $("<input>");
        $input.attr("name","inputMemberID");
        $input.attr("value",memberID)

        $form.append($input);
        $('body').append($form);
        $form.submit();
        }
    </script>
</head>
<body>
    1234
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
    
                <!-- 화면 이름 -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">회원 정보 관리</h1>
                </div>
    
            </div>
    
            <fieldset class="row mb-3">
    
                <!-- 조회 필드 -->
                <form action="${pageContext.request.servletPath}/lookup.do" method="POST">
    
                    <div class="form-inline">

                        <div class="input-group mb-3 mr-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="name">성명</span>
                            </div>
                            <input type="text" class="form-control" placeholder="성명" name="inputName"
                                   aria-describedby="name" autocomplete="off">
                        </div>
    
                        <div class="input-group mb-3 mr-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="memberID">회원ID</span>
                            </div>
                            <input type="text" class="form-control" placeholder="입력" name="inputMemberID"
                                   aria-describedby="memberID" autocomplete="off">
                        </div>
    
                        <!-- 조회 버튼 -->
                        <div class="input-group mb-3 mr-3">
                            <button type="submit" class="btn btn-secondary bg-dark">조회</button>
                        </div>
                    </div>
                </form>
                <!-- 조회 필드 끝 -->
            </fieldset>    
    
            <div class="row">
    
                <div style="width: 100%; height : 600px; overflow: auto">
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
    
                            <!-- 테이블 속성 필드의 간격을 조절하고 싶으시면 style 태그를 이용하여야 합니다.
                                  width의 합은 100%가 되도록 해주세요.-->
    
                            <tr>
                                <th style="width: 10%">no.</th>
                                <th style="width: 10%">성명</th>
                                <th style="width: 10%">회원ID</th>
                                <th style="width: 10%">회원PW</th>
                                <th style="width: 20%">전화번호</th>
                                <th style="width: 20%">주소</th>
                                <th style="width: 20%">이메일</th>
                                <!-- 이 th는 수정과 삭제 버튼을 위한 th입니다. -->
                                <th style="width: 10%"><th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members");
                                if (members != null) {
                                    for (Member m : members) {
                            %>
    
                            <tr>
                                <td>-</td>
                                <td><%= m.getName() %>
                                </td>
                                <td><%= m.getMemberID() %>
                                </td>
                                <td><%= m.getMemberPW() %>
                                </td>
                                <td><%= m.getPhoneNumber() %>
                                </td>
                                <td><%= m.getAddress() %>
                                </td>
                                <td><%= m.getEmail() %>
                                </td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-secondary mr-2" onclick = "modify('<%= m.getName() %>')" >수정</button>
                                        <button type="button" class="btn btn-secondary" onclick = "remove('<%= m.getName() %>')">삭제</button>
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
                <!-- 테이블 끝 -->
            </div>
            
            <div class="mb-3"></div>
    </div>

</body>

</html>