<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Page Title - SB Admin</title>
        <link href="resources/dist/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-login">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회 원 가 입</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
	                                                    <label class="small mb-1" for="inputID">아이디</label>
	                                                    <input class="form-control py-4" id="inputFirstName" type="text" placeholder="아이디" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                    	<label class="small mb-1" for="inputLastName"> <span>&nbsp;</span> </label>
                                                    	<span class="form-control-hidden py-4" id="inputLastName" > <span>&nbsp;</span> </span>
                                                    	<!-- <input class="form-control py-4" id="inputLastName" type="text" /> -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input class="form-control py-4" id="inputPassword" type="password" placeholder="비밀번호" /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label><input class="form-control py-4" id="inputConfirmPassword" type="password" placeholder="비밀번호 확인" /></div>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">이 름</label><input class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="이름" /></div>
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">전화번호</label><input class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="전화번호" /></div>
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">호</label><input class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="호" /></div>
                                            <div class="form-group mt-4 mb-0"><a class="btn btn-gray btn-block" href="login.html">회원가입</a></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <a href="register.html" class="badge-light"><div class="small">아이디가 있으신가요? <span>&nbsp;</span> 로그인</div></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div>
                                <!-- <a href="#" class="badge-light">Privacy Policy</a>
                                &middot;
                                <a href="#" class="badge-light">Terms &amp; Conditions</a> -->
                            </div>
                            <div class="text-muted">Copyright &copy; Glasses Village 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/dist/js/scripts.js"></script>
    </body>
</html>
