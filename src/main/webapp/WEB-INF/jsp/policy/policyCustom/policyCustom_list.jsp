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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">


	<table style="width: 100%;" border="0">
		<tr>
			<td style="width: 25%;" valign="top" bgcolor="blue">

				<div class="col-sm-6" style="width: 300px">

					<div class="widget-box widget-color-green2">
						<div class="widget-header">
							<h6 class="widget-title lighter smaller">政策分类</h6>
							<div class="row">
								<div class="col-xs-12">
									<!-- PAGE CONTENT BEGINS -->
									<div class="row">
										<div class="col-sm-12"> 
											<div class="dd" id="nestable">
												<ol class="dd-list">
													<li class="dd-item" data-id="1">
														<c:choose>
															<c:when test="${not empty policyTypeList}">
																<c:forEach items="${policyTypeList}" var="policyType" varStatus="vs">
																	<div class="dd-handle" onclick="policyDetail('${policyType.POLI_TYPE}')">${policyType.POLI_TYPE}</div>
																</c:forEach>
															</c:when>
														</c:choose>
													</li>
												</ol>
											</div>
										</div>
									</div>
								</div>
							</div>

					
						</div>
					</div>
			</td>
			<td style="width: 75%;" valign="top">


				<div class="col-xs-12 col-sm-12 widget-container-col">
					<div class="widget-box widget-color-blue">
						<!-- #section:custom/widget-box.options -->
						<div class="widget-header">
							<h5 class="widget-title bigger lighter">政策法规</h5>


						</div>

						<!-- /section:custom/widget-box.options -->
						<div class="widget-body">
							<div class="widget-main no-padding">
								<table class="table table-striped table-bordered table-hover">

									<tbody>

										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty policyTitleList}">
												<c:if test="${QX.cha == 1 }">
													<c:forEach items="${policyTitleList}" var="var" varStatus="vs">
														<tr>

															<td class='center'><a
																href="static/html_UI/html/policy.html" target="_blank">${var.TITLE}</a></td>
															<td class='center'>${var.PUB_DATE}</td>

														</tr>

													</c:forEach>
												</c:if>
												<c:if test="${QX.cha == 0 }">
													<tr>
														<td colspan="100" class="center">您无权查看</td>
													</tr>
												</c:if>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center">没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div> <!-- /.span -->
				</div> <!-- /.row --> <!-- /section:basics/navbar.layout -->
				<div class="main-container" id="main-container">
					<!-- /section:basics/sidebar -->
					<div class="main-content">
						<div class="main-content-inner">
							<div class="page-content">
								<div class="row">
									<div class="col-xs-12">



										<table id="simple-table"
											class="table table-striped table-bordered table-hover"
											style="margin-top: 5px;">



										</table>
										<div class="page-header position-relative">
											<table style="width: 100%;">
												<tr>

													<td style="vertical-align: top;"><div
															class="pagination"
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

				</div> <!-- /.main-container -->
			</td>
		</tr>
	</table>




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
	
		console.log("${policyTypeList}");
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>policy/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>policy/delete.do?POLICY_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//根据分类确定政策
		function policyDetail(str) {
			/* top.jzts(); */
			$.ajax({
				type: "POST",
				url: '<%=basePath%>policyCustom/policyTitlelistPage.do',
		    	data: {POLI_TYPE:str}, 
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					console.log("fdsfsf"); 
					
					console.log(data); 
					 $.each(data.list, function(i, list){
						 
					 console.log(list.list[i].TITLE);
						 console.log(i); 
						 
					 
					 
						/* 	nextPage(${page.currentPage}); */
					 }); 
				}
			}); 
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>policy/goEdit.do?POLICY_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>policy/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>policy/excel.do';
		}
	</script>


</body>
</html>