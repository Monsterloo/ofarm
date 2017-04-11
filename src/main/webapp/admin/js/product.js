var ProductObj = {};
var nodeArr = [];
var sonnodeArr = [];
var cArr = new Array();
var selectcount = cArr.length;
var index = 0;	//添加||编辑

//Web Uploader实例
var uploader;

jQuery(function() {
	ProductObj.reloadTable();
	ProductObj.initEvents();
	ProductObj.bootstrapValidator();
	//ProductObj.initUpload();
});

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
	          title: '产品类别编号',
	          searchable: false,
	          visible : false
	      }, {
	          field: 'pcategoryName',
	          title: '产品类别',
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
	          field: 'pimgStr',
	          title: '图片路径',
	          visible : false
	      }, {
	          field: 'pimg',
	          title: '图片',
		      formatter: function(value,row,index){
	            return '<img class="formatImg" src="'+value+'" />';
		      }
	      }, { 
	          field: 'inventory',
	          title: '库存数',
	          searchable: false
	      }]
	    });

	  $('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
			console.log('Event:', name, ', data:', args);
		}).on('check.bs.table', function(e, row) {
			cArr.push(row);
			console.info(cArr);
	        selectcount = cArr.length;
	   	}).on('uncheck.bs.table', function(e, row) {
	        cArr.splice($.inArray(row),1);
	        console.info(cArr);
	        selectcount = cArr.length;
	    })
		 //全选
		 .on('check-all.bs.table', function(e,row) {
			//$result.text('Event: check-all.bs.table');
			var $result = $('#examplebtTableEventsResult');
			var selects = $("td[class=bs-checkbox]").parent();
			$(selects).addClass("selected");
			cArr.splice(0,cArr.length);
	        $.each(row,function(i,obj){
	        	cArr.push(obj);
	        });
			console.info(cArr);
			selectcount = cArr.length;
		 })
		 //取消全选
		 .on('uncheck-all.bs.table', function(e,row) {
			//$result.text('Event: uncheck-all.bs.table');
			var $result = $('#examplebtTableEventsResult');
			var selects = $("td[class=bs-checkbox]").parent();
			$(selects).removeClass("selected");
			cArr.splice(0,cArr.length);		//清除数组
			console.info(cArr);
			selectcount = cArr.length;
		 });  
	  
	    /*$('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
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

ProductObj.submit = function(){
	//获取表单对象
	var bootstrapValidator = $("#infoform").data('bootstrapValidator');
	//手动触发验证
	bootstrapValidator.validate();
	if(bootstrapValidator.isValid()){
		var pid = $("#pid").val(); 
		var pname = $("#pname").val();
		var pcategory = $("li[class=selected]").children().attr("data-tokens");
		console.log(pcategory);
		var price = $("#price").val();
		var punit = $("#punit").val();
		var origin = $("#origin").val();
		var inventory = $("#inventory").val();
		var pimg = $("#pimg").val();
		var createtime = $("#createtime").val();
		var state = $("#state").val();
		
		uploader.options.formData.pid = pid;
		uploader.options.formData.pname = pname;
		uploader.options.formData.pcategory = pcategory;
		uploader.options.formData.price = price;
		uploader.options.formData.punit = punit;
		uploader.options.formData.origin = origin;
		uploader.options.formData.inventory = inventory;
		uploader.options.formData.pimg = pimg;
		uploader.options.formData.createtime = createtime;
		uploader.options.formData.state = state;
		uploader.options.formData.index = index;  // 添加 || 编辑
		uploader.upload(); //执行手动图片提交
	}else{
		return;
	}
}

ProductObj.initUpload = function(){
	var $ = jQuery,
	$list = $('#fileList'),
    // 优化retina, 在retina下这个值是2
    ratio = window.devicePixelRatio || 1,
    // 缩略图大小
    thumbnailWidth = 100 * ratio,
    thumbnailHeight = 100 * ratio;
	uploader = WebUploader.create({ 
		auto: false, // 选完文件后，是否自动上传 
		swf: '../admin/js/plugins/webuploader/Uploader.swf', // swf文件路径 
		server: '../product/uploader', // 文件接收服务端 
		pick: '#filePicker', // 选择文件的按钮。可选 
		threads:'5',        //同时运行5个线程传输
        fileNumLimit:'1',  //文件总数量只能选择1个 
        fileSingleSizeLimit: 2 * 1024* 1024,    // 2 M
        resize : false,// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        disableGlobalDnd: true,		//取消图片拖拽进网页为打开图片
        dnd: '#dndArea',	//拖拽图片,配合disableGlobalDnd:true
		// 只允许选择图片文件。 
		accept: { 
			title: 'Images', 
			extensions: 'gif,jpg,jpeg,bmp,png', 
			mimeTypes: 'image/*' 
		}
	});
	
	/**
     * 验证文件格式以及文件大小
     */
	uploader.on( 'error', function( handler ) {
		console.info(handler);
		if (handler=="Q_TYPE_DENIED"){
			swal({
                title: "上传失败",
                text: "请上传图片格式文件",
                type: "error"
            }, function () {
            	
            });
        }else if(handler=="Q_EXCEED_SIZE_LIMIT"){
        	swal({
                title: "上传失败",
                text: "文件大小不能超过2M",
                type: "error"
            }, function () {
            	
            });
        }

	});
	
	//开始上传时
	uploader.on( 'startUpload', function( file ) {
		//对没有选择图片的情况处理	新增必须选择图片,编辑不限制
		if(index == 0){
			if(file == null || typeof(file) == "undefined"){
	    		swal({
	                title: "请选择图片",
	                text: "请选择图片",
	                type: "error"
	            }, function () {
	            	return;
	            });
	    	}
		} else if(index == 1 && (file == null || typeof(file) == "undefined")){
			var pid = $("#pid").val(); 
			var pname = $("#pname").val();
			var pcategory = $("li[class=selected]").children().attr("data-tokens");
			var price = $("#price").val();
			var punit = $("#punit").val();
			var origin = $("#origin").val();
			var inventory = $("#inventory").val();
			var pimg = $("#pimg").val();
			var createtime = $("#createtime").val();
			var state = $("#state").val();
			$.post('../product/insertProduct',{
				'pid':pid,
				'pname':pname,
				'pcategory':pcategory,
				'price':price,
				'punit':punit,
				'origin':origin,
				'inventory':inventory,
				'pimg':pimg,
				'createtime':createtime,
				'state':state
			}, function(data, status){
				swal({
	                title: "保存成功!",
	                text: "成功保存  "+data.pname,
	                type: "success"
	            }, function () {
	            	$("#myModal").modal("hide");
	            	ProductObj.reloadTable();
	            	window.location.reload();
	            });
			},'json');
		}
	});
	
	// 当有文件添加进来的时候，创建img显示缩略图使用
    uploader.on( 'fileQueued', function( file ) {
    	
    	
        var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
            '</div>'
            ),
        $img = $li.find('img');

        // $list为容器jQuery实例
        $list.append( $li );

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );
    });

    // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress span');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
        }

        $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
    uploader.on( 'uploadSuccess', function( file,response) {
	    $( '#'+file.id ).addClass('upload-state-done');
	    //console.info(response);
	    $("#upInfo").html("<font color='red'>"+/*response._raw*/ "上传成功" +"</font>");
	    
	    if(response != null){
	    	swal({
                title: "保存成功!",
                text: "成功保存  "+response.pname,
                type: "success"
            }, function () {
            	$("#myModal").modal("hide");
            	ProductObj.reloadTable();
            	window.location.reload();
            });
	    }
    });

    // 文件上传失败                                file:文件对象 ， code：出错代码
    uploader.on( 'uploadError', function(file,code) {
        var $li = $( '#'+file.id ),
            $error = $li.find('div.error');

        // 避免重复创建
        if ( !$error.length ) {
            $error = $('<div class="error"></div>').appendTo( $li );
        }

        $error.text('上传失败!');
        
    });
    

    // 不管成功或者失败，文件上传完成时触发。 file： 文件对象
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
        //that.removeFile( file,true );
    });

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
        	
        	punit:{
        		message: '产品单位验证失败',
        		validators: {
                    notEmpty: {
                        message: '产品单位不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: '产品单位长度必须在1到5位之间'
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


ProductObj.initEvents = function(){
	//提交表单
	$(".btn-primary").bind("click", function(){
		ProductObj.submit();
	});
	
	//修改信息
	$("#editbtn").bind("click",function(){
		if(selectcount > 1){
			swal({
                title: "请选择一条产品项!",
                text: "请选择一条产品项",
                type: "error"
            }, function () {
            	return;
            });
		}else if(selectcount == 0){
			swal({
                title: "请选择产品项!!",
                text: "请选择管产品项!",
                type: "error"
            }, function () {
            	return;
            });
		}else{
			$("#myModal").modal("show");
			$(".modal-title").html("修改产品信息");
			index = 1;
			console.log(cArr[0]);
			$("#pid").val(cArr[0].pid);
			$("#pname").val(cArr[0].pname);
			$("#price").val(cArr[0].price);
			$("#punit").val(cArr[0].punit);
			$("#origin").val(cArr[0].origin);
			$("#inventory").val(cArr[0].inventory);
			$("#pimg").val(cArr[0].pimg);
			$("#createtime").val(cArr[0].createtime);
			$("#state").val(cArr[0].state);
		}
	});
	
	//关闭模态框
	$('#myModal').on('hide.bs.modal', function () {
		$('#infoform').data('bootstrapValidator').resetForm(true);
	    uploader.destroy();
	});
	
	//显示模态框
	$('#myModal').on('shown.bs.modal', function () {
		// 当domReady的时候开始初始化
        ProductObj.initUpload();
        $('#infoform').data('bootstrapValidator').resetForm(true);
    });
	
	//显示模态框之前
	$('#myModal').on('show.bs.modal', function () {
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
				 
				if(index == 1){
					if(cArr[0].pcategoryName != null && cArr[0].pcategoryName != "" && typeof(cArr[0].pcategoryName) != "undefined"){
						$('#pcategory').val(cArr[0].pcategoryName);		//设置默认值
					}
				}
				//更新内容刷新到相应的位置
				$('#pcategory').selectpicker('render');
                $('#pcategory').selectpicker('refresh');
			}
		});
    });
	
	//删除消息
	$("#delbtn").bind("click",function(){
		if(cArr.length == 0){
			swal({
                title: "请选择至少一条产品项!",
                text: "请选择至少一条产品项",
                type: "error"
            }, function () {
            	return;
            });
		}else{
			swal({
                title: "您确定要删除选中的信息吗",
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
                	var pIds = [];
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
					});
                } else {
                    swal("已取消", "您取消了删除操作！", "error");
                }
            });
			
		} 
	});
    
	//添加信息
	$("#insertbtn").bind("click",function(){
		$("#myModal").modal("show");
		$(".modal-title").html("添加新产品");
		index = 0;
	});
	
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


function queryParams(params) {
  return {
    type: 'owner',
    sort: 'updated',
    direction: 'desc',
    per_page: 100,
    page: 1
  };
}




