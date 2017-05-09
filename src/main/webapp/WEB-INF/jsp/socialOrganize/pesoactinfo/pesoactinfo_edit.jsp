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
					
					<form action="pesoactinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PESOACTINFO_ID" id="PESOACTINFO_ID" value="${pd.PESOACTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">社会组织名称:</td>
								<td><input type="text" name="PESO_NAME" id="PESO_NAME" value="${pd.PESO_NAME}" maxlength="300" placeholder="这里输入社会组织名称" title="社会组织名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动名称:</td>
								<td><input type="text" name="ACT_NAME" id="ACT_NAME" value="${pd.ACT_NAME}" maxlength="300" placeholder="这里输入活动名称" title="活动名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">资金落实情况:</td>
								<td><input type="number" name="CAPI_SITU" id="CAPI_SITU" value="${pd.CAPI_SITU}" maxlength="32" placeholder="这里输入资金落实情况" title="资金落实情况" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">成效评价:</td>
								<td><input type="text" name="EFFECT" id="EFFECT" value="${pd.EFFECT}" maxlength="300" placeholder="这里输入成效评价" title="成效评价" style="width:98%;"/></td>
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
			if($("#PESO_NAME").val()==""){
				$("#PESO_NAME").tips({
					side:3,
		            msg:'请输入社会组织名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PESO_NAME").focus();
			return false;
			}
			if($("#ACT_NAME").val()==""){
				$("#ACT_NAME").tips({
					side:3,
		            msg:'请输入活动名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACT_NAME").focus();
			return false;
			}
			if($("#CAPI_SITU").val()==""){
				$("#CAPI_SITU").tips({
					side:3,
		            msg:'请输入资金落实情况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CAPI_SITU").focus();
			return false;
			}
			if($("#EFFECT").val()==""){
				$("#EFFECT").tips({
					side:3,
		            msg:'请输入成效评价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFECT").focus();
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