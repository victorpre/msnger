// Show errors on input fields

function fixFieldErrors () {
  // There is at least 1 error
  if($(".field_with_errors").length>0){
    var allInputElements = $( "input" );
    var allLabelsElements = $("label");
    var inputElements = $(".field_with_errors").find(allInputElements);
    var labelElements = $(".field_with_errors").find(allLabelsElements);
    for (var i = inputElements.length - 1; i >= 0; i--) {
      $("#"+inputElements[i].id).removeClass("valid").addClass("invalid");
    };

    labelElements.each(function(index, element){
      element.setAttribute('class','active');
    });
  }
}