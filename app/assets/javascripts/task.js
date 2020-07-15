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
});