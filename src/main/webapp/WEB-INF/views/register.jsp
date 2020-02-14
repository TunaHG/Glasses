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
        <title>Glasses Village</title>
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
                                        <!-- form start -->
                                        	<!-- member_id -->
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
	                                                    <label class="small mb-1" for="inputId">아이디</label>
	                                                    <input class="form-control py-4" id="inputId" name="member_id" type="text" placeholder="아이디" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                    	<label class="small mb-1" for="inputIdHint"> <span>&nbsp;</span> </label>
                                                    	<span class="form-control-hidden py-4" id="inputIdHint" > <span>&nbsp;</span> </span>
                                                    	<!-- <input class="form-control py-4" id="inputLastName" type="text" /> -->
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- password -->
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input class="form-control py-4" id="inputPassword" name="password" type="password" placeholder="비밀번호" /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label><input class="form-control py-4" id="inputConfirmPassword" type="password" placeholder="비밀번호 확인" /></div>
                                                </div>
                                            </div>
                                            <!-- name -->
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">이 름</label><input class="form-control py-4" id="inputName" name="name" type="text" placeholder="이름" /></div>
                                            <!-- phone -->
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">전화번호</label><input class="form-control py-4" id="inputPhone" name="phone" type="text" placeholder="전화번호" /></div>
                                            <!-- house_id -->
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">호</label><input class="form-control py-4" id="inputHouseID" name="house_id" type="text" placeholder="호" /></div>
                                            
                                            <!-- btn-회원가입 -->
											<div class="form-group mt-4 mb-0"><a class="btn btn-gray btn-block" id="signup" style="color:white">회원가입</a></div>
                                            <!-- <div class="form-group mt-4 mb-0"><a class="btn btn-gray btn-block" id="signup" href="login.html">회원가입</a></div> -->
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
        <script>	
			$(document).ready(function(){ 
				$("#signup").click(function(){
					// form check
					if($("#inputId").val().length==0) { alert("아이디를 입력하세요."); $("#inputId").focus(); return false; }
					if($("#inputPassword").val().length==0) { alert("비밀번호를 입력하세요."); $("#inputPassword").focus(); return false; }
					if($("#inputConfirmPassword").val().length==0) { alert("비밀번호를 확인해주세요."); $("#inputConfirmPassword").focus(); return false; }
					// password confirm check
					if($("#inputPassword").val().length!=0 && $("#inputConfirmPassword").val().length!=0) {
						if($("#inputPassword").val() != $("#inputConfirmPassword").val()) {
							alert("비밀번호를 다시 확인해주세요."); $("#inputPassword").focus(); return false;
						}
					}
					if($("#inputName").val().length==0) { alert("이름을 입력하세요."); $("#inputName").focus(); return false; }
					if($("#inputPhone").val().length==0) { alert("전화번호를 입력하세요."); $("#inputPhone").focus(); return false; }
					if($("#inputHouseID").val().length==0) { alert("거주하시는 호 수를 입력하세요."); $("#inputHouseID").focus(); return false; }
					if($("#inputHouseID").val().length!=0) {
						var list = ['101', '102', '103', '104',
								'201', '202', '203', '204',
								'301', '302', '303', '304',
								'401', '402', '403', '404',
								'501', '502', '503', '504', 'admin' ];
						var houseid = $("#inputHouseID").val();
						/* for (var i = 0; i < list.length; i++) {
							if(list[i] != houseid) {
								alert("거주하시는 호 수를 다시 확인해주세요.");
								$("#inputHouseID").focus();
							}
						}
						return false; */
						if(list.includes(houseid) == false) {
							alert("거주하시는 호 수를 다시 확인해주세요.");
							$("#inputHouseID").focus();
							return false;
						}
						//alert(list.includes(houseid));	//	true : false
					}
					
					// form_data
					// member_id, password, name, phone, allowed, date, house_id
					var form_data = {
							'member_id':$("#inputId").val(),
							'password':$("#inputPassword").val(),
							'name':$("#inputName").val(),
							'phone':$("#inputPhone").val(),
							'house_id':$("#inputHouseID").val()
					};
					//alert(form_data);
					
					// id check in db
					/* $.ajax({
						type: "POST",
						url: '/glasses/idcheck',
						data: form_data,
						success: function () {
							$("#inputIdHint").html("<span style='color:red;font-weight:bold'>로그인 실패!</span>");
						}
						/* success: function(response) {
							
							if(response == 'success') {
								//inputIdHint
								$("#inputIdHint").html("<span style='color:green;font-weight:bold'>로그인 성공!</span>");
							}
							else {
								$("#inputIdHint").html("<span style='color:red;font-weight:bold'>로그인 실패!</span>");
							}
						} 
					}); */
					
					/*
					if(dao.isIdExist(member) == 0) {
						if(dao.isHouseExist(member) == 0) {
							return "success";
						}
						else
							return "house";
					} else {
						return "id";
					}
					*/
					
					$.ajax({
						type: 'POST',
						url: '/glasses/membercheck',
						//data: { 'member_id' : $("#inputId").val() },
						data: form_data,
						success: function (data) {
							//$("#inputIdHint").html("<span style='color:red;font-weight:bold'>이미 존재하는 아이디입니다.</span>");
							if(data == "success") {
								// href : homeinfo.jsp	/homeinfo
								// alert("success");
								alert("회원가입이 완료되었습니다.");
								window.location.href='<%=request.getContextPath()%>/';
							} else if(data == "house") {
								$("#inputHouseID").focus();
								alert("해당 세대는 더이상 회원가입이 불가능합니다.");
								window.location.href='<%=request.getContextPath()%>/';								
							} else if(data == "id"){
								// already exist id
								$("#inputId").focus();
								$("#inputIdHint").html("<span style='color:red;font-weight:bold'>이미 존재하는 아이디입니다.</span>");
								return false;
							}
						}
					});
					
					//return false;
				});
				
				
			});
		</script>
    </body>
</html>
