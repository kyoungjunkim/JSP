<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
	let success = ${success};
		if(success == "100"){
			alert('회원정보가 일치하지 않거나 가입하지 않은 회원입니다.');
		}
</script>
        <main id="member">
            <div class="login">
                <nav>
                    <h1>로그인</h1>
                    <p>
                        HOME > <b>로그인</b>
                    </p>
                </nav>

                <form action="/Kmarket/member/login.do" method="post">
                    <table border="0">
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" name="uid" placeholder="아이디 입력" ></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="text" name="pass" placeholder="비밀번호 입력"></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인">
                    <span>
                        <label><input type="checkbox" name="auto">자동 로그인</label>
                        <a href="/Kmarket/member/findId.do">아이디찾기</a>
                        <a href="#">비밀번호찾기</a>
                        <a href="/Kmarket/member/join.do">회원가입</a>
                    </span>

                    <a href="#" class="banner"><img src="/Kmarket/member/img/member_login_banner.jpg" alt="1만원 할인쿠폰"></a>
                </form>
                <img src="/Kmarket/member/img/member_certifi_logo.gif" alt="banner">
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
              <p><img src="/Kmarket/img/footer_logo.png" alt="로고"></p>
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
            <img src="/Kmarket/img/top.png" alt="탑으로" />
        </div>
    </div>
</body>
</html>