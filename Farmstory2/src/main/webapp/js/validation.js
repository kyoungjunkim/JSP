//정규표현식
let regUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
let regName  = /^[가-힣]{2,4}$/;
let regNick  = /^[가-힣a-zA-Z0-9]+$/;
let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let regHp	 = /^\d{3}-\d{3,4}-\d{4}$/;
let regPass  = /^.*(?=^.{5,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

//상태 변수
let isUidOk = false;
let isPassOk = false;
let isPassMatch = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;
let isEmailAuthOk = false;
let isEmailAuthCodeOk = false;
let receivedCode = false;


$(function(){
	$('input[name=uid]').keydown(function(){
		isUidOk = false;
	});
	
	$('#btnUidCheck').click(function(){
		let uid = $('input[name=uid]').val();
		
		if(isUidOk){
			return;
		}
		
		if(!uid.match(regUid)){
			isUidOk = false;
			$('.resultUid').css('color', 'red').text('아이디가 유효하지 않습니다.');
			return;
		}		
		
		let jsonData = {"uid":uid};
		
		$('.resultUid').css('color','black').text('...');
		
		setTimeout(()=>{
			
			$.ajax({
				url:'',
				method:'',
				data: jsonData,
				dataType:'json',
				success:function(data){
					
					if(data.result == 0){
						isUidOk = true;
						$('.resultUid').css('color','green').text('사용 가능한 아이디 입니다.');
					}else{
						isUidOk = false;
						$('.resultUid').css('color','red').text('이미 사용중인 아이디 입니다.');
					}
				}
			});
			
		}, 500);
	});
	
	
	
	
	
	
});