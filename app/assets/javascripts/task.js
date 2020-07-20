$(function() {
  function buildTaskDay(taskDate) {
    let taskText = `${taskDate.year}年${taskDate.mon}月${taskDate.day}日`;
    return taskText;
  }
  function buildTaskName(taskDate) {
    let taskText = `${taskDate.year}年${taskDate.mon}月${taskDate.day}日 担当: ${taskDate.user_name}`;
    return taskText;
  }
  function getTaskFlg (taskFlg) {
    let flg = taskFlg.boolean;
    return flg;
  }
  
  $('.goal-show-info__contents__accbox__accshow__checkbox__input').on('click', function() {
    let taskHtml = $(this).parent().parent().parent().prev().find("p");
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

  $('.project-show-info__contents__accbox__accshow__checkbox__input').on('click', function() {
    let taskHtml = $(this).parent().parent().parent().prev().find("p");
    let taskData = $(this).next('#task').data("task-id");
    $.ajax({
      url: '/api/project_tasks',
      type: 'GET',
      dataType: 'json',
      data: {id: taskData}
    })
    .done(function(task) {
      let taskText = buildTaskName(task);
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