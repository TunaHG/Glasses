<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Dashboard - SB Admin</title>
	<style type="text/css">
		.my-button {
			background-color: #212529;
			border: none;
			color: #F9EED1;
			width: 61px;
			height: 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border-radius: 2px;
			margin-left: 2px;
			font: bold 18px #F9EED1;
		}
	</style>
	<link href="resources/dist/css/styles.css" type="text/css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!--
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.html">Spring Project</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
                <div class="input-group">
                    
                </div>
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">마이페이지</a>
                        <a class="dropdown-item" href="login.html">로그아웃</a>
                    </div>
                </li>
            </ul>
        </nav>
        -->


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/">Glasses
			Premium</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2" hidden="" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" hidden="">
						<i class="fas fa-search" hidden=""></i>
					</button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a><a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/logout">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html"><div
								class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a><a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages"><div
								class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-toggle="collapse"
									data-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth">Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a><a
											class="nav-link" href="register.html">Register</a><a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-toggle="collapse"
									data-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError">Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a><a
											class="nav-link" href="404.html">404 Page</a><a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts</a><a class="nav-link" href="tables.html"><div
								class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Copyright &copy;</div>
					Glasses Premium 2020
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">201호?</h1>
				&nbsp;&nbsp;
				<!-- my -->
				<div class="row">
					&nbsp;&nbsp;
					<div class="card weather-card" style="background-color: #F9EED1">
						<!-- Card content -->
						<div class="card-body pb-3" style="width: 250px">
							<!-- Title -->
							<h4 class="card-title font-weight-bold">희망온도</h4>
							<div class="d-flex justify-content-between">
								<div><p class="display-1 degree">22&deg;</p></div>
								<div>
									<div style="height:30px; float: left;"></div>
									<div style="clear:both;">
										<i class="fas fa-caret-square-up" style="width:30px; height:30px;"></i>
										<i class="fas fa-caret-square-down" style="width:30px; height:30px;"></i>
									</div>
									<div style="float: left;">
										<input type="button" value="Auto" class="my-button" >
									</div>
								</div>
							</div>
						</div>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="card weather-card" >
						<!-- Card content -->
						<div class="card-body pb-3" style="width: 250px">
							<!-- Title -->
							<h4 class="card-title font-weight-bold" >현재 실내온도</h4>
							<div class="d-flex justify-content-between">
								<p class="display-1 degree">21&deg;</p>&nbsp;&nbsp;
								<i class="fas fa-thermometer-quarter fa-5x pt-3 amber-text"></i>
							</div>
						</div>
					</div>
					
					<div class="card weather-card" >
						<!-- Card content -->
						<div class="card-body pb-3">
							<!-- Title -->
							<h4 class="card-title font-weight-bold">역삼 2동</h4>
							<div class="d-flex justify-content-between">
								<p class="display-1 degree">-4.5&deg;</p>&nbsp;
								<i class="fas fa-snowflake fa-5x pt-3 amber-text"></i>
								<!-- <i class="fas fa-sun-o fa-5x pt-3 amber-text"></i> -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="row"> &nbsp;</div>
				
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">*겨울철 실내 권장온도는 18~20도 입니다.</li>
				</ol>

				<!-- my -->


				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-primary text-white mb-4">
							<div class="card-body">Primary Card</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">View
									Details</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4">
							<div class="card-body">Warning Card</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">View
									Details</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4">
							<div class="card-body">Success Card</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">View
									Details</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4">
							<div class="card-body">Danger Card</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">View
									Details</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/dist/js/scripts.js"></script>
	<script src="resources/dist/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/dist/assets/demo/chart-area-demo.js"></script>
	<script src="resources/dist/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/dist/assets/demo/datatables-demo.js"></script>
</body>
</html>