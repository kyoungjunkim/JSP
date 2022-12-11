$(document).ready(function(){

    var gnb = $('#gnb > li > a');
    
    gnb.click(function(e){
        e.preventDefault();
        var isOpen = $(this).next().is(':visible');
    
        if(isOpen){
            $(this).next().slideUp(200);
        }else{
            $(this).next().slideDown(200);
        }
    });
    
    
    // 카테고리 김지홍
	cate1List();
	// 카테고리 1번 리스트 출력 함수 김지홍
    // 카테고리 2번 김지홍
    $('select[name=category1]').on('change', function(){
		let cate2Val =$(this).val();
		$.ajax({
        url:'/Kmarket/admin/product/cate.do?cate1=2&cate2='+cate2Val,
        dataType:'json',
        success:(data)=>{
            let cate2 = $('select[name=category2]');
            cate2.children().remove();
            let tag = 
            `<option value="0">2차 분류 선택</option>`;
            data.forEach(e => {
                tag += `<option value="${e.cate2}">${e.c2Name}</option>`;
            });
            cate2.append(tag);
        }
    });
	});

    
});

  function cate1List(){
    $.ajax({
        url:'/Kmarket/admin/product/cate.do?cate1=1',
        dataType:'json',
        success:(data)=>{
            let cate1 = $('select[name=category1]');
            cate1.children().remove();
            let tag = 
            `<option value="0">1차 분류 선택</option>`;
            data.forEach(e => {
                tag += `<option value="${e.cate1}">${e.c1Name}</option>`;
            });
            cate1.append(tag);
        }
    });
     
   }
   
   function cate2List(cate1){
        console.log(cate1);
    }