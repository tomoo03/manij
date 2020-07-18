$(function() {
  function buildHTML(message) {
    let html = 
      `<div style="width:100%;padding:0.2rem 0;display:flex;justify-content:space-between;"><p>${message.content}</p>
       <a rel="nofollow" data-method="delete" href="/phases/${message.phase_id}/comments/${message.comment_id}"><i class="fa fa-trash"></i>
       </a></div>`
    return html;
  }

  function buildProjectHTML(message) {
    let html = 
    `<div style="width:100%;padding:0.2rem 0;display:flex;justify-content:space-between;"><p><i class="fa fa-user-edit"></i>${message.name}<br>${message.content}</p>
    <a rel="nofollow" data-method="delete" href="/project_phases/${message.phase_id}/project_comments/${message.comment_id}"><i class="fa fa-trash"></i>
    </a></div>`
    return html;
  }

  $('.comment_button').on('click',function() {
    let parent = $(this).parent()
    let token = parent.find(".token").data("authenticity-token");
    let phaseId = parent.data("commentphase-id");
    let commentText = parent.find("input").val();
    $.ajax({
      url: `/phases/${phaseId}/comments`,
      type: 'POST',
      dataType: 'json',
      data: {authenticity_token: token, comment: {content: commentText}, commit: "Create", controller: "comments", action: "index", phase_id: phaseId}
    })
    .done(function(comment) {
      let html = buildHTML(comment);
      parent.prev().append(html);
      parent.find("input").val("");
    })
    .fail(function(){
      alert('error');
    });
  });

  $('.project_comment_button').on('click',function() {
    let parent = $(this).parent()
    let token = parent.find(".token").data("authenticity-token");
    let phaseId = parent.data("commentphase-id");
    let commentText = parent.find("input").val();
    $.ajax({
      url: `/project_phases/${phaseId}/project_comments`,
      type: 'POST',
      dataType: 'json',
      data: {authenticity_token: token, project_comment: {content: commentText}, commit: "Create", controller: "project_comments", action: "create", project_phase_id: phaseId}
    })
    .done(function(comment) {
      let html = buildProjectHTML(comment);
      parent.prev().append(html);
      parent.find("input").val("");
    })
    .fail(function(){
      alert('error');
    });
  });
});