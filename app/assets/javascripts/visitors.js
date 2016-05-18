$(document).ready(function() {
    $('#myCarousel').carousel({interval: 5000});
    $('#nav-home').addClass('selected');
    

    $('.vote_team').click(function () {    
    	$(this).toggleClass('active');
    });

    $('#save_changes').click(function (e) {
        var arrayId = [];
        $('.vote_team.active').each( function () {
            var id = $(this).attr('id').split('voteteam')[1];
            arrayId.push(id);
        });
        var team_ids = arrayId.join(",");
        $.post("/team_votes?team_ids="+team_ids);
    });
});
