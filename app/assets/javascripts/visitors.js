$(document).ready(function() {
    $('#votePopup').modal();
    $('#vote_saved').hide();
    $('#myCarousel').carousel({interval: 5000});
    $('#nav-home').addClass('selected');
    

    $('.vote_team_btn').click(function () {    
    	$(this).toggleClass('can_vote');
        var arrayId = [];
        $('.vote_team_btn.can_vote').each( function () {
            var id = $(this).attr('id').split('voteteam')[1];
            arrayId.push(id);
        });
        var team_ids = arrayId.join(",");
        if (arrayId.length > 2){
            alert("You may only select up to 2 teams");
            $(this).toggleClass('can_vote');
        } else {
            $('#save_changes_btn').show();
        }
    });

    $('#save_vote_btn').click(function (e) {
        var arrayId = [];
        $('.vote_team_btn.can_vote').each( function () {
            var id = $(this).attr('id').split('voteteam')[1];
            arrayId.push(id);
        });
        var team_ids = arrayId.join(",");
        if (arrayId.length<=2){
            $.post("/team_votes?team_ids="+team_ids);
            $('#vote_saved').show();
        }
        
    });

    //vote-dropout

});
