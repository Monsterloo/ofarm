<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title> - Bootstrap Table</title>
		<meta name="keywords" content="">
		<meta name="description" content="">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="${ctx}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${ctx}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${ctx}/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
		<link href="${ctx}/admin/css/animate.css" rel="stylesheet">
		<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">

	</head>

	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="col-sm-12">
				<!-- Example Events -->
				<div class="example-wrap">
					<div class="example">
						<div class="alert alert-success" id="examplebtTableEventsResult" role="alert">
							事件结果
						</div>
						<div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
							<button type="button" class="btn btn-outline btn-default" id="insertbtn" data-keyboard="true">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" id="editbtn">
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button>
						</div>

						<table id="exampleTableEvents" data-height="500" data-mobile-responsive="true">
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
		<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated fadeInDownBig" id="model">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                        </button>
						<i class="fa fa-laptop modal-icon"></i>
						<h4 class="modal-title">添加管理员信息</h4>
						<!--<small class="font-bold">这里可以显示副标题。-->
                    </div>
                    <div class="modal-body">
                        <form id="infoform" action="${ctx }/sysAdmin/insertAdmin">
                        	<input type="hidden" id="id" />
                        	<div class="form-group"><label>用户名</label> 
                        		 <input type="text" id="loginname" name="loginname" placeholder="请输入新的帐号" class="form-control"></div>
                        	<div class="form-group"><label>密码</label> 
                        		 <input type="password" id="password" name="password" placeholder="请输入您的密码" class="form-control"></div>
                        	<div class="form-group"><label>确定密码</label	> 
                        		 <input type="password" name="surepass" placeholder="请再次输入您的密码" class="form-control"></div>
                        	<div class="form-group"><label>手机号码</label> 
                        		 <input type="text" id="phone" name="phone" placeholder="请输入您的手机号码" class="form-control"></div>
                        	<div class="form-group"><label>Email</label> 
                        		 <input type="email" id="email" name="email" placeholder="请输入您的Email" class="form-control"></div>
                        	<input type="hidden" id="createtime" />
                        	<input type="hidden" id="roletype" />
                        	<input type="hidden" id="state" />
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

		<!-- Peity -->
		<script src="${ctx}/admin/js/demo/bootstrap-table-demo.js"></script>

		<!-- BootstrapValidator-->
		<script type="text/javascript" src="${ctx}/admin/js/bootstrapValidator.js" ></script>
		
		<script type="text/javascript">
			/*$(document).ready(function(){
				$("#infoform").easyform();
				
				$(".btn-primary").click(function(){
					$("#infoform").submit();
				});
			});*/
			$(function(){
				$("#adminid").hide();
				$("#infoform").bootstrapValidator({
					feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {
		            	loginname:{
		            		message: '用户名验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '用户名不能为空'
		                        },
		                        stringLength: {
		                            min: 5,
		                            max: 18,
		                            message: '用户名长度必须在5到18位之间'
		                        },
		                        regexp: {
		                            regexp: /^[a-zA-Z0-9_]+$/,
		                            message: '用户名只能包含大写、小写、数字和下划线'
		                        }
		                    }
		            	},
		            	
		            	password:{
		            		message: '密码不符合规则',
		                    validators: {
		                        notEmpty: {
		                            message: '密码不能为空'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 18,
		                            message: '密码长度必须在6到18位之间'
		                        }
		                    }
		            	},
		            	
		            	surepass :{
				            validators: {
			                     notEmpty: {
			                         message: '确认密码不能为空'
			                     },
			                     identical: {
			                         field: 'password',
			                         message: '两次输入密码不一致'
			                     }
		                	}
		            	},
		            	
		            	phone :{
		            		validators: {
		                        notEmpty: {
		                            message: '手机号码不能为空'
		                        },
		                        regexp: {
		                            //regexp: /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/,
		                            regexp: /^1[0-9]{10}$/,
		                            message: '手机号码不合法'
		                        }
		                    }
		            	},
		            	
		            	email: {
			               validators: {
		                        notEmpty: {
		                            message: '邮箱不能为空'
		                        },
		                        emailAddress: {
		                            message: '邮箱地址格式有误'
		                        }
                 		   }
			            } 
		            }
		            //fields
		            
				});
				
				//提交表单
				$("#infoform").submit(function(ev){ev.preventDefault();});
				$(".btn-primary").on("click", function(){
					//获取表单对象
					var bootstrapValidator = $("#infoform").data('bootstrapValidator');
					console.info(bootstrapValidator);
					//手动触发验证
					bootstrapValidator.validate();
					if(bootstrapValidator.isValid()){
					//表单提交的方法、比如ajax提交
						var id = $("#id").val(); 
						var loginname = $("#loginname").val();
						var password = $("#password").val();
						var phone = $("#phone").val();
						var email = $("#email").val();
						var createtime = $("#createtime").val();
						var roletype = $("#roletype").val();
						var state = $("#state").val();
						$.ajax({
							type:"POST",
							url:'../sysAdmin/insertAdmin',
							async:true,
							dataType:'text',
							data: {
								'id':id,
								'loginname':loginname,
								'password':password,
								'phone':phone,
								'email':email,
								'createtime':createtime,
								'roletype':roletype,
								'state':state
							},
							success:function(data){
								if(data == null || data == ""){
									alert("已存在用户名");
								}
								if(data == "Successful"){
									$(".btn-white").click();
									alert("添加成功!");
									window.location.reload();
								}
							},
							error:function(){
								alert("错误!");
							}
						});
						//$("#infoform").submit();
					}else{
						return;
					}
				});
				
				//取消按钮
				$('.btn-white').click(function() {
					$('#infoform').data('bootstrapValidator').resetForm(true);
					$("#id").val();
					$("#createtime").val();
					$("#roletype").val();
					$("#state").val();
			     });
				
				
				//表格事件
				var selectcount = $(".selected").length;
				$('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
					console.log('Event:', name, ', data:', args);
				}).on('check.bs.table', function(e, row) {
			        selectcount = $(".selected").length;
			   	}).on('uncheck.bs.table', function(e, row) {
			        selectcount = $(".selected").length;
			    })
				 //全选
				 .on('check-all.bs.table', function(e) {
					//$result.text('Event: check-all.bs.table');
					var $result = $('#examplebtTableEventsResult');
					var selects = $("td[class=bs-checkbox]").parent();
					$(selects).addClass("selected");
				 })
				 //取消全选
				 .on('uncheck-all.bs.table', function(e) {
					//$result.text('Event: uncheck-all.bs.table');
					var $result = $('#examplebtTableEventsResult');
					var selects = $("td[class=bs-checkbox]").parent();
					$(selects).removeClass("selected");
				 });
				
				//添加信息
				$("#insertbtn").bind("click",function(){
					$("#myModal").modal("show");
					$('#infoform').data('bootstrapValidator').resetForm(true);
					$("#id").val();
					$("#createtime").val();
					$("#roletype").val();
					$("#state").val();
					$(".modal-title").innerhtml = "添加管理员信息";
				});
				
				//修改信息
				$("#editbtn").bind("click",function(){
					if(selectcount > 1){
						alert("请选择一条管理员项!");
						return;
					}else if(selectcount == 0){
						alert("请选择管理员项!");
						return;
					}else{
						alert("进入修改");
						$("#myModal").modal("show");
						$(".modal-title").innerhtml = "修改管理员信息"s;
						var loginname = $(".selected").children("td")[1].innerHTML;
						$.ajax({
							type:"POST",
							url:'${ctx}/sysAdmin/findAdminByLoginname',
							async:true,
							dataType:'json',
							data: {
								'loginname':loginname
							},
							success:function(data){
								$("#id").val(data.id);
								$("#loginname").val(data.loginname);
								$("#password").val(data.password);
								$("#phone").val(data.phone);
								$("#email").val(data.email);
								$("#createtime").val(data.createtime);
								$("#roletype").val(data.roletype);
								$("#state").val(data.state);
								/* $.ajax({
									type:"POST",
									url:'${ctx}/sysAdmin/findAdminByLoginname',
									async:true,
									dataType:'json',
									data: {
										'loginname':loginname
									},
									success:function(data){
										
									}
								}); */
							},
							error:function(){
								alert("获取数据错误!");
							}
						});
						//$("#infoform").submit();
					}
				});
			
			//function()
			});
			
		</script>
	</body>

	</html>