<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>

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

							<!-- 表单  -->
							<form action="policyCustom/listCustom.do" method="post"
								name="Form" id="Form">

								<!-- 表单  -->

								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>政策法规
									</h5>


								</div>

								<table class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th class="center">标题</th>
											<th class="center">发布时间</th>
										</tr>
									</thead>
									<tbody>

										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty varList}">
												<%-- <c:if test="${QX.cha == 1 }"> --%>
													<c:forEach items="${varList}" var="var" varStatus="vs">
														<tr>

															<td class='center'><a style="cursor: pointer;"
																onclick="viewContent('${var.ID}')">${var.TITLE}</a></td>
															<td class='center'>${var.PUB_DATE}</td>

														</tr>

													</c:forEach>
												<%-- </c:if>
												<c:if test="${QX.cha == 0 }"> 
													<tr>
														<td colspan="100" class="center">您无权查看</td>
													</tr>
												 </c:if> --%>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center">没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>


								<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>

											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		

		
		//查看详情
		function viewContent(Id){
			console.log(Id+"h哈哈");
			self.location.href="<%=basePath%>/policy/content.do?ID=" + Id+ "&tm=" + new Date().getTime();
		}
	</script>


</body>
</html>