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
		<!-- Sweet Alert -->
		<link href="${ctx}/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
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
                                        <strong class="font-bold"><span>${user.loginname }</span></strong>
                                    </span>
									</span>
								</a>
							</div>
							<div class="logo-element"><span>${user.loginname }</span>
							</div>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/backstage/home">
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
						<!-- <li>
							<a class="J_menuItem" href="adminList.html"><i class="fa fa-home"></i><span class="nav-label">员工绩效列表</span></a>
							</a>
						</li> -->

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">产品</span>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/product/main"><i class="fa fa-envelope"></i> <span class="nav-label">产品列表</span><span class="label label-danger pull-right" id="productCount"></span></a>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/category/main"><i class="fa fa-desktop"></i> <span class="nav-label">产品类别管理</span><span class="label label-primary pull-right" id="categoryCount"></span></a>
								<!--<span class="fa arrow"></span>--></a>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">订单</span>
						</li>
						<li>
							<a href="#"><i class="fa fa-flask"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<input type="hidden" id="modeParam" value="1" />
								<li>
									<a class="J_menuItem" href="${ctx }/orders/main?mode=1">未完成订单</a>
								</li>
								<li>
									<a class="J_menuItem" href="${ctx }/orders/main?mode=2">已完成订单</a>
								</li>
								<li>
									<a class="J_menuItem" href="${ctx }/orders/main?mode=0">取消订单</a>
								</li>
							</ul>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">销售</span>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/chart/main"><i class="fa fa-magic"></i> <span class="nav-label">销售图表</span></a>
						</li>

						<li class="line dk"></li>
						<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
							<span class="ng-scope">企业消息</span>
						</li>
						<li>
							<a class="J_menuItem" href="${ctx }/news/main"><i class="fa fa-magic"></i> <span class="nav-label">企业日常消息列表</span></a>
						</li>

						

					</ul>
				</div>
			</nav>
			<!--左侧导航结束-->
			
			<!-- 修改资料模态框 -->
			<div class="modal inmodal" id="adminModal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content animated fadeInDownBig" id="model">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
	                        </button>
							<i class="fa fa-laptop modal-icon"></i>
							<h4 class="modal-title">修改信息</h4>
							<!--<small class="font-bold">这里可以显示副标题。-->
	                    </div>
	                    <div class="modal-body">
	                        <form id="adminForm" action="${ctx }/sysAdmin/insertAdmin">
	                        	<input type="hidden" id="id" value="${user.id }"/>
	                        	<div class="form-group"><label>用户名</label> 
	                        		 <input type="text" id="loginname" name="loginname" placeholder="请输入新的帐号" class="form-control" value="${user.loginname }" readonly="true"></div>
	                        	<div class="form-group"><label>密码</label> 
	                        		 <input type="password" id="password" name="password" placeholder="请输入您的密码" class="form-control"></div>
	                        	<div class="form-group"><label>确定密码</label	> 
	                        		 <input type="password" name="surepass" placeholder="请再次输入您的密码" class="form-control"></div>
	                        	<div class="form-group"><label>手机号码</label> 
	                        		 <input type="text" id="phone" name="phone" placeholder="请输入您的手机号码" class="form-control" value="${user.phone }"></div>
	                        	<div class="form-group"><label>Email</label> 
	                        		 <input type="email" id="email" name="email" placeholder="请输入您的Email" class="form-control" value="${user.email }"></div>
	                        	<input type="hidden" id="createtime" value="${user.createtime }"/>
	                        	<input type="hidden" id="roletype" value="${user.roletype }"/>
	                        	<input type="hidden" id="state" value="${user.state }"/>
	                        </form>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
	                        <button type="button" class="btn btn-primary" id="saveAdmin">保存</button>
	                    </div>
	                </div>
	            </div>
        	</div>
			
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
										<a href="#" data-toggle="modal" data-target="#adminModal" data-keyboard="true">
											<div>
												<i class="glyphicon glyphicon-cog"></i> 修改用户信息
											</div>
										</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="${ctx }/backstage/loginout" id="logout">
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
					<iframe id="J_iframe" width="100%" height="100%" src="${ctx }/backstage/home" frameborder="0" data-id="index_v1.html" seamless></iframe>
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
		
		<!-- BootstrapValidator-->
		<script type="text/javascript" src="${ctx}/admin/js/bootstrapValidator.js"></script>
		
		<!-- Sweet alert -->
		<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>

		<!-- 第三方插件 -->
		<script src="${ctx}/admin/js/plugins/pace/pace.min.js"></script>

	</body>

</html>