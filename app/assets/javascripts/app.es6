$( document ).ready(function(){
	$(".button-collapse").sideNav();
	createTeam();
	addTeamMember()
	removeTeamMember()
	// $(".dropdown-button").dropdown();
});

function createTeam() {
	$('.js-create-team-btn').click(function (event) {
		event.preventDefault();
		$('.btn').addClass("disabled");
		console.log(event);
		var projectId = parseInt($(event.currentTarget).data('project-id'));
		var userId = parseInt($(event.currentTarget).data('user-id'));
		console.log(projectId);
		console.log(userId);
		$.ajax({
		    url: "/teams",
		    type: "POST",
		    data: {team: {team_lead_id: userId, project_id: projectId}},
		    success: function(){
		        console.log("great success");
		        window.location.assign('/');
		    },
		    error: function() {
		    	console.log("did not post");
		    }
		});
	});
}
var value = 
function addTeamMember() {
	$(`.js-add-team-btn-`).click(function (event) {
		event.preventDefault();
		var selector = $(event.currentTarget).data('user-id')
		console.log(selector);
		$(`.js-add-team-btn-${selector}`).addClass("disabled");
		$(`.js-remove-team-btn-${selector}`).removeClass("disabled");		
		var teamMemberId = ($(event.currentTarget).data('project-id'));
		console.log(teamMemberId);
		// $.ajax({
		//     url: "/users",
		//     type: "PATCH",
		//     data: {team: {team_lead_id: userId, project_id: projectId}},
		//     success: function(){
		//         console.log("great success");
		//     },
		//     error: function() {
		//     	console.log("did not PATCH");
		//     }
		// });
	});
}

function removeTeamMember() {
	$(`.js-remove-team-btn`).click(function (event) {
		event.preventDefault();
		var selector = $(event.currentTarget).data('user-id')
		console.log(selector);
		$(`.js-remove-team-btn-${selector}`).addClass("disabled");
		$(`.js-add-team-btn-${selector}`).removeClass("disabled");
		var teamMemberId = ($(event.currentTarget).data('project-id'));
		console.log(teamMemberId);
		// $.ajax({
		//     url: "/teams",
		//     type: "PATCH",
		//     data: {team: {team_lead_id: userId, project_id: projectId}},
		//     success: function(){
		//         console.log("great success");
		//     },
		//     error: function() {
		//     	console.log("did not PATCH");
		//     }
		// });
	});
}

