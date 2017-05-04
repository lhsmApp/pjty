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
<%@ include file="../system/index/top.jsp"%>

<!-- <link rel="stylesheet" href="app/css/app.css">
    <link rel="stylesheet" href="app/css/customer.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.css"> -->

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
	width: 280px;
	height: 94%;
	position: absolute;
	left: 20px;
	top: 3%;
	bottom: 3%;
	z-index: 100;
	/*opacity: 0.9;*/
}

.left-nav .top {
	height: 40%;
}

.left-nav .top .header-top {
	padding: 0px 15px 0px 15px;
}

.left-nav .bottom {
	height: 60%;
}

.left-nav .header {
	height: 70px;
	padding: 20px 10px 15px 15px;
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
		<div class="top">
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
		<hr />
		<div class="bottom">
			<div class="bottom-form">
				<form role="form" ng-submit="login.login()" name="login.loginForm"
					novalidate="" class="form-validate mb-lg">
					<div class="form-group has-feedback">
						<input type="text" name="account_email" placeholder="输入项目名称"
							autocomplete="off" ng-model="login.account.email" required=""
							class="form-control" />
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="account_password" placeholder="客户名称"
							ng-model="login.account.password" required=""
							class="form-control" />
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="account_password" placeholder="公司名称"
							ng-model="login.account.password" required=""
							class="form-control" />
					</div>
					<div class="form-inline">
						<select name="account" class="form-control" style="width: 80px;">
							<option>销售组织</option>
							<option>Option 2</option>
							<option>Option 3</option>
							<option>Option 4</option>
						</select> <select name="account" class="form-control" style="width: 80px;">
							<option>分销渠道</option>
							<option>Option 2</option>
							<option>Option 3</option>
							<option>Option 4</option>
						</select> <select name="account" class="form-control" style="width: 80px;">
							<option>销售办公室</option>
							<option>Option 2</option>
							<option>Option 3</option>
							<option>Option 4</option>
						</select>
					</div>
					<button type="submit" class="btn btn-block btn-danger btn-sm">搜
						索</button>
				</form>
			</div>
		</div>
	</div>
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
</body>
<script type="text/javascript">
	$(top.hangge());
	var flag = 0;
	// 定义自定义覆盖物的构造函数
	function SquareOverlay(center, length, color, city, project1, project2,
			level) {
		//this._squareOverlay=squareOverlay;
		this._center = center;
		this._length = length;
		this._color = color;
		this._city = city;
		this._project1 = project1;
		this._project2 = project2;
		this._level = level;
	}
	// 继承API的BMap.Overlay
	SquareOverlay.prototype = new BMap.Overlay();

	// 实现初始化方法
	SquareOverlay.prototype.initialize = function(map) {
		// 保存map对象实例
		var so = this;
		this._map = map;
		// 创建div元素，作为自定义覆盖物的容器
		var div = document.createElement("div");
		div.style.position = "absolute";
		// 可以根据参数设置元素外观
		div.style.width = this._length + "px";
		div.style.height = this._length + "px";
		div.style.borderRadius = "50%";
		div.style.opacity = "0.8";
		div.style.background = this._color;
		div.style.textAlign = "center";
		div.style.padding = "0px 0px 2px 2px";

		/*var h4=document.createElement("h4");
		 h4.innerHTML =this._city;
		 console.log(h4.text);*/
		//div.appendChild(h4);
		div.innerHTML = "<span style='color: #ffffff;text-align: center;display: block;font-size: 14px;font-weight:bold;padding-bottom: 2px;margin-top: 10px;'>"
				+ this._city
				+ "</span>"
				+ "<span style='color: #ffffff;text-align: left;display: block;font-size: 10px;padding-left: 8px;padding-bottom: 2px;'>"
				+ this._project1
				+ "</span>"
				+ "<span style='color: #ffffff;text-align: left;display: block;font-size: 10px;padding-left: 8px;'>"
				+ this._project2 + "</span>";
		div.addEventListener("dblclick", function(e) {
			if (so._level >= 2) {
				window.location.href = "index.html";
				//window.location.href("index.html");
				return;
			}
			console.log(so._level);
			//map.setCenter(e.point);
			map.setCenter(so._city);
			map.setZoom(8);
			//so.hide();
			map.removeOverlay(so);
			flag = 1;
			console.log("dbc");
			console.log(so._city);
			if (so._city == "甘肃省") {
				// 添加自定义覆盖物
				var point1 = new BMap.Point(103.751, 36.068);
				var mySquare1 = new SquareOverlay(point1, 90, "#1e983b", "兰州",
						"进行项目：10", "跟踪项目：3", 2);
				map.addOverlay(mySquare1);

				var point2 = new BMap.Point(104.614, 35.674);
				var mySquare2 = new SquareOverlay(point2, 90, "#1e983b", "定西",
						"进行项目：15", "跟踪项目：11", 2);
				map.addOverlay(mySquare2);
			} else if (so._city == "云南省") {
				// 添加自定义覆盖物
				var point1 = new BMap.Point(102.702, 25.051);
				var mySquare1 = new SquareOverlay(point1, 90, "#1e983b", "昆明",
						"进行项目：10", "跟踪项目：3", 2);
				map.addOverlay(mySquare1);

				var point2 = new BMap.Point(99.315, 25.924);
				var mySquare2 = new SquareOverlay(point2, 90, "#1e983b", "大理",
						"进行项目：15", "跟踪项目：11", 2);
				map.addOverlay(mySquare2);
			}
		});

		// 将div添加到覆盖物容器中
		map.getPanes().markerPane.appendChild(div);
		// 保存div实例
		this._div = div;
		// 需要将div元素作为方法的返回值，当调用该覆盖物的show、
		// hide方法，或者对覆盖物进行移除时，API都将操作此元素。
		return div;
	}

	// 实现绘制方法
	SquareOverlay.prototype.draw = function() {
		// 根据地理坐标转换为像素坐标，并设置给容器
		var position = this._map.pointToOverlayPixel(this._center);
		this._div.style.left = position.x - this._length / 2 + "px";
		this._div.style.top = position.y - this._length / 2 + "px";
	}

	// 实现显示方法
	SquareOverlay.prototype.show = function() {
		if (this._div) {
			this._div.style.display = "";
		}
	}
	// 实现隐藏方法
	SquareOverlay.prototype.hide = function() {
		if (this._div) {
			this._div.style.display = "none";
		}
	}

	// 添加自定义方法
	SquareOverlay.prototype.toggle = function() {
		if (this._div) {
			if (this._div.style.display == "") {
				this.hide();
			} else {
				this.show();
			}
		}
	}

	/* 108.969 34.285 陕西
	 103.751,36.068 兰州
	 118.769,32.048 江苏
	 113.265,23.108 广东
	 102.702,25.051 云南
	 121.445,31.213 上海
	 126.645,45.758 黑龙江*/
	// 初始化地图
	var map = new BMap.Map("allmap", {
		enableMapClick : false,
		minZoom : 5,
		maxZoom : 8
	});
	var point = new BMap.Point(103.751, 36.068);
	map.centerAndZoom(point, 6);
	//map.centerAndZoom("北京",7);      // 初始化地图,用城市名设置地图中心点
	//console.log(map.getCenter());
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放*/
	map.disableDoubleClickZoom();//禁用双击放大。

	// 百度地图API功能
	var top_left_control = new BMap.ScaleControl({
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT
	});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT
	}); //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_RIGHT,
		type : BMAP_NAVIGATION_CONTROL_SMALL
	}); //右上角，仅包含平移和缩放按钮
	/*缩放控件type有四种类型:
	 BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/

	//添加控件和比例尺
	function add_control() {
		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		//map.addControl(top_right_navigation);
	}
	add_control();
	//移除控件和比例尺
	function delete_control() {
		map.removeControl(top_left_control);
		map.removeControl(top_left_navigation);
		map.removeControl(top_right_navigation);
	}

	//定位
	var myGeo = new BMap.Geocoder();
	map.addEventListener("zoomend", function() {
		//flag=0;
		/*if(this.getZoom()<6){
		 return;
		 }*/
		console.log(this.getZoom());
		if (this.getZoom() < 8) {
			map.clearOverlays();
			addSo();
		} else if (this.getZoom() >= 8) {
			console.log(flag);
			if (flag == 1) {
				flag = 0;
				return;
			}

			//展示中心点所在省份下的所有市
			myGeo.getLocation(map.getCenter(), function(result) {
				//alert(result.addressComponents.province + "," + result.addressComponents.city);
				var province = result.addressComponents.province;
				console.log(province);
				if (province == "甘肃省") {
					var point1 = new BMap.Point(103.751, 36.068);
					var mySquare1 = new SquareOverlay(point1, 90, "#1e983b",
							"兰州", "进行项目：10", "跟踪项目：3", 2);
					map.addOverlay(mySquare1);

					var point2 = new BMap.Point(104.614, 35.674);
					var mySquare2 = new SquareOverlay(point2, 90, "#1e983b",
							"定西", "进行项目：15", "跟踪项目：11", 2);
					map.addOverlay(mySquare2);
				} else if (province == "云南省") {
					// 添加自定义覆盖物
					var point1 = new BMap.Point(102.702, 25.051);
					var mySquare1 = new SquareOverlay(point1, 90, "#1e983b",
							"昆明", "进行项目：10", "跟踪项目：3", 2);
					map.addOverlay(mySquare1);

					var point2 = new BMap.Point(99.315, 25.924);
					var mySquare2 = new SquareOverlay(point2, 90, "#1e983b",
							"大理", "进行项目：15", "跟踪项目：11", 2);
					map.addOverlay(mySquare2);
				}
			});

			//var centerCity=this.getz

		}
		//alert("地图缩放至：" + this.getZoom() + "级");
	});

	var addSo = function() {
		// 添加自定义覆盖物
		var point0 = new BMap.Point(103.751, 36.068);
		var mySquare = new SquareOverlay(point0, 90, "rgb(25,189,198)", "甘肃省",
				"进行项目：10", "跟踪项目：3", 1);
		map.addOverlay(mySquare);

		var point1 = new BMap.Point(116.404, 39.915);
		var mySquare1 = new SquareOverlay(point1, 90, "rgb(25,189,198)", "北京",
				"进行项目：15", "跟踪项目：11", 1);
		map.addOverlay(mySquare1);

		var point2 = new BMap.Point(118.769, 32.048);
		var mySquare2 = new SquareOverlay(point2, 90, "rgb(25,189,198)", "江苏省",
				"进行项目：25", "跟踪项目：17", 1);
		map.addOverlay(mySquare2);

		var point3 = new BMap.Point(113.265, 23.108);
		var mySquare3 = new SquareOverlay(point3, 90, "rgb(25,189,198)", "广东省",
				"进行项目：25", "跟踪项目：17", 1);
		map.addOverlay(mySquare2);

		var point4 = new BMap.Point(102.702, 25.051);
		var mySquare4 = new SquareOverlay(point4, 90, "rgb(25,189,198)", "云南省",
				"进行项目：25", "跟踪项目：17", 1);
		map.addOverlay(mySquare4);

		var point5 = new BMap.Point(121.445, 31.213);
		var mySquare5 = new SquareOverlay(point5, 90, "rgb(25,189,198)", "上海",
				"进行项目：25", "跟踪项目：17", 1);
		map.addOverlay(mySquare5);

		var point6 = new BMap.Point(126.645, 45.758);
		var mySquare6 = new SquareOverlay(point6, 90, "rgb(25,189,198)",
				"黑龙江省", "进行项目：25", "跟踪项目：17", 1);
		map.addOverlay(mySquare6);
	}
	addSo();

	//获取省份区域
	function getBoundary() {
		var bdary = new BMap.Boundary();
		var name = "甘肃省";
		bdary.get(name, function(rs) { //获取行政区域
			//map.clearOverlays();        //清除地图覆盖物
			var count = rs.boundaries.length; //行政区域的点有多少个
			for (var i = 0; i < count; i++) {
				var ply = new BMap.Polygon(rs.boundaries[i], {
					strokeWeight : 2,
					strokeColor : "#ff0000"
				}); //建立多边形覆盖物
				map.addOverlay(ply); //添加覆盖物
				map.setViewport(ply.getPath()); //调整视野
			}
		});
	}
	//getBoundary();
</script>
</html>


