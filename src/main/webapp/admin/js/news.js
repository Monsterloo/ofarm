var NewsObj = {};
var nArr = new Array();
var nid = "";

jQuery(function() {
	NewsObj.reloadTable();
	NewsObj.initEvents();
	NewsObj.bootstrapValidator();
});


/**
 * 保存消息
 */
NewsObj.submit = function() {
	// 获取表单对象
	var bootstrapValidator = $("#infoform").data('bootstrapValidator');
	// 手动触发验证
	bootstrapValidator.validate();
	if (bootstrapValidator.isValid()) {
		var sHTML = $('.summernote').code();
		var title = $("#title").val();
		if (sHTML.length < 1) {
			swal({
				title : "内容不能为空!",
				type : "error"
			}, function() {
				return;
			});
		}
		$.post('../news/insertNews', {
			'title' : title,
			'content' : sHTML
		}, function(data, status) {
			if (status == "success") {
				swal({
					title : "保存成功!",
					text : "成功保存日常消息 ",
					type : "success"
				}, function() {
					$("#newsModal").modal("hide");
					NewsObj.reloadTable();
					window.location.reload();
				});
			} else {
				swal({
					title : "保存失败!",
					type : "error"
				}, function() {
					return;
				});
			}
		}, 'json');
	}
}

/**
 * 初始化事件
 */
NewsObj.initEvents = function() {
	// 保存日常消息
	$("#saveContent").bind("click", function() {
		NewsObj.submit();
	});

	$("#delbtn").bind("click", function() {
		NewsObj.delNews();
	});

	// 关闭模态框
	$('#myModal').on('hide.bs.modal', function() {
		$('#infoform').data('bootstrapValidator').resetForm(true);
	});

	// 显示模态框
	$('#myModal').on('shown.bs.modal', function() {
		$('#infoform').data('bootstrapValidator').resetForm(true);
	});

	// 显示模态框
	$('#newsDetailModal').on('shown.bs.modal', function() {
		NewsObj.showNewsDetail();
	});
}

/**
 * 显示日常消息的详情
 */
NewsObj.showNewsDetail = function(){
	$.post('../news/findNewsById',{
		'nid':nid
	}, function(data, status){
		if(status == "success"){
			$("#nTitle").html(data.title);
			$("#nPublisher").html(data.publishName);
			$("#nCreatetime").html(data.createtime.substring(0, data.createtime.length-2));
			$("#nContent").html(data.content);
		}
	}, 'json');
}

/**
 * 验证
 */
NewsObj.bootstrapValidator = function() {
	$("#infoform").bootstrapValidator({
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			title : {
				message : '标题验证失败',
				validators : {
					notEmpty : {
						message : '标题不能为空'
					},
					stringLength : {
						min : 5,
						max : 50,
						message : '标题长度必须在5到50位之间'
					}
				}
			}
		}
	// fields
	});
}

/**
 * 初始化table
 */
NewsObj.reloadTable = function() {
	$('#exampleTableEvents')
			.bootstrapTable(
					{
						url : "../news/findNewsByPage",
						search : true,
						striped : true,
						height : "600",
						clickToSelect : true,
						pagination : true,
						showRefresh : true,
						showToggle : true,
						showColumns : true,
						sortable : true,
						pageSize : 10,
						pageList : [ 10, 20, 30 ],
						iconSize : 'outline',
						toolbar : '#exampleTableEventsToolbar',
						icons : {
							refresh : 'glyphicon-repeat',
							toggle : 'glyphicon-list-alt',
							columns : 'glyphicon-list'
						},
						queryParamsType : '', // 默认值为 'limit' ,在默认情况下
						// 传给服务端的参数为：offset,limit,sort
						// 设置为 '' 在这种情况下传给服务器的参数为：pageSize,pageNumber
						sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
						queryParams: queryParams,/// 前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
						columns : [
								{
									checkbox : true
								},
								{
									field : 'nid',
									title : '消息编号',
									visible : false
								},
								{
									field : 'title',
									title : '标题',
									visible : true,
									searchable : true
								},
								{
									field : 'publisher',
									title : '发布人编号',
									visible : false
								},
								{
									field : 'publishName',
									title : '发布人用户名',
									searchable : true
								},
								{
									field : 'createtime',
									title : '创建时间'
								},
								{
									field : 'content',
									title : '内容',
									formatter : function(value, row, index) {
										if (value.replace(/(^\s*)|(\s*$)/g, "").length > 8) {
											return value.replace(
													/(^\s*)|(\s*$)/g, "")
													.substring(0, 8)
													+ "....";
										} else {
											return value.replace(
													/(^\s*)|(\s*$)/g, "");
										}
									}
								} ]
					});

	$('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
		// console.log('Event:', name, ', data:', args);
	}).on('check.bs.table', function(e, row) { // 点击
		nArr.push(row);
		nid = row.nid;
		console.info(nArr);
		$("#newsDetailModal").modal("show");
	}).on('uncheck.bs.table', function(e, row) {
		$.each(nArr, function(i, obj) {
			if (obj.nid == row.nid) {
				nArr.splice(i, 1);
				return false;
			}
		});
		console.info(nArr);
	})
	// 全选
	.on('check-all.bs.table', function(e, row) {
		var $result = $('#examplebtTableEventsResult');
		var selects = $("td[class=bs-checkbox]").parent();
		$(selects).addClass("selected");
		nArr.splice(0, nArr.length);
		$.each(row, function(i, obj) {
			nArr.push(obj);
		});
		console.info(nArr);
	})
	// 取消全选
	.on('uncheck-all.bs.table', function(e, row) {
		var $result = $('#examplebtTableEventsResult');
		var selects = $("td[class=bs-checkbox]").parent();
		$(selects).removeClass("selected");
		nArr.splice(0, nArr.length); // 清除数组
		console.info(nArr);
	});

	$(".input-outline").attr("placeholder", "请输入标题");

	$("#infoform").submit(function(ev) {
		ev.preventDefault();
	});
}

/**
 * 删除
 */
NewsObj.delNews = function() {
	if (nArr.length == 0) {
		swal({
			title : "请选择至少一条消息项!",
			text : "请选择至少一条消息项",
			type : "error"
		}, function() {
			return;
		});
	} else {
		swal({
            title: "您确定要删除选中的消息吗",
            text: "请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除！",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            if (isConfirm) {
            	var nIds = [];
            	$.each(nArr,function(i,o){
            		nIds.push(o.nid);
            	});
            	$.post('../news/delNews',{
					'nIds' : nIds
				},function(data,status){
					if(data == "success"){
						swal({
		                    title: "删除成功！",
		                    text: "您已经删除了选中的产品信息",
		                    type: "success"
		                }, function () {
		                	window.location.reload();
		                });
						//swal("删除成功！", "您已经删除了选中的员工信息。", "success");
					}else{
						swal("删除失败", " :) ", "error");
					}
				});
            } else {
                swal("已取消", "您取消了删除操作！", "error");
            }
        });
	}
}

function queryParams(params) {
	  var temp = {
		  'pageSize' : params.limit,   //页面大小 
		  'pageNumber' : params.pageNumber,  //页码 
		  'searchText' : $(".input-outline").val()
	  }
	  return temp;
}