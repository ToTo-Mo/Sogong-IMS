<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

    <link href="css/bootstrap.css" property='stylesheet' rel='stylesheet' type="text/css" media="screen" />
    <link href="css/dashboard.css" property='stylesheet' rel='stylesheet' type="text/css" media="screen" />


    <!-- 화면 이름 -->
    <title>예제 등록</title>
</head>

<body>
    
    <div class="container h-100">
        <div class="row h-100 justify-content-center align-items-center">

            <!-- 작업을 수행할 action을 선택합니다. -->
            <form action="/exampleManage/enroll.do" method="POST" id="enrollForm">
                
                <!-- 하나의 입력 창 입니다. -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">제목</span>
                        </div>
                        <input type="text" class="form-control" name="inputTitle">
                    </div>
                </div>

                <button type="submit" id="btn-enroll" class="btn btn-primary">등록</button>
                
                <button type="button" class="btn btn-primary btn-danger" onclick='self.close()'>취소</button>
            </form>
        </div>
    </div>

    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>