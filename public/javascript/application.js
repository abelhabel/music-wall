$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote img').click(upvote);
  function increaseUpvote(message)
  {
    console.log(message)
    args = message.split(':');
    console.log(args)
    message = args[0];
    id = args[1];
    if(message == 'success'){
      img = $('*[data-id=' + id + ']');
      vote_element = img[0].previousElementSibling;
      vote_element.innerHTML = parseInt(vote_element.innerHTML) + 1;
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
