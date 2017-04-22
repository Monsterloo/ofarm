<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${ctx}/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${ctx}/admin/css/animate.css" rel="stylesheet">
    <link href="${ctx}/admin/css/style.css" rel="stylesheet">
    <link href="${ctx}/admin/css/login.css" rel="stylesheet">
    <!-- Sweet Alert -->
	<link href="${ctx}/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>
<body class="signin">
    <div class="signinpanel middle-box text-center loginscreen  animated fadeInDown">
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="../backstage/index" id="loginForm">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到农资企业后台系统</p>
                    <div class="form-group"><input type="text" id="loginname" name="loginname" class="form-control uname" placeholder="用户名" value="${loginname}"/></div>
                    <div class="form-group"><input type="password" id="password" name="password" class="form-control pword m-b" placeholder="密码" /></div>
                    <button class="btn btn-success btn-block" id="login">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; Lulu
                <input type="hidden" id="errorMsg" value="${errorMsg }" />
            </div>
        </div>
    </div>
</body>

<!-- 全局js -->
<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${ctx}/admin/js/content.js?v=1.0.0"></script>

<!-- Bootstrap table -->
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- BootstrapValidator-->
<script type="text/javascript" src="${ctx}/admin/js/bootstrapValidator.js"></script>

<!-- Sweet alert -->
<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>

<!-- login.js -->
<script type="text/javascript" src="${ctx}/admin/js/login.js"></script>

<script type="text/javascript" type="text/javascript">
jQuery(function() {
	var errorMsg = $("#errorMsg").val();
	if(errorMsg != null && errorMsg != "" && typeof(errorMsg) != "undefine" && errorMsg != "-1"){
		swal({
			title : errorMsg,
			type : "error"
		}, function() {
			return;
		});
	}
});

</script>
	
</html>
