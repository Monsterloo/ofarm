$(function(){
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