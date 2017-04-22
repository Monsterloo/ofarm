<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="${ctx}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${ctx}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/admin/css/animate.css" rel="stylesheet">
<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">
<!-- Sweet Alert -->
<%-- <link href="${ctx}/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet"> --%>
</head>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-3">
				<div class="widget style1">
					<div class="row">
						<div class="col-xs-4 text-center">
							<i class="fa fa-trophy fa-5x"></i>
						</div>
						<div class="col-xs-8 text-right">
							<span> 总收入 </span>
							<h2 class="font-bold" id="totalIncome">&yen; 4,232</h2>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-3">
				<div class="widget style1 lazur-bg">
					<div class="row">
						<div class="col-xs-4">
							<i class="fa fa-envelope-o fa-5x"></i>
						</div>
						<div class="col-xs-8 text-right">
							<span> 新订单 </span>
							<h2 class="font-bold" id="newOrders">260</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget style1 yellow-bg">
					<div class="row">
						<div class="col-xs-4">
							<i class="fa fa-music fa-5x"></i>
						</div>
						<div class="col-xs-8 text-right">
							<span> 产品数量 </span>
							<h2 class="font-bold" id="productNumber">12</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="widget style1 navy-bg">
					<div class="row">
						<div class="col-xs-4">
							<i class="fa fa-cloud fa-5x"></i>
						</div>
						<div class="col-xs-8 text-right">
							<span> 今日温度 </span>
							<h2 class="font-bold">20'C</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="widget lazur-bg p-xl">

				<h2>junlon_lu</h2>
				<ul class="list-unstyled m-t-md">
					<li><span class="fa fa-envelope m-r-xs"></span> <label>Email:</label>
						496937493@qq.com</li>
					<li><span class="fa fa-home m-r-xs"></span> <label>Address:</label>
						韶关学院丁香苑C栋404</li>
					<li><span class="fa fa-phone m-r-xs"></span> <label>Contact:</label>
						(+020) 8888 8888</li>
				</ul>

			</div>
		</div>
		<div class="col-sm-8">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>饼状图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-pie-chart" style="width:500px;height:300px;"></div>
                    </div>
                </div>
            </div>
	</div>

	<!-- 全局js -->
	<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
	<%-- <script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script> --%>
	<!-- 自定义js -->
	<%-- <script src="${ctx}/admin/js/content.js?v=1.0.0"></script> --%>
	
	<!-- ECharts -->
    <%-- <script src="${ctx}/admin/js/plugins/echarts/echarts-all.js"></script> --%>
    <script src="${ctx}/admin/js/echarts.js"></script>
    
    <!-- chart.js -->
    <script src="${ctx}/admin/js/chart.js"></script>
    
    <script type="text/javascript" type="text/javascript">
    
	</script>
</body>

</html>
