$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote').click(upvote);
  function upvote(e){
    console.log(this.getAttribute("data-id"));
    $.ajax({   
       type: 'POST',   
       url: "/upvote",   
       data: "id=" + this.getAttribute('data-id'),
       success: "success",
       dataType: 'text' 
    }); 
  }
});
