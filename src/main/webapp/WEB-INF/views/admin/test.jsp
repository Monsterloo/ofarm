<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
							<!-- <button type="button" class="btn btn-outline btn-default" data-toggle="modal" data-target="#myModal" data-keyboard="true">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" data-keyboard="true" id="editbtn">
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button> -->
                            <button type="button" class="btn btn-outline btn-default" id="insertbtn" data-keyboard="true">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" id="editbtn">
                                        <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" id="delbtn">
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
								<select id="pcategory" class="selectpicker col-sm-9 show-tick" data-style="btn-info" data-size="7" data-hide-disabled="true" data-live-search="true">
								    <!-- <optgroup label="Fruit">
								      <option>Apple</option>
								      <option>Orange</option>
								    </optgroup>
								    <optgroup label="Vegetable">
								      <option>Corn</option>
								      <option>Carrot</option>
								    </optgroup> -->
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
											<div id="upInfo" ></div>
											<div id="filePicker">选择图片</div> 
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

<!-- webuploader -->
<script src="${ctx}/admin/js/plugins/webuploader/webuploader.js"></script>

<!-- Sweet alert -->
<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>

<!-- bootstrap-select -->
<script
	src="${ctx}/admin/js/plugins/bootstrap-select/bootstrap-select.js"></script>

<!-- BootstrapValidator-->
<script type="text/javascript"
	src="${ctx}/admin/js/bootstrapValidator.js"></script>

<!-- product.js -->
<%-- <script src="${ctx}/admin/js/product.js"></script> --%>

