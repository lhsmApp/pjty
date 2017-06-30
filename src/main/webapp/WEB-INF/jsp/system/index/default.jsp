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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<!-- <div class="hr hr-18 dotted hr-double"></div> -->
					<div class="row">
						<div class="col-xs-12">

							<!-- #section:pages/invoice -->
							<div class="widget-box transparent">
								<div class="widget-header widget-header-large">
									<h3 class="widget-title grey lighter">
										<i class="ace-icon fa fa-leaf green"></i>公共模块
									</h3>
								</div>

								<div class="widget-body">
									<div class="widget-main padding-24">
										<div class="row">
											<div class="col-sm-6">
												<div class="row">
													<div
														class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
														<b>信息模块</b>
													</div>
												</div>

												<div>
													<div class="space-12"></div>
													<div class="infobox-container">
														<!-- #section:pages/dashboard.infobox -->
														<div class="infobox infobox-green" style="cursor: pointer"
															onclick="betting()">
															<div class="infobox-icon">
																<i class="ace-icon fa fa-circle"></i>
															</div>

															<div class="infobox-data">
																<span class="infobox-data-number"></span>
																<div class="infobox-content">投注站信息查询</div>
															</div>
														</div>

														<div class="infobox infobox-blue" style="cursor: pointer"
															onclick="stadium()">
															<div class="infobox-icon">
																<i class="ace-icon fa fa-bar-chart-o"></i>
															</div>

															<div class="infobox-data">
																<span class="infobox-data-number"></span>
																<div class="infobox-content">体育场所信息查询 </div>
															</div>
														</div>

														<div class="infobox infobox-pink" style="cursor: pointer"
															onclick="pesoinfo()">
															<div class="infobox-icon">
																<i class="ace-icon fa fa-flag"></i>
															</div>

															<div class="infobox-data">
																<span class="infobox-data-number"></span>
																<div class="infobox-content">协会信息查询 </div>
															</div>
														</div>

														<div class="infobox infobox-red">
															<!-- <div class="infobox-icon">
																<i class="ace-icon fa fa-flask"></i>
															</div> -->

															<div class="infobox-data">
																<span class="infobox-data-number"></span>
																<div class="infobox-content">
																	<a href="http://www.pjtycp.com" target="_blank"
																		style="cursor: pointer; text-align: left;"> <img
																		style="height: 30px; width: 150px;"
																		src="static/images/caipiao.png" />
																	</a>
																</div>
															</div>
														</div>

														<!-- /section:pages/dashboard.infobox -->
														<div class="space-6"></div>
													</div>
												</div>
											</div>
											<!-- /.col -->

											<div class="col-sm-6">
												<div class="row">
													<div
														class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
														<b>组织结构、法律法规</b>
													</div>
												</div>

												<div>
													<div class="space-12"></div>
													<div class="infobox infobox-green infobox-small infobox-dark" style="cursor: pointer"
															onclick="instframe()">
														<div class="infobox-data">
															<div class="infobox-content">组织结构</div>
															<!-- <div class="infobox-content">Completion</div> -->
														</div>
													</div>

													<div
														class="infobox infobox-blue infobox-small infobox-dark" style="cursor: pointer"
															onclick="fhsms()">
														<!-- /section:pages/dashboard.infobox.sparkline -->
														<div class="infobox-data">
															<div class="infobox-content">法律法规</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /.col -->
										</div>
										<!-- /.row -->
										<div class="space-24"></div>
										<div class="hr hr8 hr-double hr-dotted"></div>
									</div>
								</div>
							</div>

							<!-- /section:pages/invoice -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	
		<!-- <div class="footer">
			<div class="footer-inner">
				#section:basics/footer
				<div class="footer-content">
					<span class="bigger-120">
						盘锦市体育局 &copy; 2017-2025
					</span>
				</div>

				/section:basics/footer
			</div>
		</div> -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!--引入属于此页面的js -->
	<!-- <script type="text/javascript" src="static/js/myjs/head.js"></script> -->
	<script type="text/javascript">
		$(top.hangge());

		function betting() {
			top.infoMapQuery('投注站信息查询', 'betting/mapQuery.do', 'z110', '67');
		}

		function stadium() {
			top.infoMapQuery('体育场所信息查询','stadium/mapQuery.do','z113','111');
		}

		function pesoinfo() {
			top.infoMapQuery('协会信息查询','pesoinfo/mapQuery.do','z120','114');
		}

		function instframe() {
			top.instframe();
		}
		
		function fhsms() {
			top.fhsms();
		}
	</script>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>