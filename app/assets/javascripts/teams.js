// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function createTeam() {
	// on click select button
	// select correct project id to post
	// select team leader id to send
	$.ajax({
    url: "teams/create",
    type: "POST",
    data: {name: ''},
    success: function(data){
        console.log(data);
    }
});
}