<script type="text/javascript" type="text/javascript">
	var ProductObj = {};
	var nodeArr = [];
	var sonnodeArr = [];
	var uploader;
	
	jQuery(function() {
		ProductObj.reloadTable();
		ProductObj.initEvents();
		ProductObj.bootstrapValidator();
		//ProductObj.initUpload();
	});
	
	ProductObj.initUpload = function(){
		//var $ = jQuery,
		$list = $('#fileList'),
		// 优化retina, 在retina下这个值是2
		ratio = window.devicePixelRatio || 1,
		// 缩略图大小
		thumbnailWidth = 100 * ratio, thumbnailHeight = 100 * ratio,
		// Web Uploader实例
		uploader;
		// 初始化Web Uploader
		uploader = WebUploader.create({
			// 自动上传。
			auto : false,
			// swf文件路径
			swf : '../admin/js/plugins/webuploader/Uploader.swf',
			// 文件接收服务端。
			server : 'uploader',
			threads : '5', //同时运行5个线程传输
			fileNumLimit:'1',  //文件总数量只能选择1个 
	        fileSingleSizeLimit: 2 * 1024,    // 5 M
			resize : false,// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
			// 选择文件的按钮。可选。
			pick : {
				id : '#filePicker', //选择文件的按钮
				multiple : false
			}, //允许可以同时选择多个图片
			//图片质量，只有type为`image/jpeg`的时候才有效。
			quality : 90,

			//限制传输文件类型，accept可以不写 
			accept : {
				title : 'Images',//描述
				extensions : 'gif,jpg,jpeg,bmp,png,zip',//类型
				mimeTypes : 'image/*'//mime类型
			}
		});

		// 当有文件添加进来的时候，创建img显示缩略图使用
		uploader
				.on(
						'fileQueued',
						function(file) {
							var $li = $('<div id="' + file.id + '" class="file-item thumbnail">'
									+ '<img>'
									+ '<div class="info">'
									+ file.name + '</div>' + '</div>'), $img = $li
									.find('img');

							// $list为容器jQuery实例
							$list.append($li);

							// 创建缩略图
							// 如果为非图片文件，可以不用调用此方法。
							// thumbnailWidth x thumbnailHeight 为 100 x 100
							uploader.makeThumb(file, function(error, src) {
								if (error) {
									$img.replaceWith('<span>不能预览</span>');
									return;
								}

								$img.attr('src', src);
							}, thumbnailWidth, thumbnailHeight);
						});

		// 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
		uploader.on('uploadProgress', function(file, percentage) {
			var $li = $('#' + file.id), $percent = $li.find('.progress span');

			// 避免重复创建
			if (!$percent.length) {
				$percent = $('<p class="progress"><span></span></p>').appendTo(
						$li).find('span');
			}

			$percent.css('width', percentage * 100 + '%');
		});

		// 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
		uploader.on('uploadSuccess',
				function(file, response) {
					$('#' + file.id).addClass('upload-state-done');
					//console.info(response);
					$("#upInfo").html(
							"<font color='red'>" + response._raw + "</font>");
				});

		// 文件上传失败                                file:文件对象 ， code：出错代码
		uploader.on('uploadError', function(file, code) {
			var $li = $('#' + file.id), $error = $li.find('div.error');

			// 避免重复创建
			if (!$error.length) {
				$error = $('<div class="error"></div>').appendTo($li);
			}

			$error.text('上传失败!');
		});

		// 不管成功或者失败，文件上传完成时触发。 file： 文件对象
		uploader.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress').remove();
		});

	}

	ProductObj.initEvents = function(){
		//提交表单
		$(".btn-primary").bind("click", function(){
			ProductObj.submit(0);
		});
		
		//修改信息
		$("#editbtn").bind("click",function(){
			ProductObj.submit(1);
		});
		
		//关闭模态框
		$('#myModal').on('hide.bs.modal', function () {
		    uploader.destroy();
		});
		
		//显示模态框
		$('#myModal').on('shown.bs.modal', function () {
	        
	    });
		//添加信息
		$("#insertbtn").bind("click",function(){
			$("#myModal").modal("show");
			//$('#infoform').data('bootstrapValidator').resetForm(true);
			ProductObj.initUpload();
			$(".modal-title").html("添加新产品");
			$.ajax({
				type:'post',
				url:'../category/findAllCategoryEntity',
				async:true,
				dataType:'json',
				success:function(data){
					$("#pcategory").empty();
					getCategoryRootId(data);
					var html = "";
					$.each(nodeArr,function(i,o){
						html+= "<optgroup label='"+o.cname+"'>";
						getCategoryNode(o.id,data);
						$.each(sonnodeArr,function(i,son){
							html+= "<option data-tokens='"+son.id+"' data-subtext='"+son.cname+"' >"+son.cname+"</option>";
						});
						html+="</optgroup>";
					});
					$("#pcategory").append(html);
					 //更新内容刷新到相应的位置
					$('#pcategory').selectpicker('render');
	                $('#pcategory').selectpicker('refresh');
				}
			});
		});
		
		//取消按钮
		$('.btn-white').click(function() {
			$('#infoform').data('bootstrapValidator').resetForm(true);
	    });
		
	};
	
	ProductObj.submit = function(index){
		//获取表单对象
		var bootstrapValidator = $("#infoform").data('bootstrapValidator');
		//手动触发验证
		bootstrapValidator.validate();
		if(bootstrapValidator.isValid()){
		//表单提交的方法、比如ajax提交
			var id = $("#id").val(); 
			var pname = $("#pname").val();
			var pcategory = $(".selected").children().attr("data-tokens");
			var price = $("#price").val();
			var punit = $("#punit").val();
			var origin = $("#origin").val();
			var inventory = $("#inventory").val();
			var createtime = $("#createtime").val();
			var state = $("#state").val();
			var url = "";
			if(index == 0){
				url = "../product/insertProduct";
			}else if (index == 1){
				
			}
			$.ajax({
				type:"POST",
				url:url,
				async:true,
				dataType:'text',
				data: {
					'id':id,
					'pname':pname,
					'pcategory':pcategory,
					'price':price,
					'punit':punit,
					'origin':origin,
					'inventory':inventory,
					'createtime':createtime,
					'state':state
				},
				success:function(data){
					if(data == "Successful"){
						swal({
		                    title: "保存成功!",
		                    text: "成功保存"+pname,
		                    type: "success"
		                }, function () {
		                	$("#myModal").modal("hide");
		                	ProductObj.reloadTable();
		                	window.location.reload();
		                });
					}
				},
				error:function(){
					alert("出错误!!");
				}
			});
			/*if($(".modal-title").html()=="修改产品信息"){
				index = 1;
				url = "../sysAdmin/updateAdmin";
			}else{
				url = "../sysAdmin/insertAdmin";
			}
			$.ajax({
				type:"POST",
				url:url,
				async:true,
				dataType:'text',
				data: {
					'id':id,
					'pname':pname,
					'price':price,
					'punit':punit,
					'origin':origin,
					'inventory':inventory,
					'createtime':createtime,
					'state':state
				},
				success:function(data){
					console.info(data);
					if(data == null || data == ""){
						if(index == 1){
							alert("修改失败!");
						}else{
							alert("已存在用户名!");
						}
					}else if(data == "Successful"){
						$(".btn-white").click();
						if(index == 1){
							alert("修改成功!");
							reloadTable();
						}else{
							alert("添加成功!");
							reloadTable();
						}
						window.location.reload();
					}
				},
				error:function(){
					alert("错误!");
				}
			});*/
			//$("#infoform").submit();
		}else{
			return;
		}
	}
	
	ProductObj.bootstrapValidator = function(){
		$("#infoform").bootstrapValidator({
			feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	pname:{
	        		message: '产品名称验证失败',
	                validators: {
	                    notEmpty: {
	                        message: '产品名称不能为空'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 18,
	                        message: '产品名称长度必须在2到18位之间'
	                    }/*,
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_]+$/,
	                        message: '用户名只能包含大写、小写、数字和下划线'
	                    }*/
	                }
	        	},
	        	
	        	pcategory:{
	        		message: '产品分类不符合规则',
	                validators: {
	                    notEmpty: {
	                        message: '产品分类不能为空'
	                    }
	                }
	        	},
	        	
	        	price :{
		            validators: {
	                     notEmpty: {
	                         message: '产品单价不能为空'
	                     },
	                     stringLength: {
	                         min: 1,
	                         max: 8,
	                         message: '产品单价长度必须在1到8位之间'
	                     },
	                     regexp: {
	                         regexp: /^([0-9]|[1-9][0-9]+|[0-9](\.)[0-9]{1,}|[1-9]+[0-9](\.)[0-9]{1,})$/,
	                         message: '产品单价只能是整数或者小数'
	                        // ^[0-9]+(\.[0-9]{2})?$ 允许0的话
	                        // /^([1-9]+(\.[0-9]{2})?|0\.[1-9][0-9]|0\.0[1-9])$ 不允许0的话
	                     }
	            	}
	        	},
	        	
	        	origin:{
	        		message: '产品产地验证失败',
	        		validators: {
	                    notEmpty: {
	                        message: '产品产地不能为空'
	                    },
	                    stringLength: {
	                        min: 5,
	                        max: 18,
	                        message: '产品产地长度必须在5到18位之间'
	                    }
	                }
	        	},
	        	
	        	inventory :{
		            validators: {
	                     notEmpty: {
	                         message: '库存数不能为空'
	                     },
	                     stringLength: {
	                         min: 1,
	                         max: 5,
	                         message: '库存数长度必须在1到5位之间'
	                     },
	                     regexp: {
	                         regexp: /^[0-9]+$/,
	                         message: '库存数只能是整数'
	                     }
	            	}
	        	}
	        }
	        //fields
	        
		});
	}
	
	ProductObj.reloadTable = function(){
		  $('#exampleTableEvents').bootstrapTable({
		      url: "../product/findProductByPage",
		      search: true,
		      striped: true,
		      height: "600",
			  clickToSelect: true,
		      pagination: true,
		      showRefresh: true,
		      showToggle: true,
		      showColumns: true,
		      sortable: true,
		      pageSize: 10,
		   	  pageList: [10, 20, 30],
		      iconSize: 'outline',
		      toolbar: '#exampleTableEventsToolbar',
		      icons: {
		        refresh: 'glyphicon-repeat',
		        toggle: 'glyphicon-list-alt',
		        columns: 'glyphicon-list'
		      },
		      queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		      					  // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		      sidePagination: "server",  //分页方式：client客户端分页，server服务端分页（*）
		      //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
		      columns: [{
		          checkbox: true
		      }, {
		          field: 'pname',
		          title: '产品名字',
		          /*visible : false,*/
		          searchable: true
		      }, {
		          field: 'pcategory',
		          title: '产品类别',
		          searchable: false,
		          visible : false
		      }, {
		          field: 'pcategoryName',
		          title: '产品类别名字',
		          searchable: true
		      },{
		          field: 'price',
		          title: '单价',
		          searchable: true
		      }, {
		          field: 'punit',
		          title: '单位',
		          searchable: false
		      }, {
		          field: 'origin',
		          title: '产地',
		          searchable: false
		      }, {
		          field: 'pimg',
		          title: '图片',
			      formatter: function(value,row,index){
		            return '<img  src="../admin/css/plugins/zTree/zTreeStyle/img/diy/3.png" />';
			      }
		      }, { 
		          field: 'inventory',
		          title: '库存数',
		          searchable: false
		      }]
		    });

		    
		    /*var $result = $('#examplebtTableEventsResult');
		    var check = $("checkbox");

		    $('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
		        console.log('Event:', name, ', data:', args);
		      })
		      .on('click-row.bs.table', function(e, row, $element) {
		        $result.text('Event: click-row.bs.table');
		      })
		      .on('dbl-click-row.bs.table', function(e, row, $element) {
		        $result.text('Event: dbl-click-row.bs.table');
		      })
		      .on('sort.bs.table', function(e, name, order) {
		        $result.text('Event: sort.bs.table');
		      })
		      .on('check.bs.table', function(e, row) {
		        $result.text('Event: check.bs.table');
		      })
		      .on('uncheck.bs.table', function(e, row) {
		        $result.text('Event: uncheck.bs.table');
		      })
		      .on('check-all.bs.table', function(e) {
		        $result.text('Event: check-all.bs.table');
		        var check = $("checkbox");
		        console.info(check);
		      })
		      .on('uncheck-all.bs.table', function(e) {
		        $result.text('Event: uncheck-all.bs.table');
		      })
		      .on('load-success.bs.table', function(e, data) {
		        $result.text('Event: load-success.bs.table');
		      })
		      .on('load-error.bs.table', function(e, status) {
		        $result.text('Event: load-error.bs.table');
		      })
		      .on('column-switch.bs.table', function(e, field, checked) {
		        $result.text('Event: column-switch.bs.table');
		      })
		      .on('page-change.bs.table', function(e, size, number) {
		        $result.text('Event: page-change.bs.table');
		      })
		      .on('search.bs.table', function(e, text) {
		        $result.text('Event: search.bs.table');
		      });*/
		  $("#infoform").submit(function(ev){ev.preventDefault();});
	  }

	function getCategoryRootId(cList){
		nodeArr = [];
		$.each(cList,function(i,o){
			if(o.parentid == "0" || o.parentid == null){
				nodeArr.push(o);
			}
		});
	}

	function getCategoryNode(id,cList){
		sonnodeArr = [];
		$.each(cList,function(i,o){
			if(o.parentid == id){
				sonnodeArr.push(o);
			}
		});
	}
	
</script>
</html>