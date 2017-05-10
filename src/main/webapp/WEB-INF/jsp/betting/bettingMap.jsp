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
<%@ include file="../system/index/top.jsp"%>

<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}

.left-nav {
	background-color: #ffffff;
	width: 250px;
	height: 92%;
	position: absolute;
	left: 20px;
	top: 3%;
	bottom: 3%;
	z-index: 100;
	/*opacity: 0.9;*/
}

.left-nav .top {
	
}

.left-nav .top .header-top {
	padding: 0px 15px 0px 15px;
}

.left-nav .bottom {
	height: 100%;
}

.left-nav .header {
	height: 70px;
	padding: 0px 10px 15px 15px;
}

.left-nav hr {
	border: 4px solid rgb(225, 224, 222);
	margin-top: 15px;
	margin-bottom: 0px;
}

.left-nav .header hr {
	border: 1.5px solid rgb(146, 146, 146);
	margin-top: 15px;
}

.left-nav .header img {
	height: 20px;
}

.left-nav .bottom {
	padding: 20px 10px 15px 15px;
}

.left-nav .has-feedback {
	margin-bottom: 8px;
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=CNIU569ktnYiEkGikBLGlgScEaopEgng"></script>
</head>
<body class="no-skin">
	<div id="allmap"></div>

	<div class="left-nav">
		<!-- <div class="top"> 
			<div class="header">
				<img src="static/images/东方雨虹-图.png" style="margin-right: 5px" /><img
					src="static/images/东方雨虹-字.png" />
				<hr />
			</div>
			<div class="header-top">
				<nav>
					<ul class="nav-stacked">
						统计报表
						<li role="presentation" class="active"><a href="#">进度报表查看</a></li>
						<li role="presentation"><a href="#">质量统计报表查看</a></li>
						<li role="presentation"><a href="#">质量统计报表修改</a></li>
						<li role="presentation"><a href="#">出勤统计报表查看</a></li>
					</ul>
				</nav>

			</div>
		</div>
		<hr />-->

		<div class="top">
			<div class="header">
				<img src="static/images/东方雨虹-图.png" style="margin-right: 5px" /><img
					src="static/images/东方雨虹-字.png" />
				<hr />
			</div>
		</div>
		<div class="bottom">
			<div class="bottom-form">
				<form action="betting/list.do" method="post" name="Form" id="Form">
					<div id="detail" style="margin-bottom:20px;">
						<p class="text-info">
							<strong>营业执照注册号：ZC001</strong>
						</p>
						<p>
							<span class="muted">所属区域：</span><span class="text-info">兴隆台区</span>
						</p>
						<p>
							<span class="muted">投注站地址：</span><span class="text-info">石油大街</span>
						</p>
						<p>
							<abbr title="Phone" class="muted">手机号：</abbr><span
								class="text-info">13999999999</span>
						</p>
						<p>
							<span class="muted">简介：</span><span class="text-info">石油大街3平方米</span>
						</p>
					</div>
					<div class="form-inline has-feedback">
						<select class="chosen-select form-control" name="BELONG_AREA"
							id="belong_area" data-placeholder="请选择所属区域"
							style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${areaList}" var="area">
								<option value="${area.AREA_ID }"
									<c:if test="${pd.BELONG_AREA==area.AREA_ID}">selected</c:if>>${area.AREA_NAME }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-inline has-feedback">
						<select class="chosen-select form-control" name="BELONG_AREA"
							id="belong_area" data-placeholder="请选择投注站"
							style="vertical-align: top; width: 120px;">
							<option value=""></option>
							<option value="">全部</option>
							<c:forEach items="${areaList}" var="area">
								<option value="${area.AREA_ID }"
									<c:if test="${pd.BELONG_AREA==area.AREA_ID}">selected</c:if>>${area.AREA_NAME }</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group has-feedback">
						<span class="input-group-addon"> <i
							class="ace-icon fa fa-check"></i>
						</span> <input id="suggestId" type="text" value=""
							class="form-control search-query" placeholder="这里输入搜索地址" /> <span
							class="input-group-btn">
						</span>
					</div>
					<button type="submit"
						class="btn btn-block btn-danger btn-sm has-feedback" onclick="search()">搜索</button>
				</form>
			</div>
		</div>
	</div>
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		
		/**
		 * 控件及数据初始化
		 */
		$(function() {
			//下拉框
			if (!ace.vars['touch']) {
				$('.chosen-select').chosen({
					allow_single_deselect : true
				});
				$(window).off('resize.chosen').on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						var $this = $(this);
						$this.next().css({
							'width' : $this.parent().width()
						});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen',
						function(e, event_name, event_val) {
							if (event_name != 'sidebar_collapsed')
								return;
							$('.chosen-select').each(function() {
								var $this = $(this);
								$this.next().css({
									'width' : $this.parent().width()
								});
							});
						});
				$('#chosen-multiple-style .btn').on(
						'click',
						function(e) {
							var target = $(this).find('input[type=radio]');
							var which = parseInt(target.val());
							if (which == 2)
								$('#form-field-select-4').addClass(
										'tag-input-style');
							else
								$('#form-field-select-4').removeClass(
										'tag-input-style');
						});
			}
		});
		
		var map = new BMap.Map("allmap");
		map.centerAndZoom("盘锦", 12); // 初始化地图,设置城市和地图级别。

		//map.addControl(new BMap.ScaleControl()); // 添加默认比例尺控件
		map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT}));
		//map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
		map.addControl(new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT}));  //右上角，仅包含平移和缩放按钮

		map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用

		/* var ac = new BMap.Autocomplete( //建立一个自动完成的对象
		{
			"input" : "suggestId",
			"location" : map
		});

		ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
			var _value = e.item.value;
			myValue = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
			setPlace(myValue);
		});
		//map.addEventListener("click", showInfo);
		$("#suggestId").keydown(function(event) {
			if (event.keyCode == 13) {
				var addr = $("#suggestId").val();
				if (addr != null && addr != "")
					setPlace(addr);
			}
		}); */

		
		/**
		 * 根据地址定位地图坐标
		 */
		function setPlace(myValue) {
			map.clearOverlays(); //清除地图上所有覆盖物
			function myFun() {
				var point0 = local.getResults().getPoi(0);
				if (point0 != null) {
					var pp = point0.point; //获取第一个智能搜索的结果
					map.centerAndZoom(pp, 18);
					map.addOverlay(new BMap.Marker(pp)); //添加标注
					document.getElementById("ZUOBIAO_X").value = pp.lat;
					document.getElementById("ZUOBIAO_Y").value = pp.lng;
				}
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
				onSearchComplete : myFun
			});
			local.search(myValue);
		}

		/**
		 * 根据指定搜索条件定位地图坐标
		 */
		function search() {
			var addr = $("#suggestId").val();
			if (addr != null && addr != "")
				setPlace(addr);
		}
	</script>
</body>

</html>


