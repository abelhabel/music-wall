$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote img').click(upvote);
  
  function increaseUpvote(message)
  {
    args = message.split(':');
    message = args[0];
    id = args[1];
    value = args[2];
    if(message == 'success'){
      img = $('*[data-id=' + id + ']');
      vote_element = img[0].previousElementSibling;
      vote_element.innerHTML = value;
    }else{
      alert('You can only vote once per song.')
    }
  }
  function upvote(e){
    $.ajax({   
       type: 'POST',   
       url: "/upvote",   
       data: "message_id=" + this.getAttribute('data-id'),
       success: increaseUpvote,
       dataType: 'text' 
    }); 
  }
});
