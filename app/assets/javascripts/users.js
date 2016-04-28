var ready = function () {

    /**
     * When the send message link on our home page is clicked
     * send an ajax request to our rails app with the sender_id and
     * recipient_id
     */

     function readMessage(conversation_id){
        $("#"+conversation_id+"-msg-count").hide();
        $.post("/conversations/read", { conversation_id: conversation_id}, function () {
        });
     }

    $('.start-conversation').click(function (e) {
      e.preventDefault();

      var sender_id = $(this).data('sid');
      var recipient_id = $(this).data('rip');

      $.post("/conversations", { user1_id: sender_id, user2_id: recipient_id }, function (data) {
          chatBox.chatWith(data.conversation_id);
          
          // Hides Unread msgs count
          readMessage(data.conversation_id);
      });
    });

    /**
     * Used to minimize the chatbox
     */

    $(document).on('click', '.toggleChatBox', function (e) {
      e.preventDefault();

      var id = $(this).data('cid');
      chatBox.toggleChatBoxGrowth(id);
    });

    /**
     * Used to close the chatbox
     */

    $(document).on('click', '.closeChat', function (e) {
        e.preventDefault();

      var id = $(this).data('cid');
      chatBox.close(id);
    });

    /* Used to add padding so the chat box always stays on top of the footer*/

    $( window ).resize(function() {
      footerHeight = $(".page-footer").height();
      chatBoxesCount = 0;

      for (var i = 1; i <=5 ; i++) {
        if($("#chatbox_"+i).length>0){
          chatBoxesCount = chatBoxesCount+1;
        }
      }

      for (var i = 1; i <= chatBoxesCount; i++) {
        $("#chatbox_"+i).css("padding-bottom",footerHeight+20);
      }

    });

    /**
     * Listen on keypress' in our chat textarea and call the
     * chatInputKey in chat.js for inspection
     */

    $(document).on('keydown', '.chatboxtextarea', function (event) {

      var id = $(this).data('cid');
      // Hide unread msgs
      readMessage(id);

      chatBox.checkInputKey(event, $(this), id);
    });

    $(document).on('click', '.submitMsg', function (event){

      form = $(this).context.form;
      var id = form.getElementsByClassName("chatboxtextarea")[0].getAttribute('data-cid');
      chatboxTextArea = $("#chatbox_" + id).find(".chatboxtextarea");
      chatBox.checkInputKey(event, chatboxTextArea, id);
    });

    $(document).on('focus', '.chatboxtextarea', function (event){
      var id = $(this).data('cid');
      readMessage(id);
    });

    /**
     * When a conversation link is clicked show up the respective
     * conversation chatbox
     */

    $('a.conversation').click(function (e) {
      e.preventDefault();

      var conversation_id = $(this).data('cid');
      chatBox.chatWith(conversation_id);
    });


}

$(document).ready(ready);
$(document).on("page:load", ready);