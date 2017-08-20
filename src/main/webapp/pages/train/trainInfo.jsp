<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
<div class="block">
	<div class="navbar navbar-inner block-header">
		<div class="muted pull-left">
			<ul class="breadcrumb">
				<i class='icon-chevron-left hide-sidebar'><a href='#'
					title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
				<i class='icon-chevron-right show-sidebar" style="display: none;'><a
					href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
				<li><a href="#">资源管理</a> <span class="divider">/</span></li>
				<li class="active">培训管理</li>
			</ul>
		</div>
	</div>
	<div class="block-content collapse in">
		<ul class="nav nav-tabs">
			<li><a href="${basepath}/train/addTrain">培训列表</a></li>
			<li class="active"><a href="${basepath}/train/addTrainInfo">培训添加</a></li>
		</ul>
		<div class="span12">
			<div <c:if test="${flagcg==1}">class="alert alert-success"</c:if>
				<c:if test="${flagcg==0}">class="alert alert-error"</c:if>
				style="margin-right: 8%; text-align: center;" id="messagealert">
				<button class="close" id="closebut">&times;</button>
				<c:if test="${flagcg==1}">
					<strong>保存成功！</strong>
				</c:if>
				<c:if test="${flagcg==0}">
					<strong>保存失败！</strong>
				</c:if>
			</div>
			<form id="caseinfoform" class="form-horizontal"
				action="${basepath}/train/saveTrain" method="post">
				<fieldset>
					<legend>培训管理</legend>
					<div class="control-group">
						<label class="control-label">培训名称：</label>
						<div class="controls">
							<input class="input-xlarge focused" id="trainname"
								name="train.trainname" type="text" placeholder="请输入培训名称!"
								value="${train.trainname}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="trainstarttime">培训开始时间：</label>
						<div class="controls">
							<input name="train.id" type="hidden" value="${train.id}">
							<input class="input-medium datetimepicker" id="trainstarttime"
								name="train.trainstarttime" type="text" placeholder="请输入培训开始时间!"
								value="${train.trainstarttime}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="trainendtime">培训结束时间：</label>
						<div class="controls">
							<input class="input-medium datetimepicker" id="trainendtime"
								name="train.trainendtime" type="text" placeholder="请输入培训结束时间!"
								value="${train.trainendtime}">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="mobile">培训描述：</label>
						<div class="controls">
							<textarea id="traininfo" name="train.traininfo"
								placeholder="请输入培训描述!" rows="10" style="width: 50%;">${train.traininfo}</textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="curriculumId">课程名称：</label>
						<div class="controls">
						<select
							class="span6 m-wrap" id="curriculumId" name="train.curriculumId">
							<option value=''>请选择</option>
							<c:forEach var="curriculum" items="${curriculumlist}">
								<option value="${curriculum.id}"
									<c:if test="${curriculum.id==train.curriculumId}">selected</c:if>>${curriculum.coursename}</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">培训人员：</label>
						<div class="controls">
							<!-- 弹出层 start -->
							<div class="modal hide fade" id="oModal" tabindex="-1"
								role="dialog">
								<div class="modal-header">
									<button class="close" type="button" data-dismiss="modal">×</button>
									<h3 id="myModalLabel">培训列表</h3>
								</div>
								<div class="modal-body">
									<div id="otree" class="ztree"></div>
								</div>
								<div class="modal-footer">
									<a href="#" class="btn" id="oclosed">关闭</a> <a href="#"
										class="btn btn-primary" id="saveoffice">保存</a>
								</div>
							</div>
							<!-- 弹出层 end -->
							<button type="button" id="editoff" class="btn btn-primary">选择培训人员</button>
							<span id="usernamesview">${usernamesview}</span> <input
								type="hidden" name="userids" id="userids" value="${userids}" />
							<input type="hidden" name="usernames" id="usernames"
								value="${usernames}" /> <input type="hidden" name="allids"
								id="allids" value="${allids}" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="isenable">是否启用：</label>
						<div class="controls">
							<label for="login_flag0">&nbsp;&nbsp;是&nbsp;&nbsp; <input
								type="radio" id="login_flag0" value="1" name="train.isenable"
								checked <c:if test="${train.isenable==1}">checked</c:if> />
							</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for="login_flag1">&nbsp;&nbsp;否&nbsp;&nbsp;
								<input type="radio" id="login_flag1" value="0"
								name="train.isenable"
								<c:if test="${train.isenable==0}">checked</c:if> />
							</label>
						</div>
					</div>

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">保存</button>
						<input type="button" value="取消" class="btn"
							onclick="javascript:window.location.href='${basepath}/train/addTrain'">
					</div>

				</fieldset>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var roleid = '';
	var userids = $("#userids").val();
	var settingoffice = {
		check : {
			enable : true,
			chkStyle : "checkbox"
		},
		async : {
			enable : true,
			url : "${basepath}/office/getUserTree",
			autoParam : [ "id", "name" ],
			otherParam : {
				"otherParam" : "zTreeAsyncTest",
				"roleid" : roleid,
				"userids" : userids
			},
			dataFilter : filter
		},
		callback : {
			onClick : zTreeOnClick,
			onAsyncSuccess : onAsyncSuccesso
		}
	};
	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for (var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		var treeObj = $.fn.zTree.getZTreeObj("ztree");
		var nodes = treeObj.getNodesByParam("parentId", 0, null);
		if (nodes.length > 0) {
			treeObj.expandNode(nodes[0], true, false, false);
		}
	}

	function onAsyncSuccesso(event, treeId, treeNode, msg) {
		var treeObj = $.fn.zTree.getZTreeObj("ztree");
		var nodes = treeObj.getNodesByParam("parentId", 0, null);
		if (nodes.length > 0) {
			treeObj.expandNode(nodes[0], true, false, false);
		}
	}
	//机构树单击事件
	function zTreeOnClick(event, treeId, treeNode) {
		if (treeNode.nodetype == 1) {
			treeNodez = treeNode.nodetype;

		} else {
			treeNodez = treeNode.nodetype;

		}
	}
	function getAllCheckedNodeo() {
		var treeObj = $.fn.zTree.getZTreeObj("otree");
		var nodes = treeObj.getCheckedNodes(true);
		var str = "";
		var ids = "";
		var allids = "";
		for (var i = 0; i < nodes.length; i++) {
			allids = ids + nodes[i].id + "|";
			if (nodes[i].type == "1") {
				str = str + nodes[i].name + "|";
				ids = ids + nodes[i].id + "|";
			}
		}
		$("#userids").val(ids);
		$("#allids").val(allids);
		$("#usernamesview").text(str);
		$("#usernames").val(str);
	}
	$(document).ready(function() {
		$.fn.zTree.init($("#otree"), settingoffice);
		$('.datetimepicker').datetimepicker({  
            language:  'zh-CN',
            format: 'yyyy-mm-dd',
            weekStart: 1,  
            todayBtn:  1,  
            autoclose: true,  
            todayHighlight: 1,  
            startView: 2,  
            forceParse: true,  
            minView:2,//只到天
            showMeridian: 1  
        }).on('changeDate', function (ev) {  
            $(this).datetimepicker('hide');  
        });
		$("#editoff").click(function() {
			$('#oModal').modal('show');
		});
		$("#oclosed").click(function() {
			$('#oModal').modal('hide');
		});
		$("#saveoffice").click(function() {
			$("#usernames").val("");
			$("#userids").val("");
			$("#usernamesview").text("");
			getAllCheckedNodeo();
			$('#oModal').modal('hide');
		});
		$("#messagealert").hide();
		var flagcg = '${flagcg}';
		if (flagcg != null && flagcg != '') {
			$("#messagealert").show();
		}
		$("#closebut").click(function() {
			$("#messagealert").hide();
		});
		var jqObj = new JQvalidate();
		var subform = "caseinfoform";
		jqObj.setform(subform);
		jqObj.set("train.trainname", "required", "请输入培训名称!");
		jqObj.set("train.trainstarttime", "required", "请输入培训问题!");
		jqObj.set("train.trainendtime", "required", "请输入培训答案!");
		jqObj.set("train.curriculumId", "required", "请选择科目!");
		jqObj.Run();
	})
</script>
<c:import url="/pages/include/pageFoot.jsp" />