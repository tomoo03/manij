// $(function() {
//   function buildUserName(nameText) {
//     let userNameText = `担当: ${nameText.name}`;
//     return userNameText;
//   }

//   $('.projects-edit-wrapper__relation-container__tasks__checkbox').on('click', function() {
//     let sample = $(this).next().find("p");
//     let memberData = $(this).parent().parent().data("member-id");
//     let taskData = $(this).next().data("membertask-id");
//     $.ajax({
//       url: '/api/project_tasks',
//       type: 'POST',
//       dataType: 'json',
//       data: {id: taskData, user_id: memberData}
//     })
//     .done(function(user) {
//       let userName = buildUserName(user);
//       let checked = $(this).parent().find('.projects-edit-wrapper__relation-container__tasks__checkbox').prop('checked');
//       let hoge = $(this).parent().parent();
//       console.log(hoge);
//     })
//     .fail(function() {
//       alert('error');
//     });
//   });

// });