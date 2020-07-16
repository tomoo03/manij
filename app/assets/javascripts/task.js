$(function() {
  function buildTaskDay(taskDate) {
    let taskText = `${taskDate.year}年${taskDate.mon}月${taskDate.day}日`;
    return taskText;
  }
  function getTaskFlg (taskFlg) {
    let flg = taskFlg.boolean;
    return flg;
  }
  
  $('.goal-show-info__contents__accbox__accshow__checkbox__input').on('click', function() {
    let taskHtml = $(this).parent().next();
    let taskData = $(this).next('#task').data("task-id");
    $.ajax({
      url: '/api/tasks',
      type: 'GET',
      dataType: 'json',
      data: {id: taskData}
    })
    .done(function(task) {
      let taskText = buildTaskDay(task);
      let flg = getTaskFlg(task);
      if (flg == true) {
        taskHtml.text(taskText);
      } else {
        taskHtml.text('');
      };
    })
    .fail(function() {
      alert('error');
    });
  });
});