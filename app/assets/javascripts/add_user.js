$(document).ready(function(){
  
  // Make contact request
  var modal_contact_found = $("#modal-contact-found");
  modal_contact_found.find("#modal-accept-button").click(function(){
    modal_contact_found.find("#add-user-action").submit();
  });

  $("#handle-contact-request").find("#accept-contact-pending").click(function(){
    $("#handle-contact-request").append("<input id='accept' name='accept' value=true type='hidden'>");
    $("#handle-contact-request").submit();
  });

  $("#handle-contact-request").find("#decline-contact-pending").click(function(){
    $("#handle-contact-request").append("<input id='accept' name='accept' value=false type='hidden'>");
    $("#handle-contact-request").submit();
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