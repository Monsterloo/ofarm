<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>商品分类树</title>

		<meta name="keywords" content="">
		<meta name="description" content="">

		<link rel="shortcut icon" href="favicon.ico">
		<link href="${ctx}/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
		<link href="${ctx}/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
		<link href="${ctx}/admin/css/style.css?v=4.1.0" rel="stylesheet">
		<link rel="stylesheet" href="${ctx}/admin/css/plugins/zTree/demo.css" type="text/css" />
		<link rel="stylesheet" href="${ctx}/admin/css/plugins/zTree/zTreeStyle/zTreeStyle.css" />
		<!--添加按钮样式-->
		<style type="text/css">
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
		</style>
</head>
<body class="gray-bg">
		<div class="wrapper wrapper-content  animated fadeInRight">
			<div class="row">
				<div class="col-sm-12">
					<div id="nestable-menu">
						<button type="button" data-action="expand-all" class="btn btn-white btn-sm">展开所有</button>
						<button type="button" data-action="collapse-all" class="btn btn-white btn-sm">收起所有</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">

					<div class="ibox ">
						<div class="ibox-title">
							<h5>商品分类树 </h5>
						</div>
						<div class="zTreeDemoBackground center">
							<ul id="treeDemo" class="ztree"></ul>
						</div>

						<div class="ibox-content">
							<p class="m-b-lg">
								<strong>商品分类树</strong>
							</p>

							<div class="m-t-md">
								<button class="btn btn-info btn-circle btn-lg" type="button" id="save"><i class="fa fa-check"></i>
                            </button>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>

		<!-- 全局js -->
		<script src="${ctx}/admin/js/jquery.min.js?v=2.1.4"></script>
		<script src="${ctx}/admin/js/bootstrap.min.js?v=3.3.6"></script>

		<!-- 自定义js -->
		<script type="text/javascript" src="${ctx}/admin/js/plugins/zTree/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="${ctx}/admin/js/plugins/zTree/jquery.ztree.excheck.js"></script>
		<script type="text/javascript" src="${ctx}/admin/js/plugins/zTree/jquery.ztree.exedit.js"></script>
		<script type="text/javascript">
			var setting = {
				view: {
					addHoverDom: addHoverDom,
					removeHoverDom: removeHoverDom,
					selectedMulti: false
				},
				edit: {
					enable: true,
					editNameSelectAll: true
					/*,
									showRemoveBtn: showRemoveBtn,
									showRenameBtn: showRenameBtn*/
				},
				data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
					beforeDrag: beforeDrag,
					/*beforeEditName: beforeEditName,*/
					beforeRemove: beforeRemove,
					beforeRename: beforeRename,
					onRemove: onRemove,
					onRename: onRename
				}
			};

			/*var zNodes = [
				 { id: 1, pId: 0, name: "pNode 1", open: true },
				{ id: 11, pId: 1, name: "pNode 11" },
				{ id: 111, pId: 11, name: "leaf node 111" },
				{ id: 112, pId: 11, name: "leaf node 112" },
				{ id: 113, pId: 11, name: "leaf node 113" },
				{ id: 114, pId: 11, name: "leaf node 114" },
				{ id: 12, pId: 1, name: "pNode 12" },
				{ id: 121, pId: 12, name: "leaf node 121" },
				{ id: 122, pId: 12, name: "leaf node 122" },
				{ id: 123, pId: 12, name: "leaf node 123" },
				{ id: 124, pId: 12, name: "leaf node 124" },
				{ id: 13, pId: 1, name: "pNode 13 - no child", isParent: true },
				{ id: 2, pId: 0, name: "pNode 2" },
				{ id: 21, pId: 2, name: "pNode 21", open: true },
				{ id: 211, pId: 21, name: "leaf node 211" },
				{ id: 212, pId: 21, name: "leaf node 212" },
				{ id: 213, pId: 21, name: "leaf node 213" },
				{ id: 214, pId: 21, name: "leaf node 214" },
				{ id: 22, pId: 2, name: "pNode 22" },
				{ id: 221, pId: 22, name: "leaf node 221" },
				{ id: 222, pId: 22, name: "leaf node 222" },
				{ id: 223, pId: 22, name: "leaf node 223" },
				{ id: 224, pId: 22, name: "leaf node 224" },
				{ id: 23, pId: 2, name: "pNode 23" },
				{ id: 231, pId: 23, name: "leaf node 231" },
				{ id: 232, pId: 23, name: "leaf node 232" },
				{ id: 233, pId: 23, name: "leaf node 233" },
				{ id: 234, pId: 23, name: "leaf node 234" },
				{ id: 3, pId: 0, name: "pNode 3 - no child", isParent: true },
				{ id: uuid(32,16), pId: 0, name: "pNode 3 - no child", isParent: true }
			]; */

			var log, className = "dark";

			function beforeDrag(treeId, treeNodes) {
				return false;
			}
			/*function beforeEditName(treeId, treeNode) {
				className = (className === "dark" ? "":"dark");
				showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				setTimeout(function() {
					if (confirm("Start node '" + treeNode.name + "' editorial status?")) {
						setTimeout(function() {
							zTree.editName(treeNode);
						}, 0);
					}
				}, 0);
				return false;
			}*/
			function beforeRemove(treeId, treeNode) {
				className = (className === "dark" ? "" : "dark");
				showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				return confirm("确定删除 '" + treeNode.name + "' 类别及其子类别吗?");
			}

			function onRemove(e, treeId, treeNode) {
				showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			}

			function beforeRename(treeId, treeNode, newName, isCancel) {
				className = (className === "dark" ? "" : "dark");
				showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
				if(newName.length == 0) {
					setTimeout(function() {
						var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						zTree.cancelEditName();
						alert("类别名字不能为空!");
					}, 0);
					return false;
				}
				return true;
			}

			function onRename(e, treeId, treeNode, isCancel) {
				showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
			}

			function showRemoveBtn(treeId, treeNode) {
				return !treeNode.isFirstNode;
			}

			function showRenameBtn(treeId, treeNode) {
				return !treeNode.isLastNode;
			}

			function showLog(str) {
				if(!log) log = $("#log");
				log.append("<li class='" + className + "'>" + str + "</li>");
				if(log.children("li").length > 8) {
					log.get(0).removeChild(log.children("li")[0]);
				}
			}

			function getTime() {
				var now = new Date(),
					h = now.getHours(),
					m = now.getMinutes(),
					s = now.getSeconds(),
					ms = now.getMilliseconds();
				return(h + ":" + m + ":" + s + " " + ms);
			}

			var newCount = 1;

			function addHoverDom(treeId, treeNode) {
				var sObj = $("#" + treeNode.tId + "_span");
				if(treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.tId +
					"' title='add node' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				var btn = $("#addBtn_" + treeNode.tId);
				if(btn) btn.bind("click", function() {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					zTree.addNodes(treeNode, { id: (uuid(32,16)), pId: treeNode.id, name: "new node" + (newCount++) });
					return false;
				});
			};

			function removeHoverDom(treeId, treeNode) {
				$("#addBtn_" + treeNode.tId).unbind().remove();
			};
			/*function selectAll() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
			}*/

			$(document).ready(function() {
				debugger;
				var zNodes = null;
				$.ajax({
			    	url:'${ctx}/category/getAllCategory',
			        type: 'POST',
			        dataType: 'json',
			        success: function (json) {
			        	//console.info(JSON.stringify(json));
			        	zNodes = json;
			        }
				});
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			});

			$("#save").click(function() {
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				var node = treeObj.getNodes();
				var nodes = treeObj.transformToArray(node);
				for(var i = 0; i < nodes.length; i++) {
					console.info(nodes[i].id + "  " + nodes[i].pId + "  " + nodes[i].name);
				}
			});

			function uuid(len, radix) {
				var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
				var uuid = [],
					i;
				radix = radix || chars.length;

				if(len) {
					// Compact form  
					for(i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
				} else {
					// rfc4122, version 4 form  
					var r;

					// rfc4122 requires these characters  
					uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
					uuid[14] = '4';

					// Fill in random data.  At i==19 set the high bits of clock sequence as  
					// per rfc4122, sec. 4.1.5  
					for(i = 0; i < 36; i++) {
						if(!uuid[i]) {
							r = 0 | Math.random() * 16;
							uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
						}
					}
				}

				return uuid.join('');
			}
		</script>

	</body>

</html>