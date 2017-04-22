var IndexObj = {};

$(function(){
	IndexObj.bootstrapValidator();
    IndexObj.init();
	
    //菜单点击
    J_iframe
    $(".J_menuItem").on('click',function(){
        var url = $(this).attr('href');
        $("#J_iframe").attr('src',url);
        
        if(url.indexOf("?mode") > 0){
        	var modeParam = url.substring(url.indexOf("mode=")+5,url.indexOf("mode=")+6);
        	$("#modeParam").val(modeParam);
        	console.info(modeParam);
        }
        return false;
    });
    
    $.post('../product/findCount',{},
    	function(data,status){
    		if(status == "success"){
    			if(data != null){
    				$("#productCount").html(data);
    			}
    		}
    });
    
    $.post('../category/findCount',{},
        	function(data,status){
        		if(status == "success"){
        			if(data != null){
        				$("#categoryCount").html(data);
        			}
        		}
    });
    
});

/**
 * 修改信息
 */
IndexObj.modify = function(){
	// 获取表单对象
	var bootstrapValidator = $("#adminForm").data('bootstrapValidator');
	// 手动触发验证
	bootstrapValidator.validate();
	if (bootstrapValidator.isValid()) {
		$.post('../sysAdmin/modify',{
			'id':$("#id").val(),
			'loginname':$("#loginname").val(),
			'password':$("#password").val(),
			'phone':$("#phone").val(),
			'email':$("#email").val(),
			'createtime':$("#createtime").val(),
			'roletype':$("#roletype").val(),
			'state':$("#state").val(),
		},function(data,status){
			console.info(data);
			if(data != null){
				$("#id").val(data.id);
				$("#loginname").val(data.loginname);
				$("#phone").val(data.phone);
				$("#email").val(data.email);
				$("#createtime").val(data.createtime);
				$("#roletype").val(data.roletype);
				$("#state").val(data.state);
				swal({
					title : "修改成功!",
					text : "成功保存信息 ",
					type : "success"
				}, function() {
					$("#adminModal").modal("hide");
					window.location.reload();
				});
			}
		},'json');
	}
}

/**
 * 初始化事件
 */
IndexObj.init = function(){

	// 显示模态框
	$('#adminModal').on('shown.bs.modal', function() {
		//$('#adminForm').data('bootstrapValidator').resetForm(true);
		var id = $("#id").val();
		$.post('../sysAdmin/findById',{
			'id':id
		},function(data,status){
			console.info(data);
			if(data != null){
				$("#id").val(data.id);
				$("#loginname").val(data.loginname);
				$("#phone").val(data.phone);
				$("#email").val(data.email);
				$("#createtime").val(data.createtime);
				$("#roletype").val(data.roletype);
				$("#state").val(data.state);
			}
		},'json');
	});
	
	$("#saveAdmin").bind("click", function() {
		IndexObj.modify();
	});
	
}

/**
 * 验证
 */
IndexObj.bootstrapValidator = function(){
	$("#adminForm").bootstrapValidator({
		feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
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
}