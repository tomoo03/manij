$(function() {
  $('.goal-show-info__contents__accbox__accshow__checkbox__input').on('click', function() {
    let hoge = $(this).next('#task').data("task-id");
    $.ajax({
      url: '/api/tasks',
      type: 'GET',
      dataType: 'json',
      data: {id: hoge}
    })
    .done(function(task) {
      console.log('success');
    })
    .fail(function() {
      alert('error');
    });
  });

  $('.comment_button').on('click',function() {
    let textBox = $(this).parent()
    let phaseId = textBox.find("p").data("phase-id");
    let commentText = textBox.find("input").val();
    console.log(phaseId);
    console.log(commentText);
    $.ajax({
      url: '/api/comments',
      type: 'GET',
      dataType: 'json',
      data: {content: commentText, phase_id: phaseId}
    })
    .done(function(comment) {
      textBox.find("input").val("");
    })
    .fail(function(){
      alert('error');
    });
  });
});