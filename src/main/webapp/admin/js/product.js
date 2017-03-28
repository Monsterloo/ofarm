/*!
 * Remark (http://getbootstrapadmin.com/remark)
 * Copyright 2015 amazingsurge
 * Licensed under the Themeforest Standard Licenses
 */
function cellStyle(value, row, index) {
  var classes = ['active', 'success', 'info', 'warning', 'danger'];

  if (index % 2 === 0 && index / 2 < classes.length) {
    return {
      classes: classes[index / 2]
    };
  }
  return {};
}

function rowStyle(row, index) {
  var classes = ['active', 'success', 'info', 'warning', 'danger'];

  if (index % 2 === 0 && index / 2 < classes.length) {
    return {
      classes: classes[index / 2]
    };
  }
  return {};
}

function scoreSorter(a, b) {
  if (a > b) return 1;
  if (a < b) return -1;
  return 0;
}

function nameFormatter(value) {
  return value + '<i class="icon wb-book" aria-hidden="true"></i> ';
}

function starsFormatter(value) {
  return '<i class="icon wb-star" aria-hidden="true"></i> ' + value;
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

 function reloadTable(){
	  $('#exampleTableEvents').bootstrapTable({
	      url: "js/demo/bootstrap_table_test.json",
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
	          field: 'origin',
	          title: '产地',
	          searchable: false
	      }, {
	          field: 'pimg',
	          title: '图片',
		      formatter: function(value,row,index){
	            return '<img  src="css/plugins/zTree/zTreeStyle/img/diy/3.png" />';
		      }
	      }, { 
	          field: 'inventory',
	          title: '库存数',
	          searchable: false
	      }]
	    });

	    /*{
	        field: 'phone',
	        title: '图片',
	        formatter: function(value,row,index){
	            return '<img  src="http://localhost:8080/ofarm/admin/css/plugins/zTree/zTreeStyle/img/diy/3.png" />';
	      }*/
	    
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

(function(document, window, $) {
  // Example Bootstrap Table Events
  // ------------------------------
  (function() {
    $('#exampleTableEvents').bootstrapTable({
      url: "js/demo/bootstrap_table_test.json",
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
      }
    });

    var $result = $('#examplebtTableEventsResult');
    var check = $("checkbox");

    /*$('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
        console.log('Event:', name, ', data:', args);
      })*/
      /*.on('click-row.bs.table', function(e, row, $element) {
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
      })*/
     /* .on('check-all.bs.table', function(e) {
        $result.text('Event: check-all.bs.table');
        var check = $("checkbox");
        console.info(check);
      })*/
      /*.on('uncheck-all.bs.table', function(e) {
        $result.text('Event: uncheck-all.bs.table');
      })*/
      /*.on('load-success.bs.table', function(e, data) {
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
     reloadTable();
  })();
})(document, window, jQuery);
