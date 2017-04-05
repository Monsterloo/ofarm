<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">

		<title> hAdmin- 主页</title>

		<meta name="keywords" content="">
		<meta name="description" content="">

		<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

		<link rel="shortcut icon" href="${ctx}/admin/favicon.ico">
		<link href="${ctx}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${ctx}/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
		<link href="${ctx}/admin/css/animate.css" rel="stylesheet">
		<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">
	</head>
	
    	<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
		<div id="wrapper">
			<!--左侧导航开始-->
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="nav-close"><i class="fa fa-times-circle"></i>
				</div>
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="nav-header">
							<div class="dropdown profile-element">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<span class="clear">
                                    <span class="block m-t-xs" style="font-size:16px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">admin</strong>
                                    </span>
									</span>
								</a>
							</div>
							<div class="logo-element">admin
							</div>
						</li>
						<li>
							<a class="J_menuItem" href="index_v1.html">
								<i class="fa fa-home"></i>
								<span class="nav-label">主页</span>
							</a>
						</li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">人员管理</span>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/sysAdmin/main"><i class="fa fa-home"></i><span class="nav-label">员工列表</span></a>
							</a>
						</li>
						<li>
							<a class="J_menuItem" href="adminList.html"><i class="fa fa-home"></i><span class="nav-label">员工绩效列表</span></a>
							</a>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">产品</span>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/product/main"><i class="fa fa-envelope"></i> <span class="nav-label">产品列表</span><span class="label label-warning pull-right">16</span></a>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/category/main"><i class="fa fa-desktop"></i> <span class="nav-label">产品类别管理</span>
								<!--<span class="fa arrow"></span>--></a>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">订单</span>
						</li>
						<li>
							<a href="#"><i class="fa fa-flask"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li>
									<a class="J_menuItem" href="typography.html">未完成订单</a>
								</li>
								<li>
									<a class="J_menuItem" href="typography.html">已完成订单</a>
								</li>
								<li>
									<a class="J_menuItem" href="typography.html">取消订单</a>
								</li>
							</ul>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">销售</span>
						</li>
						<li>
							<a class="J_menuItem" href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">销售图表</span></a>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">企业消息</span>
						</li>
						<li>
							<a class="J_menuItem" href="css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">企业日常消息列表</span></a>
						</li>

						

					</ul>
				</div>
			</nav>
			<!--左侧导航结束-->
			<!--右侧部分开始-->
			<div id="page-wrapper" class="gray-bg dashbard-1">
				<div class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
						<div class="navbar-header" style="width: 94%;">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i class="fa fa-bars"></i> </a>
							<!--搜索栏-->
							<!--<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>-->
                        <div class="sk-spinner sk-spinner-double-bounce" style="top: 5px;float: right;">
                                <div class="sk-double-bounce1"></div>
                                <div class="sk-double-bounce2"></div>
                            </div>
						</div>
						<ul class="nav navbar-top-links navbar-right" style="float: right;">
							<li class="dropdown">
								<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
									<i class="glyphicon glyphicon-user"></i>
									<!--<span class="label label-primary">8</span>-->
								</a>
								<ul class="dropdown-menu dropdown-alerts">
									<li>
										<a href="mailbox.html">
											<div>
												<i class="glyphicon glyphicon-cog"></i> 修改用户信息
											</div>
										</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="profile.html">
											<div>
												<i class="glyphicon glyphicon-circle-arrow-left"></i> 注销
											</div>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				<div class="row J_mainContent" id="content-main">
					<iframe id="J_iframe" width="100%" height="100%" src="${ctx }/product/main" frameborder="0" data-id="index_v1.html" seamless></iframe>
				</div>
			</div>
			<!--右侧部分结束-->
		</div>

		<!-- 全局js -->
		<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
		<script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script>
		<script src="${ctx}/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="${ctx}/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${ctx}/admin/js/plugins/layer/layer.min.js"></script>

		<!-- 自定义js -->
		<script src="${ctx}/admin/js/hAdmin.js?v=4.1.0"></script>
		<script src="${ctx}/admin/js/index.js" type="text/javascript" ></script>

		<!-- 第三方插件 -->
		<script src="${ctx}/admin/js/plugins/pace/pace.min.js"></script>

	</body>

</html>