var OrdersObj = {};
var oArr = new Array();
var selectcount = oArr.length;
var product;
var data_index = 0;

jQuery(function() {
	OrdersObj.reloadTable();
	OrdersObj.initEvents();
	OrdersObj.bootstrapValidator();
});

OrdersObj.reloadTable = function(){
	  $('#exampleTableEvents').bootstrapTable({
	      url: "../orders/findOrdersByPage",
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
	          field: 'oid',
	          title: '订单编号',
	          /*visible : false,*/
	          searchable: true
	      }, {
	          field: 'adminId',
	          title: '操作人编号',
	          visible : false
	      }, {
	          field: 'admin',
	          title: '操作人',
	          visible : true
	      }, {
	          field: 'customername',
	          title: '客户名字',
	          searchable: true
	      },{
	          field: 'customeraddress',
	          title: '客户收货地址',
	          searchable: true
	      }, {
	          field: 'customerphone',
	          title: '客户联系号码',
	          searchable: false
	      }, {
	          field: 'createtime',
	          title: '创建时间',
	          searchable: false
	      }, {
	          field: 'note',
	          title: '备注',
	          visible : true
	      }]
	    });

	  $('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
			//console.log('Event:', name, ', data:', args);
		}).on('check.bs.table', function(e, row) {
			oArr.push(row);
			console.info(oArr);
	        selectcount = oArr.length;
	   	}).on('uncheck.bs.table', function(e, row) {
	        oArr.splice($.inArray(row),1);
	        console.info(oArr);
	        selectcount = oArr.length;
	    })
		 //全选
		 .on('check-all.bs.table', function(e,row) {
			//$result.text('Event: check-all.bs.table');
			var $result = $('#examplebtTableEventsResult');
			var selects = $("td[class=bs-checkbox]").parent();
			$(selects).addClass("selected");
			oArr.splice(0,oArr.length);
	        $.each(row,function(i,obj){
	        	oArr.push(obj);
	        });
			//console.info(oArr);
			selectcount = oArr.length;
		 })
		 //取消全选
		 .on('uncheck-all.bs.table', function(e,row) {
			//$result.text('Event: uncheck-all.bs.table');
			var $result = $('#examplebtTableEventsResult');
			var selects = $("td[class=bs-checkbox]").parent();
			$(selects).removeClass("selected");
			oArr.splice(0,oArr.length);		//清除数组
			//console.info(oArr);
			selectcount = oArr.length;
		 });
	  
	  
	  $("#infoform").submit(function(ev){ev.preventDefault();});
}

OrdersObj.bootstrapValidator = function(){
	$("#infoform").bootstrapValidator({
		feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
      	customername:{
      		message: '客户名称验证失败',
              validators: {
                  notEmpty: {
                      message: '客户名称不能为空'
                  },
                  stringLength: {
                      min: 2,
                      max: 10,
                      message: '客户名称长度必须在2到10位之间'
                  }/*,
                  regexp: {
                      regexp: /^[a-zA-Z0-9_]+$/,
                      message: '用户名只能包含大写、小写、数字和下划线'
                  }*/
              }
      	},
      	
      	customeraddress:{
      		message: '客户收货地址验证失败',
              validators: {
                  notEmpty: {
                      message: '客户收货地址不能为空'
                  },
                  stringLength: {
                      min: 2,
                      max: 50,
                      message: '客户收货地址长度必须在2到50位之间'
                  }
              }
      	},
      	
      	customerphone :{
      		validators: {
                  notEmpty: {
                      message: '客户联系号码不能为空'
                  },
                  regexp: {
                      //regexp: /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/,
                      regexp: /^1[0-9]{10}$/,
                      message: '客户联系号码不合法'
                  }
              }
      	},
      	
      	customername:{
      		message: '客户名称验证失败',
              validators: {
                  notEmpty: {
                      message: '客户名称不能为空'
                  },
                  stringLength: {
                      min: 2,
                      max: 10,
                      message: '产品名称长度必须在2到10位之间'
                  }
              }
      	},
      	/*
      	
      	note :{
      		validators: {
                  notEmpty: {
                      message: '客户名称不能为空'
                  },
                  stringLength: {
                      min: 2,
                      max: 10,
                      message: '产品名称长度必须在2到10位之间'
                  }
              }
      	}*/
      	
      }
      //fields
      
	});
}

