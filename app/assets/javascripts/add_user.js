$(document).ready(function(){
  
  // Make contact request
  $("#modal-contact-found").find(".modal-footer").find("#modal-accept-button").click(function(){
    $("#modal-contact-found").find(".modal-content").find("#add-modal-description").find("#add-user-action").submit();
  });


  $('.dropdown-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrain_width: true, // Does not change width of dropdown to that of the activator
      hover: true, // Activate on hover
      gutter: 0, // Spacing from edge
      belowOrigin: true, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    }
  );
        
  // Accept contact request

});