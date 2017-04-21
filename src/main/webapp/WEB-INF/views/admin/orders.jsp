<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="keywords" content="">
		<meta name="description" content="">

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
</head>
<body class="gray-bg">
		<input type="hidden" value="${mode }" id="mode" />
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="col-sm-12">
				<!-- Example Events -->
				<div class="example-wrap">
				<div id="modeResult" role="alert"></div>
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
                                        <i class="glyphicon glyphicon-ok" aria-hidden="true"></i>
                                    </button>
							<button type="button" class="btn btn-outline btn-default" id="delbtn">
                                        <i class="glyphicon glyphicon-remove" aria-hidden="true"></i>
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
						<h4 class="modal-title" id="showModalTitle">新增订单</h4>
						<!--<small class="font-bold">这里可以显示副标题。-->
					</div>
					<div class="modal-body">
						<form id="infoform" action="#">
							<input type="hidden" name="oid" id="oid" />
							<input type="hidden" name="adminId" id="adminId" />
							<div class="form-group"><label>客户名字</label>
								<input type="text" id="customername" name="customername" placeholder="请输入客户名字" class="form-control"></div>
							<div class="form-group"><label>客户收货地址</label>
								<input type="text" id="customeraddress" name="customeraddress" placeholder="客户收货地址" class="form-control"></div>
							<div class="form-group"><label>客户联系号码</label>
								<input type="text" id="customerphone" name="customerphone" placeholder="请输入客户联系号码" class="form-control"></div>
							<div class="form-group"><label>备注</label>
								<input type="text" id="note" name="note" placeholder="备注" class="form-control"></div>
							<div class="form-group"><label>产品</label>
								<%-- <iframe id="O_iframe" width="100%" height="100%" src="${ctx }/product/productList" frameborder="0" seamless></iframe> --%>
									<div class="col-sm-12" style="height: 250px;">
										<div class="ibox" style="height: 250px;">
										<div class="ibox-content">
											<table data-toggle="table" data-height="190" data-click-to-select="true" data-mobile-responsive="true">
			                                    <thead>
			                                        <tr>
			                                            <th data-field="name">产品名称</th>
			                                            <th data-field="price">单价</th>
			                                            <th data-field="number">数量</th>
			                                            <th data-field="state">删除</th>
			                                        </tr>
			                                     </thead>
			                                     <tbody id="productArea">
			                                     </tbody>
                                			</table>
										</div>
									</div>
									
								</div>
								<button type="button" id="showProduct" class="btn btn-block btn-w-m btn-success" data-toggle="modal" data-target="#pModal">+</button>
							</div>
                            <input type="hidden" name="createtime" id="creattime" />
							<input type="hidden" name="state" id="state" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveOrder">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--结束添加窗口-->
		
		<!-- 子modal -->
		<div class="modal inmodal" id="pModal" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <i class="fa fa-clock-o modal-icon"></i>
                        <h4 class="modal-title">添加产品</h4>
                    </div>
                    <div class="modal-body">
                        <!-- Example Radio Select -->
                                <table id="pTable" data-height="299" data-mobile-responsive="true">
                                    <thead>
                                       <!--  <tr>
                                            <th data-field="state" data-radio="true"></th>
                                            <th data-field="name">名称</th>
                                            <th data-field="price">价格</th>
                                            <th data-field="column1">列1</th>
                                        </tr> -->
                                    </thead>
                                </table>
                        <!-- End Example Radio Select -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-success" id="saveProduct">添加</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!--订单表项模态框 -->
        <div class="modal inmodal fade" id="orderInfo" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content animated flipInY">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">订单表项</h4>
                        <small class="font-bold">
                    </div>
                    <div class="modal-body">
                    <div class="row">
            <div class="col-sm-12">
                <div class="ibox-content p-xl">
                    <div class="row">
                        <div class="col-sm-6">
                            <address>
                                        <strong>韶关学院丁香苑C栋404</strong><br>
                                        <abbr title="Phone">总机：</abbr> (+86 10) 8888 8888
                                    </address>
                        </div>

                        <div class="col-sm-6 text-right">
                            <h4>单据编号：</h4>
                            <h4 class="text-navy" id="orderCode"></h4>
                            <address>
						                                 地址<strong id="clientAddress"></strong><br>
						                                 联系号码：<abbr title="Phone" id="clientPhone"></abbr>
                            </address>
                            <p>
                                <strong>日期：</strong><span id="orderDate"></span>
                            </p>
                        </div>
                    </div>

                    <div class="table-responsive m-t">
                        <table class="table invoice-table">
                            <thead>
                                <tr>
                                    <th>清单</th>
                                    <th>数量</th>
                                    <th>单价</th>
                                    <th>总价</th>
                                </tr>
                            </thead>
                            <tbody id="productList">
                                <!-- <tr>
                                    <td>
                                        <div><strong>尚都比拉2013冬装新款女装 韩版修身呢子大衣 秋冬气质羊毛呢外套</strong>
                                        </div>
                                    </td>
                                    <td>1</td>
                                    <td>&yen;26.00</td>
                                    <td>&yen;31,98</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div><strong>11*11夏娜 新款斗篷毛呢外套 女秋冬呢子大衣 韩版大码宽松呢大衣</strong>
                                        </div>
                                        <small>双十一特价
                                            </small>
                                    </td>
                                    <td>2</td>
                                    <td>&yen;80.00</td>
                                    <td>&yen;196.80</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div><strong>2013秋装 新款女装韩版学生秋冬加厚加绒保暖开衫卫衣 百搭女外套</strong>
                                        </div>
                                    </td>
                                    <td>3</td>
                                    <td>&yen;420.00</td>
                                    <td>&yen;1033.20</td>
                                </tr> -->

                            </tbody>
                        </table>
                    </div>
                    <!-- /table-responsive -->

                    <table class="table invoice-total">
                        <tbody>
                            <tr>
                                <td><strong>总价：</strong>
                                </td>
                                <td id="totalPrice"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="well m-t"><strong>注意：</strong> 请在30日内完成付款，否则订单会自动取消。
                    </div>
                </div>
            </div>
        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="print">打印</button>
                    </div>
                </div>
            </div>
        </div>

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
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
		<script src="${ctx}/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		
		<!-- Sweet alert -->
    	<script src="${ctx}/admin/js/plugins/sweetalert/sweetalert.min.js"></script>
    	
    	<!-- bootstrap-select -->
    	<script src="${ctx}/admin/js/plugins/bootstrap-select/bootstrap-select.js"></script>

		<!-- BootstrapValidator-->
		<script type="text/javascript" src="${ctx}/admin/js/bootstrapValidator.js" ></script>
		
		<!-- orders.js -->
		<script src="${ctx}/admin/js/orders.js"></script>

		<script type="text/javascript" type="text/javascript">
			
		</script>

</html>