OrdersObj.submit = function(){
	//获取表单对象
	var bootstrapValidator = $("#infoform").data('bootstrapValidator');
	//手动触发验证
	//bootstrapValidator.validate();
	//if(bootstrapValidator.isValid()){
		var $area = $("#productArea");
		var $trs = $area.find("tr");
		var detailArr = [];
		var detail = "";
		var submit = true;
		
		$.each($trs,function(i, o){
			var pid = $(o).attr("p-id");
			var number = $(o).children().eq(2).children().val();
			if(!isNumber(number)){
				submit = false;
				swal({
		              title: "数量列请输入正确的整数",
		              text: "请输入正确格式的整数",
		              type: "error"
		          }, function () {
		          	return;
		        });
			}
			detail = pid+"#"+number;
			detailArr.push(detail);
		});
		
		if(submit == true){
			console.info(detailArr);
			var customername = $("#customername").val();
			var customeraddress = $("#customeraddress").val();
			var customerphone = $("#customerphone").val();
			var note = $("#note").val();
			$.post('../orders/insertOrder',{
				'customername':customername,
				'customeraddress':customeraddress,
				'customerphone':customerphone,
				'note':note,
				'detailArr':detailArr
			}, function(data,status){
				if(data.state == "1"){
					swal({
		                title: "保存成功!",
		                text: "成功保存 生成订单  "+data.oid,
		                type: "success"
		            }, function () {
		            	$("#myModal").modal("hide");
		            	OrdersObj.reloadTable();
		            	window.location.reload();
		            });
				} else if(data.state == "-1"){
					swal({
		                title: "保存失败!",
		                text: data.note,
		                type: "error"
		            }, function () {
		            	return;
		            });
				}
			}, 'json');
		}
	//}
}

