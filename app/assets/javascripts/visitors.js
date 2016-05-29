$(document).ready(function() {
    $('#vote_saved').hide();
    $('#myCarousel').carousel({interval: 5000});
    $('#nav-home').addClass('selected');
    

    $('.vote_team').click(function () {    
    	$(this).toggleClass('active');
        var arrayId = [];
        $('.vote_team.active').each( function () {
            var id = $(this).attr('id').split('voteteam')[1];
            arrayId.push(id);
        });
        var team_ids = arrayId.join(",");
        if (arrayId.length > 5){
            $('#save_changes').hide();
        } else {
            $('#save_changes').show();
        }
    });

    $('#save_changes').click(function (e) {
        var arrayId = [];
        $('.vote_team.active').each( function () {
            var id = $(this).attr('id').split('voteteam')[1];
            arrayId.push(id);
        });
        var team_ids = arrayId.join(",");
        if (arrayId.length<=5){
            $.post("/team_votes?team_ids="+team_ids);
            $('#vote_saved').show();
        }
        
    });



});
