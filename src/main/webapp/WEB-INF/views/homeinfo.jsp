<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page import="com.multi.glasses.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Glasses Village</title>
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
		.my-button:active {
			outline: none;
		}
		.my-button:focus {
			outline: none;
		}
	</style>
	<link href="resources/dist/css/styles.css" type="text/css" rel="stylesheet" />
	<link href="resources/css/weather-icons.min.css" type="text/css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<% MemberVO logined = (MemberVO)session.getAttribute("member"); %>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<%if(!logined.getHouse_id().equals("admin")){%>
        <a class="navbar-brand" href="<%=request.getContextPath()%>/homeinfo">Glasses Village</a>
        <%} else { %>
        <a class="navbar-brand" href="<%=request.getContextPath()%>/membertable?pagenum=1">Glasses Village</a>
        <%} %>
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
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">마이페이지</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/">로그아웃</a>
                </div>
            </li>
        </ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
                        <%if(!logined.getHouse_id().equals("admin")){%>
                            <a class="nav-link" href="<%=request.getContextPath()%>/homeinfo">
                            	<div class="sb-nav-link-icon">
                            		<i class="fas fa-tachometer-alt"></i>
                            	</div>
                                	메인화면
                            </a>
                            <%} else { %>
                            <a class="nav-link" href="<%=request.getContextPath()%>/membertable?pagenum=1">
                            	<div class="sb-nav-link-icon">
                            		<i class="fas fa-tachometer-alt"></i>
                            	</div>
                                	회원 관리
                            </a>
                            <%} %>
                            <div class="sb-sidenav-menu-heading"></div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                	게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                	<a class="nav-link" href="<%=request.getContextPath()%>/noticeboardlist">공지사항</a>
                                	<a class="nav-link" href="<%=request.getContextPath()%>/freeboardlist">자유게시판 </a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading"></div>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${member.member_id }
                    </div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">${member.house_id } 호</h1>
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
								<div><p id="display" class="display-1 degree">${member.selecttemp }&deg;</p></div>
								<div>
									<div style="height:33px; float: left;"></div>
									<div style="clear:both;">
										<i id="up" class="fas fa-caret-square-up" style="width:30px; height:30px;"></i>
										<i id="down" class="fas fa-caret-square-down" style="width:30px; height:30px;"></i>
									</div>
									<div style="float: left;">
										<input type="button" value="Set" class="my-button" id="mybtn" >
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
								<p class="display-1 degree">${hstatus.temperature }&deg;</p>&nbsp;
								<div class="fa-4x pt-3"><i class="fas fa-thermometer-quarter"></i></div>
							</div>
						</div>
					</div>
					
					<div class="card weather-card" >
						<!-- Card content -->
						<div class="card-body pb-3" style="min-width: 250px">
							<!-- Title -->
							<h4 class="card-title font-weight-bold">역삼 2동</h4>
							<div class="d-flex justify-content-between">
								<p class="display-1 degree">${wstatus.temp }&deg;</p>&nbsp;
								<div id="myicon" class="fa-4x pt-3" style="padding-left: 20px"><i class="wi wi-day-sunny"></i></div>
<!-- 								<div class="fa-4x pt-3" style="padding-left: 20px"><i class="fas fa-snowflake"></i></div> -->
								<!-- <i class="fas fa-sun-o fa-5x pt-3 amber-text"></i> -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">&nbsp;</div>
				<ol class="breadcrumb mb-4" style="padding: 20px 20px">
					<li class="breadcrumb-item active">* 겨울철 실내 권장온도는 18~20도 입니다.</li>
				</ol>
				

				<!-- my -->


				<div class="card mb-4">
					<div class="card-header"><i class="fas fa-table mr-1"></i>&nbsp;공지사항</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                        <th>등록일시</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                        <th>등록일시</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                               		<c:forEach items="${list}" var="vo">
                               		<tr>
                    	          		<td>${vo.board_no}</td>
                                   		<td><a href="<%=request.getContextPath()%>/detailboard?board_no=${vo.board_no}">${vo.title}</a></td>
                                   		<td>${vo.member_id}</td>
                                   		<td>${vo.viewcnt}</td>
                                   		<td>${vo.reg_date}</td>
                                   	</tr>
                                   	</c:forEach>
                                </tbody>
                            </table>
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
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/dist/assets/demo/datatables-demo.js"></script>
	<script>
		
		$().ready(function() {
			// SKY	sky			1 맑음	3 구름많음			4 흐림
			// PRY	rainfall	0 없음	1 비		2 눈/비	3 눈
			
			var rainfall = '${wstatus.rainfall}'
			var sky = '${wstatus.sky}'
			
			if ( sky = '1' ) {
				if ( rainfall = '0' ) {
					$("#myicon").html("<i class=\"wi wi-day-sunny\"></i>");
				} else if ( rainfall = '1' ) {
					$("#myicon").html("<i class=\"wi wi-day-rain\"></i>");
				} else if ( rainfall = '2' ) {
					$("#myicon").html("<i class=\"wi wi-day-rain\"></i>");
				} else if ( rainfall = '3' ) {
					$("#myicon").html("<i class=\"wi wi-day-snow\"></i>");
				}
			} else if ( sky = '3' ) {
				if ( rainfall = '0' ) {
					$("#myicon").html("<i class=\"wi wi-day-cloudy\"></i>");
				} else if ( rainfall = '1' ) {
					$("#myicon").html("<i class=\"wi wi-rain\"></i>");
				} else if ( rainfall = '2' ) {
					$("#myicon").html("<i class=\"wi wi-rain\"></i>");
				} else if ( rainfall = '3' ) {
					$("#myicon").html("<i class=\"wi wi-snow\"></i>");
				}
			} else if ( sky = '4' ) {
				if ( rainfall = '0' ) {
					$("#myicon").html("<i class=\"wi wi-day-cloudy\"></i>");
				} else if ( rainfall = '1' ) {
					$("#myicon").html("<i class=\"wi wi-rain\"></i>");
				} else if ( rainfall = '2' ) {
					$("#myicon").html("<i class=\"wi wi-rain\"></i>");
				} else if ( rainfall = '3' ) {
					$("#myicon").html("<i class=\"wi wi-snow\"></i>");
				}
			}
			
			$("#up").click(function(){
				var num = $("#display").html();
				num = num.substring(0, 2);
				$("#display").html(++num + "&deg;");
			});
	
			$("#down").click(function(){
				var num = $("#display").html();
				num = num.substring(0, 2);
				$("#display").html(--num + "&deg;");
			});
			
			$("#mybtn").click(function() {
				//alert($("#display").html().substring(0,2));
				//alert(typeof $("#display").html().substring(0,2));
				var data = {'selecttemp':$("#display").html().substring(0,2)}
				$.ajax({
					type: 'POST',
					url: '/glasses/temperature',
					data: data,
					success: function (data) {
						alert(data);
						//if(data == "success")
							//alert("설정이 변경되었습니다.");
					}
				});
			});
			
		});
		
	</script>
</body>
</html>