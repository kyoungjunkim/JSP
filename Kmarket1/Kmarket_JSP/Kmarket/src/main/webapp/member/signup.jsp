<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>    
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
    <script src="https://kit.fontawesome.com/e8f010a863.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/Kmarket/member/css/style.css"/>
</head>
<body>
    <div id="wrapper">
         <header>
            <div class="top">
              <div>
                <a href="/Kmarket/member/login.do">로그인</a>
                <a href="/Kmarket/member/join.do">회원가입</a>
                <a href="#">마이페이지</a>
                <a href=""><i class="fa-solid fa-cart-shopping"></i>&nbsp;장바구니</a>
              </div>
            </div>
            <div class="logo">
              <div>
                <a href="/Kmarket/index.do">
                  <img src="/Kmarket/img/header_logo.png" alt="케이마켓">
                </a>
              
              </div>
            </div>
          </header>
<script>
	$(function () {
		$('.agree').click(function() {
			
			let isCheck1 = $('input[class=agree1]').is(':checked');
			let isCheck2 = $('input[class=agree2]').is(':checked');
			let isCheck3 = $('input[class=agree3]').is(':checked');
			let isCheck4 = $('input[class=agree4]').is(':checked');
			
			if(isCheck1 && isCheck2 && isCheck3 && isCheck4){
				return true;
			}else{
				alert('동의 체크를 하셔야 합니다.');
				return false;
			}
		});
	});
</script>
        <main id="member">
            <div class="signup">
                <nav>
                    <h1>약관동의</h1>
                </nav>
                 <c:if test="${'normal' eq type}">
                <section>
                    <h3><span class="essential">(필수)</span>이용약관</h3>
                    <textarea name="terms" readonly>${vo.terms }</textarea>
                    <label><input type="checkbox" class="agree1">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>전자금융거래 이용약관</h3>
                    <textarea name="financial" readonly>${vo.finance }</textarea>
                    <label><input type="checkbox" class="agree2">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>개인정보 수집동의</h3>
                    <textarea name="privacy" readonly>${vo.privacy }</textarea>
                    <label><input type="checkbox" class="agree3">동의합니다.</label>
                </section>
                <section>
                    <h3><span class="optional">(선택)</span>위치정보 이용약관</h3>
                    <textarea name="location" readonly>${vo.location }</textarea>
                    <label><input type="checkbox" class="agree4">동의합니다.</label>
                </section>
                <div><a href="/Kmarket/member/register.do"><input type="button" class="agree" value="동의하기"></a></div>
                 </c:if>
                 
                  <c:if test="${'seller' eq type}">
                <section>
                    <h3><span class="essential">(필수)</span>판매자 이용약관</h3>
                    <textarea name="tax" readonly>${vo.tax }</textarea>
                    <label><input type="checkbox" class="agree1">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>전자금융거래 이용약관</h3>
                    <textarea name="financial" readonly>${vo.finance }</textarea>
                    <label><input type="checkbox" class="agree2">동의합니다.</label>

                    <h3><span class="essential">(필수)</span>개인정보 수집동의</h3>
                    <textarea name="privacy" readonly>${vo.privacy }</textarea>
                    <label><input type="checkbox" class="agree3">동의합니다.</label>
                </section>
                <section>
                    <h3><span class="optional">(선택)</span>위치정보 이용약관</h3>
                    <textarea name="location" readonly>${vo.location }</textarea>
                    <label><input type="checkbox" class="agree4">동의합니다.</label>
                </section>
                <div><a href="/Kmarket/member/registerSeller.do"><input type="button" class="agree" value="동의하기"></a></div>
                 </c:if>
            </div>
        </main>
        <footer>
          <ul>
              <li><a href="#">회사소개</a></li>
              <li><a href="#">서비스이용약관</a></li>
              <li><a href="#">개인정보처리방침</a></li>
              <li><a href="#">전자금융거래약관</a></li>
          </ul>
          <div>
              <p><img src="./img/footer_logo.png" alt="로고"></p>
              <p>
                <strong>(주)KMARKET</strong><br />
                부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)<br />
                대표이사 : 홍길동<br />
                사업자등록번호 : 220-81-83676 사업자정보확인<br />
                통신판매업신고 : 강남 10630호 Fax : 02-589-8842
              </p>
              <p>
                <strong>고객센터</strong><br />
                Tel : 1234-5678 (평일 09:00~18:00)<br />
                스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)<br />
                경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층<br />
                Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr<br />
              </p>
          </div>              
      </footer>
          <div class="topBtn" onclick="window.scrollTo(0,0);">
            <img src="./img/top.png" alt="탑으로" />
        </div>
    </div>
</body>
</html>