//::: FlexSlider
$(document).ready(function () {
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: false,
        touch: true,
        animationLoop: true
    });
});

//::: Funções :::
$(function () {
    //Menu Mobile
    $('.mobmenu').click(function () {
        $('.main_header_menu ul').slideToggle();
        $(this).toggleClass('active');
        return false;
    });
    //Debug Images
    $('.debug').each(function () {
        $(this).after('<p style="color: #fff; background: #333; padding: 10px">' + $(this).width() + 'px</p>');
    });
});

/*MENU*/
$(function(){
    $(".btn-menu").click(function(){
         $(".menu").show();
    });
});
$(function(){
    $(".btn-close").click(function(){
        $(".menu").hide();
    });
});



$(function(){  
    $(".entypo-menu").hover(
        function(){$(this).css("color", "#6B6258")},
        function(){$(this).css("color", "#9C7E61")}
    );
});










