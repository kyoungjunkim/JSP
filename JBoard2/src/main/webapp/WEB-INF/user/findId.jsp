<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script>
	let isEmailAuthOk = false;
	let receivedCode = 0;
	
	$(function () {
		$('.btnAuth').click(function () {
			
			let email = $('input[name=email]').val();
			
			if(email == ''){
				alert('이메일을 입력 하세요.');
				return;
			}
			if(isEmailAuthOk){
				return;
			}	
			
			isEmailAuthOk = true;
			
			$('.resultEmail').text('인증코드 전송 중입니다. 잠시만 기다리세요...');
			
			setTimeout(() => {
				
				$.ajax({
					url: '/JBoard2/user/emailAuth.do',
					method: 'GET',
					data: {"email": email},
					dataType: 'json',
					success: function (data) {
						if(data.status > 0){
							isEmailAuthOk = true;
							$('.resultEmail').text('이메일을 확인 후 인증코드를 입력하세요.');
							receivedCode = data.code;
						}else{
							isEmailAuthOk = false;
							alert('메일전송이 실패 했습니다.\n다시 시도 하시기 바랍니다.');
						}
					}
				});
				
				
			}, 1000);
			
		});
		
		$('.btnConfirm').click(function() {
			let code = $('input[name=auth]').val();
			
			if(code == ''){
				alert('이메일 확인 후 인증코드를 입력하세요.');
				return;
			}
			
			
			if(code == receivedCode){
				$('input[name=email]').attr('readonly', true);
				$('.resultEmail').text('이메일이 인증 되었습니다.');
			}else{
				alert('인증코드가 틀립니다.\n다시 확인 하십시오.');
			}
		});
		
		
	});



</script>
        <main id="user">
            <section class="find findId">
                <form action="#">
                    <table border="0">
                        <caption>아이디 찾기</caption>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="name" placeholder="이름 입력"/></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <div>
                                    <input type="email" name="email" placeholder="이메일 입력"/>
                                    <button type="button" class="btnAuth">인증번호 받기</button>
                                    <span class="resultEmmail"></span>
                                </div>
                                <div>
                                    <input type="text" name="auth" disabled placeholder="인증번호 입력"/>
                                    <button type="button" class="btnConfirm">확인</button>
                                </div>
                            </td>
                        </tr>                        
                    </table>                                        
                </form>
                
                <p>
                    회원가입시 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
                    인증번호를 입력 후 확인 버튼을 누르세요.
                </p>

                <div>
                    <a href="/JBoard2/user/login.do" class="btn btnCancel">취소</a>
                    <a href="/JBoard2/user/findIdResult.do" class="btn btnNext">다음</a>
                </div>
            </section>
        </main>
        <jsp:include page="./_footer.jsp"/>