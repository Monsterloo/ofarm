<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>产品列表</title>
		<meta name="keywords" content="">
		<meta name="description" content="">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="${ctx}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${ctx}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${ctx}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link href="${ctx}/admin/css/animate.css" rel="stylesheet">
		<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">
		<!-- Sweet Alert -->
    	<link href="${ctx}/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    	<!-- bootstrap-select -->
    	<link href="${ctx}/admin/css/plugins/bootstrap-select/bootstrap-select.css" rel="stylesheet">
    	<!-- webuploader -->
    	<link href="${ctx}/admin/css/plugins/webuploader/webuploader.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${ctx}/admin/css/demo/webuploader-demo.css">
</head>

<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="col-sm-12">
				<!-- Example Events -->
				<div class="example-wrap">
					<div class="example">

						<div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
							<button type="button" class="btn btn-outline btn-default" data-toggle="modal" data-target="#myModal" data-keyboard="true">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" data-keyboard="true" id="editbtn">
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
						</div>

						<table id="exampleTableEvents" data-height="500" data-mobile-responsive="true">
							<thead>
								<!--<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="loginname">管理员</th>
									<th data-field="password">密码</th>
									<th data-field="phone">手机号码</th>
									<th data-field="email">邮箱地址</th>
									<th data-field="createtime">创建时间</th>
									<th data-field="roletype">角色</th>
								</tr>-->
								<!--<tr>
									<th data-field="state" data-checkbox="true"></th>
									<th data-field="id">ID</th>
									<th data-field="name">名称</th>
									<th data-field="price">价格</th>
								</tr>-->
							</thead>
						</table>

					</div>
				</div>
				<!-- End Example Events -->
			</div>
		</div>

		<!--添加窗口-->
		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated fadeInDownBig" id="model">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
						<i class="fa fa-laptop modal-icon"></i>
						<h4 class="modal-title">添加产品</h4>
						<!--<small class="font-bold">这里可以显示副标题。-->
					</div>
					<div class="modal-body">
						<form id="infoform" action="#">
							<input type="hidden" name="pid" id="pid" />
							<div class="form-group"><label>产品名字</label>
								<input type="text" id="pname" name="pname" placeholder="请输入产品名字" class="form-control"></div>
							<div class="form-group"><label>产品类别</label>
								<select id="pcategory" class="selectpicker col-sm-9" data-hide-disabled="true" data-live-search="true">
								    <optgroup label="Fruit">
								      <option>Apple</option>
								      <option>Orange</option>
								    </optgroup>
								    <optgroup label="Vegetable">
								      <option>Corn</option>
								      <option>Carrot</option>
								    </optgroup>
								 </select>
							</div>
							<div class="form-group"><label>单价</label>
								<input type="text" id="price" name="price" placeholder="请再次单价" class="form-control"></div>
							<div class="form-group"><label>单位</label>
								<input type="text" id="punit" name="punit" placeholder="请输入产品单位" class="form-control"></div>
							<div class="form-group"><label>产品产地</label>
								<input type="text" id="origin" name="origin" placeholder="请输入产品产地" class="form-control"></div>
							<div class="form-group"><label>库存数</label>
								<input type="text" id="inventory" name="inventory" placeholder="请输入库存数" class="form-control"></div>
							<div class="form-group"><label>产品图片</label>
								<div id="uploader" class="wu-example">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="uploadimg"> 
											<div id="fileList" class="uploader-list"></div> 
											<div id="imgPicker">选择图片</div> 
										</div>
                                    </div>
                                </div>
                            </div>
							<input type="hidden" name="createtime" id="createtime" />
							<input type="hidden" name="state" id="state" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--结束添加窗口-->

		</div>
		</div>
		<!-- End Panel Other -->
		</div>

		<!-- 全局js -->
		<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
		<script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script>

		<!-- 自定义js -->
		<script src="${ctx}/admin/js/content.js?v=1.0.0"></script>

		<!-- Bootstrap table -->
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		
		<!-- webuploader -->
		<script src="${ctx}/admin/js/plugins/webuploader/webuploader.js"></script>
		
		<!-- Sweet alert -->
    	<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>
    	
    	<!-- bootstrap-select -->
    	<script src="${ctx}/admin/js/plugins/bootstrap-select/bootstrap-select.js"></script>

		<!-- product.js -->
		<script src="${ctx}/admin/js/product.js"></script>

		<!-- BootstrapValidator-->
		<script type="text/javascript" src="${ctx}/admin/js/bootstrapValidator.js" ></script>

		<script type="text/javascript" type="text/javascript">
		var uploader = WebUploader.create({ 
			auto: true, // 选完文件后，是否自动上传 
			swf: 'js/plugins/webuploader/Uploader.swf', // swf文件路径 
			server: '#', // 文件接收服务端 
			pick: '#imgPicker', // 选择文件的按钮。可选 
			// 只允许选择图片文件。 
			 accept: { 
			 title: 'Images', 
			 extensions: 'gif,jpg,jpeg,bmp,png', 
			 mimeTypes: 'image/*' 
			 } 
			});
		</script>
	</body>

