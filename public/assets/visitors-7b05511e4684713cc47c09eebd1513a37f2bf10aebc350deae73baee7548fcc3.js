$(document).ready(function(){$("#votePopup").modal(),$("#vote_saved").hide(),$("#myCarousel").carousel({interval:5e3}),$("#nav-home").addClass("selected"),$(".vote_team_btn").click(function(){$(this).toggleClass("can_vote");var t=[];$(".vote_team_btn.can_vote").each(function(){var e=$(this).attr("id").split("voteteam")[1];t.push(e)});t.join(",");t.length>2?(alert("You may only select up to 2 teams"),$(this).toggleClass("can_vote")):$("#save_changes_btn").show()}),$("#save_vote_btn").click(function(t){var e=[];$(".vote_team_btn.can_vote").each(function(){var t=$(this).attr("id").split("voteteam")[1];e.push(t)});var a=e.join(",");e.length<=2&&($.post("/team_votes?team_ids="+a),$("#vote_saved").show())})});