OrdersObj.initEvents = function(){
	//添加订单
	$("#saveOrder").bind("click", function(){
		OrdersObj.submit();
	});
	
	//移除产品项
	$("#productArea").delegate("button","click",function(e){
		var $tr = $(this).parent().parent();
		$tr.remove();
		if($("#productArea").find("tr").length < 1){
			$noRecords = $('<tr class="no-records-found"><td colspan="4">没有找到匹配记录</td></tr>');
			$("#productArea").append($noRecords);
		}
	});
	
	//添加产品
	$("#saveProduct").bind("click", function(){
		if($("#pTable .selected").length < 1){
			swal({
	              title: "请选择至少一条产品项!",
	              text: "请选择至少一条产品项",
	              type: "error"
	          }, function () {
	          	return;
	        });
		}else{
			var trs = $("#productArea").find("tr");
			var pIds = [];
			var add = true;
			$.each(trs,function(i, o){
				pIds.push($(o).attr("p-id"));
			});
			$.each(pIds, function(i, id){
				if(product.pid == id){
					add = false;
					swal({
			              title: "本订单已经添加了该产品!",
			              text: "本订单已经添加了该产品",
			              type: "error"
			          }, function () {
			          	return false;
			          });
				}	
			});
			if(add == true){
				var $area = $("#productArea");
				$tr = $('<tr data-index='+data_index+' p-id="'+product.pid+'">'+
					'<td>'+product.pname+'</td>' +
					'<td>'+product.price+'</td>' +
					'<td><input type="text" name="pnumber" placeholder="请输入数量" /></td>' +
					'<td><button class="btn btn-danger btn-circle" type="button"><i class="fa fa-times"></i></button></td>'+
				+'</tr>');
				data_index++;
				$("#pModal").modal("hide");
				$area.prepend($tr);
				$(".no-records-found").remove();
			}
		}
	});
	
	//显示添加模态框
	$("#insertbtn").bind("click",function(){
		$("#myModal").modal("show");
		$(".modal-title").html("添加新产品");
	});
	
	//加载子模态框
	$("#showProduct").bind("click",function(){
		$('#pTable').bootstrapTable({
		      url: "../product/findProductByPage",
		      search: true,
		      striped: true,
		      height: "400",
			  clickToSelect: true,
		      pagination: true,
		      showRefresh: true,
		      showToggle: true,
		      showColumns: true,
		      sortable: true,
		      pageSize: 10,
		   	  pageList: [10, 20, 30],
		      iconSize: 'outline',
		      icons: {
		        refresh: 'glyphicon-repeat',
		        toggle: 'glyphicon-list-alt',
		        columns: 'glyphicon-list'
		      },
		      queryParamsType:'', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
		      					  // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
		      sidePagination: "server",  //分页方式：client客户端分页，server服务端分页（*）
		      //queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
		      columns: [ {
		          radio: true
		      }, {
		    	  field: 'pname',
		          title: '产品名字',
		          /*visible : false,*/
		          searchable: true
		      }, {
		    	  field: 'price',
		          title: '单价',
		          searchable: true
		      }, {
		    	  field: 'punit',
		          title: '单位',
		          searchable: false
		      }, {
		    	  field: 'inventory',
		          title: '库存数',
		          searchable: false
		      }]
		    });
		
		$('#pTable').on('all.bs.table', function(e, name, args) {
			console.log('Event:', name, ', data:', args);
		}).on('check.bs.table', function(e, row) {
			product = row;
			console.info(product);
	   	});
	});
	
	//修改信息
	$("#editbtn").bind("click",function(){
		if(oArr.length == 0){
			swal({
              title: "请选择至少一条订单项!",
              text: "请选择至少一条订单项",
              type: "error"
          }, function () {
          	return;
          });
		}else{
			swal({
              title: "您确定要完成选中的订单吗",
              text: "请谨慎操作！",
              type: "success",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "完成！",
              cancelButtonText: "取消",
              closeOnConfirm: false,
              closeOnCancel: false
          },
          function (isConfirm) {
              if (isConfirm) {
              	/*var pIds = [];
              	$.each(cArr,function(i,o){
              		pIds.push(o.pid);
              	});
              	$.post('../product/delProduct',{
						'pIds' : pIds
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
					});*/
              } else {
                  swal("已取消", "您取消了完成操作！", "error");
              }
          });
			
		} 
	});
	
	//关闭模态框
	$('#myModal').on('hide.bs.modal', function () {
		$('#infoform').data('bootstrapValidator').resetForm(true);
	});
	
	//显示模态框
	$('#myModal').on('shown.bs.modal', function () {
		$('#infoform').data('bootstrapValidator').resetForm(true);
	});
	
	//第二个模态框关闭
	$('#pModal').on('hidden.bs.modal', function() {
		$("body").addClass("modal-open");	//解决第二个模态框关闭后不能滚动问题
	});
	
	//显示模态框之前
	$('#myModal').on('show.bs.modal', function () {
	});
	
	//删除消息
	$("#delbtn").bind("click",function(){
		if(oArr.length == 0){
			swal({
              title: "请选择至少一条订单项!",
              text: "请选择至少一条订单项",
              type: "error"
          }, function () {
          	return;
          });
		}else{
			swal({
              title: "您确定要取消选中的订单吗",
              text: "请谨慎操作！",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "取消！",
              cancelButtonText: "返回",
              closeOnConfirm: false,
              closeOnCancel: false
          },
          function (isConfirm) {
              if (isConfirm) {
              	/*var pIds = [];
              	$.each(cArr,function(i,o){
              		pIds.push(o.pid);
              	});
              	$.post('../product/delProduct',{
						'pIds' : pIds
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
					});*/
              } else {
                  swal("已取消", "您取消了取消操作！", "error");
              }
          });
			
		} 
	});
  
	
}


function isNumber(number){
	var reg = new RegExp("^([0-9]|[1-9][0-9]+)$","g");
	return reg.test(number);
}