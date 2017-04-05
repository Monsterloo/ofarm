var ProductObj = {};


/*(function(document, window, $) {

  (function() {
	  ProductObj.reloadTable();
	  ProductObj.initEvents();
	  
  })();
})(document, window, jQuery);*/

$(document).ready(function() {
	ProductObj.reloadTable();
	ProductObj.initEvents();
});

ProductObj.reloadTable = function(){
	  $('#exampleTableEvents').bootstrapTable({
	      url: "../product/findProductByPage",
	      search: true,
	      striped: true,
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
  }

ProductObj.initEvents = function(){
	//添加信息
	$("#insertbtn").bind("click",function(){
		$("#myModal").modal("show");
		$('#infoform').data('bootstrapValidator').resetForm(true);
		$("#loginname").removeAttr("readOnly");
		$("#id").val();
		$("#createtime").val();
		$("#roletype").val();
		$("#state").val();
		$(".modal-title").html("添加员工信息");
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

