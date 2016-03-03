// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

	// on click select button
	// select correct project id to post
	// select team leader id to send
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
function addTeamMember() {
	$('.add').click(function (event) {
		event.preventDefault();
		var selector = $(event.currentTarget).data('user-id')
		var teamId = $('.js-team-id').data('team-id')
		console.log(selector);
		$(`.js-add-team-btn-${selector}`).addClass("disabled");
		$(`.js-remove-team-btn-${selector}`).removeClass("disabled");
		var userId = selector;	
		$.ajax({
		    url: "/teams/" + teamId,
		    type: "PATCH",
		    data: {member_id: {jrdev_id: selector}},
		    success: function(){
		        console.log("great success");
		    },
		    error: function() {
		    	console.log("did not POST");
		    }
		});
	});
}

function removeTeamMember() {
	$('.undo').click(function (event) {
		event.preventDefault();
		var selector = $(event.currentTarget).data('user-id')
		var teamId = $('.js-team-id').data('team-id')
		console.log(selector);
		$(`.js-remove-team-btn-${selector}`).addClass("disabled");
		$(`.js-add-team-btn-${selector}`).removeClass("disabled");
		var userId = selector;
		$.ajax({
		    url: "/teams/" + teamId,
		    type: "PATCH",
		    data: {member_id: {jrdev_id: selector}},
		    success: function(){
		        console.log("great success");
		    },
		    error: function() {
		    	console.log("did not POST");
		    }
		});
	});
}

