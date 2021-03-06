var LoginObj = {};

jQuery(function() {
	LoginObj.bootstrapValidator();
	LoginObj.initEvents();
});

/**
 * 登录提交
 */
LoginObj.submit = function(){
	// 获取表单对象
	var bootstrapValidator = $("#loginForm").data('bootstrapValidator');
	// 手动触发验证
	bootstrapValidator.validate();
	if (bootstrapValidator.isValid()) {
		loginForm.submit();
		/*$.post('../backstage/index',{
			'loginname' : $("#loginname").val(),
			'password' : $("#password").val()
		},function(data,status){
			if(status == "success"){
				var errorMsg = $("#errorMsg").val();
				if(errorMsg != null && errorMsg != "" && typeof(errorMsg) != "undefine"){
					swal({
						title : errorMsg,
						type : "error"
					}, function() {
						return;
					});
				}
			}
		},'json');*/
	}
	
}

/**
 * 初始化事件
 */
LoginObj.initEvents = function() {
	$("#login").bind("click", function() {
		LoginObj.submit();
	});
}

/**
 * 验证
 */
LoginObj.bootstrapValidator = function() {
	$("#loginForm").bootstrapValidator({
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
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
        	}
		}
	// fields
	});
}