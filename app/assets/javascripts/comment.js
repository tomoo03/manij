$(function() {
  function buildHTML(message) {
    let html = 
      `<p>${message.content}</p>`
    return html;
  }

  function buildProjectHTML(message) {
    let html = 
      `<p>${message.content} ${message.name}</p>`
    return html;
  }

  $('.comment_button').on('click',function() {
    let parent = $(this).parent()
    let token = parent.find(".token").data("authenticity-token");
    let phaseId = parent.parent().prev().find("#phase_data").data("phase-id");
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
    let phaseId = parent.find("#project_phase_data").data("projectphase-id");
    let commentText = parent.find("input").val();
    $.ajax({
      url: `/project_phases/${phaseId}/project_comments`,
      type: 'POST',
      dataType: 'json',
      data: {authenticity_token: token, project_comment: {content: commentText}, commit: "Create", controller: "project_comments", action: "create", project_phase_id: phaseId}
    })
    .done(function(comment) {
      let html = buildProjectHTML(comment);
      parent.next().append(html);
      parent.find("input").val("");
    })
    .fail(function(){
      alert('error');
    });
  });
});