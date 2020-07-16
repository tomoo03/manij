$(function() {
  function buildHTML(message) {
    let html = 
      `<p>${message.content}</p>`
    return html;
  }

  $('.comment_button').on('click',function() {
    let parent = $(this).parent()
    let token = parent.find(".token").data("authenticity-token");
    let phaseId = parent.find("#phase_data").data("phase-id");
    let commentText = parent.find("input").val();
    $.ajax({
      url: `/phases/${phaseId}/comments`,
      type: 'POST',
      dataType: 'json',
      data: {authenticity_token: token, comment: {content: commentText}, commit: "Create", controller: "comments", action: "index", phase_id: phaseId}
    })
    .done(function(comment) {
      let html = buildHTML(comment);
      console.log(html);
      parent.find(".goal-show-info__contents__phase__menu").find(".goal-show-info__contents__phase__comments").append(html);
      parent.find("input").val("");
    })
    .fail(function(){
      alert('error');
    });
  });
});