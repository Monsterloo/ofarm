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
<link
	href="${ctx}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">
<link href="${ctx}/admin/css/animate.css" rel="stylesheet">
<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">
<!-- summernote -->
<link href="${ctx}/admin/css/plugins/summernote/summernote.css"
	rel="stylesheet">
<link href="${ctx}/admin/css/plugins/summernote/summernote-bs3.css"
	rel="stylesheet">
<!-- Sweet Alert -->
<link href="${ctx}/admin/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">
<!-- bootstrap-select -->
<link
	href="${ctx}/admin/css/plugins/bootstrap-select/bootstrap-select.css"
	rel="stylesheet">
</head>
<body class="gray-bg">
	<input type="hidden" value="${mode }" id="mode" />
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="col-sm-12">
			<!-- Example Events -->
			<div class="example-wrap">
				<div id="modeResult" role="alert"></div>
				<div class="example">

					<div class="btn-group hidden-xs" id="exampleTableEventsToolbar"
						role="group">
						<button type="button" class="btn btn-outline btn-default"
							data-toggle="modal" data-target="#newsModal" data-keyboard="true">
							<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
						</button>
						<button type="button" class="btn btn-outline btn-default"
							id="delbtn">
							<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
						</button>
					</div>

					<table id="exampleTableEvents" data-height="500"
						data-mobile-responsive="true">
						<thead>
							<tr>
								<th data-field="state" data-checkbox="true"></th>
								<th data-field="loginname">管理员</th>
								<th data-field="password">密码</th>
								<th data-field="phone">手机号码</th>
								<th data-field="email">邮箱地址</th>
								<th data-field="createtime">创建时间</th>
								<th data-field="roletype">角色</th>
							</tr>
						</thead>
					</table>

				</div>
			</div>
			<!-- End Example Events -->
		</div>
	</div>

	<!--添加窗口-->
	<div class="modal inmodal" id="newsModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width: 1000px;">
			<div class="modal-content animated fadeInDownBig" id="model">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<i class="fa fa-laptop modal-icon"></i>
					<h4 class="modal-title" id="showModalTitle">新增日常消息</h4>
					<small class="font-bold">添加企业日常消息 
				</div>
				<div class="modal-body">
					<form id="infoform" action="#">
						<input type="hidden" name="nid" id="nid" /> <input type="hidden"
							name="publisher" id="publisher" />
						<div class="form-group">
							<label>标题</label> <input type="text" id="title" name="title"
								placeholder="请输入标题" class="form-control">
						</div>

						<div class="form-group">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>内容</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="dropdown-toggle" data-toggle="dropdown"
											href="form_editors.html#"> <i class="fa fa-wrench"></i>
										</a> <a class="close-link"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content no-padding">

									<div class="summernote">
										<h2>请输入消息内容</h2>
										<p>请输入消息内容</p>
									</div>

								</div>
							</div>
						</div>

						<input type="hidden" name="creattime" id="createtime" /> <input
							type="hidden" name="state" id="state" />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveContent">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!--结束添加窗口-->

	<!-- 消息详情模态框 -->
	<div class="modal inmodal" id="newsDetailModal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="width:1000px;">
			<div class="modal-content animated fadeIn">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<i class="fa fa-clock-o modal-icon"></i>
					<h4 class="modal-title">日常消息项</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-10 col-lg-offset-1">
							<div class="ibox">
								<div class="ibox-content">
									<div class="text-center article-title">
										<h1 id="nTitle"></h1>
									</div>
									<div class="text-center article-title">
										<h3><span id="nPublisher"></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="nCreatetime"></span></h3>
									</div>
									<div id="nContent">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>


	</div>
	</div>
	<!-- End Panel Other -->
	</div>

</body>
<!-- 全局js -->
<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${ctx}/admin/js/content.js?v=1.0.0"></script>

<!-- Bootstrap table -->
<script
	src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script
	src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script
	src="${ctx}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- Sweet alert -->
<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>

<!-- BootstrapValidator-->
<script type="text/javascript"
	src="${ctx}/admin/js/bootstrapValidator.js"></script>

<!-- SUMMERNOTE -->
<script src="${ctx}/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${ctx}/admin/js/plugins/summernote/summernote-zh-CN.js"></script>

<!-- news.js -->
<script src="${ctx}/admin/js/news.js"></script>

<script type="text/javascript" type="text/javascript">
	$(document).ready(function() {

		$('.summernote').summernote({
			lang : 'zh-CN'
		});

	});
</script>
</html>