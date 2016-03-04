$(document).ready(function() {
    $('#myCarousel').carousel({interval: 2000});
    $('#myCarousel').on('slid', function() {
        var to_slide = $('.carousel-item.active').attr('data-slide-no');
        $('.myCarousel-target.active').removeClass('active');
        $('.carousel-indicators [data-slide-to=' + to_slide + ']').addClass('active');
    });
    $('.myCarousel-target').on('click', function() {
        $('#myCarousel').carousel(parseInt($(this).attr('data-slide-to')));
        $('.myCarousel-target.active').removeClass('active');
        $(this).addClass('active');
    });
});
