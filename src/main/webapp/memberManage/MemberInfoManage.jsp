<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�Ұ��� ���� ������ ����</h2><br>
	<h4>����������</h4>
	 <div class="row col-auto justify-content-center mt-5">

        <form action="${pageContext.request.contextPath}/Member/enroll.do" id="form" method="POST">

            <!-- ID �ʼ� �Է� input tag �ȿ� required�� �ֽ��ϴ�.-->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">ȸ��ID</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputId"
                           aria-describedby="basic-addon1" autocomplete="off" readonly>
                </div>
            </div>

            <!-- ��й�ȣ �ʼ� �Է� input tag �ȿ� required�� �ֽ��ϴ�.-->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon2">ȸ��PW</span>
                    </div>
                    <input type="password" class="form-control" placeholder="�Է�" name="inputPassword"
                           aria-describedby="basic-addon2" autocomplete="off">
                </div>
            </div>

            <!-- ���� �ʼ� �Է� input tag �ȿ� required�� �ֽ��ϴ�.-->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon3">����</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputName"
                           aria-describedby="basic-addon3" autocomplete="off">
                </div>
            </div>

            <!-- ��ȭ��ȣ �Ϲ� �ؽ�Ʈ -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon4">��ȭ��ȣ</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputPhoneNumber"
                           aria-describedby="basic-addon4" autocomplete="off">
                </div>
            </div>

            <!-- �ּ� �Ϲ� �ؽ�Ʈ -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon5">�ּ�</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputAddress"
                           aria-describedby="basic-addon5" autocomplete="off">
                </div>
            </div>

            <!-- �̸��� �Ϲ� �ؽ�Ʈ -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon6">�̸���</span>
                    </div>
                    <input type="email" class="form-control" placeholder="�Է�" name="inputEmail"
                           aria-describedby="basic-addon6" autocomplete="off">
                </div>
            </div>

            <!-- Type �ʼ� �Է� input tag �ȿ� required�� �ֽ��ϴ�.-->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon7">Type</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputType"
                           aria-describedby="basic-addon7" autocomplete="off">
                </div>
            </div>

            <!-- �μ� �Ϲ� �ؽ�Ʈ -->
            <div class="form-group">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon8">�μ�</span>
                    </div>
                    <input type="text" class="form-control" placeholder="�Է�" name="inputDepartment"
                           aria-describedby="basic-addon8" autocomplete="off">
                </div>
            </div>>

            <div class="row justify-content-center">
                <div class="col-4">
                    <button type="submit" class="btn btn-secondary bg-dark">����</button>
                </div>
                <div class="col-1"></div>
                <div class="col-4">
                    <button type="button" class="btn btn-secondary bg-dark">ȸ�� ����</button>
                </div>
            </div>
        </form>
        <!-- �Է� ��� �� -->
    </div>
</body>
</html>