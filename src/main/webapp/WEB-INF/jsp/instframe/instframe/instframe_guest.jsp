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
	<style>
		/* html { overflow-y:hidden; } */
	</style>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">

<title>组织机构浏览</title>

<link rel="stylesheet" href="static/css/style.css" media="screen"
	type="text/css" />

<script src="static/js/modernizr.js"></script>
</head>

<body>

	<div class="content">
		<!-- <h1>Responsive Organization Chart (updated)</h1> -->

		<figure class="org-chart cf">
			<div class="board ">
				<!-- <ul class="columnThree">
		            <li>
		               <span>
		               <strong>Position Name</strong>
		               <br>Name Surname
		               <br>AA
		               </span> 
		            </li>
		            <li>
		               <span  >
		               <strong>Position Name</strong>
		               <br>Name Surname
		               <br>AA
		               </span> 
		            </li>
		            <li>
		               <span  >
		               <strong>Position Name</strong>
		               <br>Name Surname
		               <br>AA
		               </span> 
		            </li>
		         </ul>-->
				<ul class="columnOne">
					<li><span class="lvl-b"> <strong>工会主席</strong> <br>说明
							<br>AA
					</span></li>
				</ul>
				<ul class="columnOne">
					<li><span class="lvl-b"> <strong>王安辉</strong> <br>说明
							<br>AA
					</span></li>
				</ul>
				<ul class="columnTwo">
					<li><span> <strong>组织、生活、文体委员</strong> <br>说明<br>AA
					</span></li>
					<li><span> <strong>财经、女工委会</strong> <br>说明<br>AA
					</span></li>
				</ul>
				<ul class="columnTwo columnTwo1">
					<li><span> <strong>孙传杰</strong> <br>说明<br>AA
					</span></li>
					<li><span> <strong>吴月</strong> <br>说明<br>AA
					</span></li>
				</ul>
			</div>
			<ul class="departments ">
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
					</ul></li>
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
					</ul></li>
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
					</ul></li>
				<li class="department central"><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
					</ul></li>
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
					</ul></li>
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>CC
						</span></li>
					</ul></li>
				<li class="department "><span class="lvl-b"> <strong>Position
							Name</strong> <br>Name Surname <br>AB
				</span>
					<ul class="sections">
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>AA
						</span></li>
						<li class="section"><span> <strong>Position
									Name</strong> <br>Name Surname <br>BB
						</span></li>
					</ul></li>
			</ul>
		</figure>
	</div>
	<script src="static/ace/js/jquery.js"></script>
	<script>
		$(top.hangge());
		
		
	</script>
</body>

</html>