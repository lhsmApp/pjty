<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="instframe/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INSTFRAME_ID" id="INSTFRAME_ID" value="${pd.INSTFRAME_ID}"/>
						<input type="hidden" name="PARENT_ID" id="PARENT_ID" value="${null == pd.PARENT_ID ? INSTFRAME_ID:pd.PARENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">上级:</td>
								<td>
									<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.NAME ?'(无) 此为顶级':pds.NAME}</b>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组织机构编码:</td>
								<td><input type="text" name="INST_CODE" id="INST_CODE" value="${pd.INST_CODE}" maxlength="4" placeholder="这里输入组织机构编码" title="组织机构编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组织机构名称:</td>
								<td><input type="text" name="INST_NAME" id="INST_NAME" value="${pd.INST_NAME}" maxlength="80" placeholder="这里输入组织机构名称" title="组织机构名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组织机构父编码:</td>
								<td><input type="text" name="INST_FATHER_CODE" id="INST_FATHER_CODE" value="${pd.INST_FATHER_CODE}" maxlength="4" placeholder="这里输入组织机构父编码" title="组织机构父编码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="LEADER_NAME" id="LEADER_NAME" value="${pd.LEADER_NAME}" maxlength="20" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职务:</td>
								<td><input type="text" name="STAFF_JOB" id="STAFF_JOB" value="${pd.STAFF_JOB}" maxlength="80" placeholder="这里输入职务" title="职务" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="MOBILE_TEL" id="MOBILE_TEL" value="${pd.MOBILE_TEL}" maxlength="11" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职能:</td>
								<td><input type="text" name="FUNCTION" id="FUNCTION" value="${pd.FUNCTION}" maxlength="300" placeholder="这里输入职能" title="职能" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="300" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="500" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
				return false;
			}
			if($("#INST_CODE").val()==""){
				$("#INST_CODE").tips({
					side:3,
		            msg:'请输入组织机构编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INST_CODE").focus();
			return false;
			}
			if($("#INST_NAME").val()==""){
				$("#INST_NAME").tips({
					side:3,
		            msg:'请输入组织机构名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INST_NAME").focus();
			return false;
			}
			if($("#INST_FATHER_CODE").val()==""){
				$("#INST_FATHER_CODE").tips({
					side:3,
		            msg:'请输入组织机构父编码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INST_FATHER_CODE").focus();
			return false;
			}
			if($("#LEADER_NAME").val()==""){
				$("#LEADER_NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEADER_NAME").focus();
			return false;
			}
			if($("#STAFF_JOB").val()==""){
				$("#STAFF_JOB").tips({
					side:3,
		            msg:'请输入职务',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STAFF_JOB").focus();
			return false;
			}
			if($("#MOBILE_TEL").val()==""){
				$("#MOBILE_TEL").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOBILE_TEL").focus();
			return false;
			}
			if($("#FUNCTION").val()==""){
				$("#FUNCTION").tips({
					side:3,
		            msg:'请输入职能',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FUNCTION").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>