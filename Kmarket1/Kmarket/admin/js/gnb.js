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

    //cate1List();
    function cate1List(){
        $.ajax({
            url:'/Kmarket/admin/product/cate.do?cate=1',
            dataType:'json',
            success:(data)=>{
                let cate1 = $('select[name=category1]');
                cate1.children().remove();
                let tag = 
                `<option class="cate1" value="0">1차 분류 선택</option>`;
                data.forEach(e => {
                    tag += `<option class="cate1" value="${e.cate1}">${e.c1Name}</option>`;
                });
                cate1.append(tag);
            }
        });
    }
    $('.cate1').on('click', cate2List($(this).val()));

    function cate2List(cate1){
        console.log(cate1);
    }
    
    
});