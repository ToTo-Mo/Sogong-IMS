<%@ page import="Sogong.IMS.model.Package" %>
<%@ page import="Sogong.IMS.dao.PackageDAO" %>
<%@ page import="java.util.HashMap" %>
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
    <title>상품 패키지 구매</title>
</head>
<%
    String url = request.getRequestURI();
    String servletPath = request.getServletPath();
    String packageID = url.substring(servletPath.length()).split("/")[1];
    HashMap<String,Object> conditions = new HashMap<>();
    conditions.put("packageID", packageID);
    Package aPackage = PackageDAO.getInstance().lookup(conditions)[0];
    request.setAttribute("packageID", aPackage.getPackageID());
    request.setAttribute("packageName", aPackage.getPackageName());
    request.setAttribute("price", aPackage.getPrice());
    request.setAttribute("company", aPackage.getCompany());
    request.setAttribute("type", aPackage.getType());
    request.setAttribute("explanation", aPackage.getExplanation());
%>
<style>
    .readonly{
        background-color: white;
    }
</style>
<body>
<div class="container">
    <div class="row col-auto justify-content-center mt-5">
        <form action="${pageContext.request.contextPath}/packagePurchase/purchase.do" method="POST" name="form">
            <div class="form-gro    up">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon0">상품번호</span>
                    </div>
                    <input type="text" class="form-control readonly" placeholder="입력" name="packageID"
                           aria-describedby="basic-addon1" autocomplete="off" required value=${packageID} readonly>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">상품패키지 명</span>
                    </div>
                    <input type="text" class="form-control readonly" placeholder="입력" name="packageName"
                           aria-describedby="basic-addon1" autocomplete="off" required value=${packageName} readonly>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">가격</span>
                    </div>
                    <input type="number" class="form-control readonly" placeholder="입력" name="price"
                           aria-describedby="basic-addon1" autocomplete="off" value=${price} required readonly>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon3">분류</span>
                    </div>
                    <input type="text" class="form-control readonly" placeholder="입력" name="type"
                           aria-describedby="basic-addon1" autocomplete="off"value=${type} required readonly>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon4">회사</span>
                    </div>
                    <input type="text" class="form-control readonly" placeholder="입력" name="company"
                           aria-describedby="basic-addon1" autocomplete="off" value=${company} required readonly>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon5">설명</span>
                    </div>
                    <textarea class="form-control readonly" rows="3" name="explanation" aria-describedby="basic-addon7"
                              autocomplete="off" required readonly>${explanation}</textarea>
                </div>
            </div>
            <%
                if(request.getSession().getAttribute("member")==null){%>
                    <%@ include file="PackagePurchaseNonMember.jsp" %>
            <%}
            %>

            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon6">수량</span>
                    </div>
                    <input type="number" class="form-control" placeholder="수량" name="numPurchase"
                           aria-describedby="basic-addon1" autocomplete="off" required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-3">
                    <button type="submit" class="btn btn-secondary bg-dark">구매</button>
                </div>
                <div class="col-1"></div>
                <div class="col-3">
                    <button type="button" class="btn btn-secondary bg-dark" onclick='self.close()'>취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
