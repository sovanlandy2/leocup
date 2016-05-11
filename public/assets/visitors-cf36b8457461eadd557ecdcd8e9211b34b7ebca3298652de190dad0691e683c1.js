$(document).ready(function() {
    $('#myCarousel').carousel({interval: 5000});
    $('#nav-home').addClass('selected');
    

    $('.vote_team').click(function () {

    	$('.vote_team').each(function () {
    		$(this).removeClass('active');
    	});

    	$(this).addClass('active');
    	var team_id = $(this).attr('id').split("vote_team_")[1];
    	$('#save_change').attr("href", "/team_votes?team_id=" + team_id);
    });
});
