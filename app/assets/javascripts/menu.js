var ready = function () {
  
  
  // // Search bar
  // $(".input-field").find("#search").focus(function() {
  //       console.log("cliquei no bang");
  //       $("#logout-button").before( "<a id='submit-search-button' class='waves-effect waves-light btn'>search</a>" );
        
        
  //   });

  // $("#submit-search-button").click(function(){
  //         console.log("aeae");
  //         $("#search-user-form").submit();
  // });

  // $(".input-field").find("#search").focusout(function() {
  //     console.log("perdi foco no bang");
  //     $("#submit-search-button").click(function(){
  //         console.log("aeae");
  //       $("#search-user-form").submit();
  //     });
  //     $("#submit-search-button").remove();  
  // });

  // $(".button-collapse").sideNav({
  //       menuWidth: 240, // Default is 240
  //       edge: 'left', // Choose the horizontal origin
  //       closeOnClick: false // Closes side-nav on <a> clicks, useful for Angular/Meteor
  // });

  // $("#main-menu-button").click(function (event) {
  //     var overlay = $('#sidenav-overlay');
  //     // $('.button-collapse').sideNav('hide'); // Needs to be simulated
  //     overlay.remove();
  //     // event.preventDefault();
  // });

  // $("#main-menu-button").click(function (event) {
  //   $('.button-collapse').sideNav('hide');
  // });


  $(document).on('click', '#toast-container .toast', function() {
    $(this).fadeOut(function(){
        $(this).remove();
    });
  });

  
  
}


$(document).ready(ready);
$(document).on("page:load", ready);