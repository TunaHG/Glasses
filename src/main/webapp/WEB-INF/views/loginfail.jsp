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
        <title>Login</title>
        <link href="resources/dist/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-login">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Glasses Village</h3></div>
                                    <div class="card-body">
                                        <form action="/glasses/login" method="post">
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">아이디</label><input class="form-control py-4" id="inputID" type="text" name="member_id" value="${member.member_id}"/></div>
                                            <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input class="form-control py-4" id="inputPassword" type="password" name="password" placeholder="비밀번호" /></div>
                                            <!-- 
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox"><input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" /><label class="custom-control-label" for="rememberPasswordCheck">Remember password</label></div>
                                            </div>
                                             -->
                                            <div class="form-group" style="color: red">
                                               <!-- <div class="custom-control custom-checkbox"><input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" /><label class="custom-control-label" for="rememberPasswordCheck">Remember password</label></div> -->
                                               <label class="small mb-2" for="inputErrorMessege">가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.</label>
                                            </div>
                                            <!-- <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href="password.html">Forgot Password?</a><a class="btn btn-primary" href="index.html">Login</a></div> -->
                                            <!-- <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href="password.html"> </a><a class="btn btn-gray" href="index.html">로그인</a></div> -->
                                            <div class="form-group mt-4 mb-0"><input type="submit" class="btn btn-gray btn-block" value="로그인"></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <a href="register." class="badge-light"><div class="small">아이디가 없으신가요? <span>&nbsp;</span> 회원가입</div></a>
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
