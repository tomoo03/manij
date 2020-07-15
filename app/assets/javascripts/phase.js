$(function() {
  $('.goal-show-info__contents__phase__config').on('click',function() {
    let formData = $(this).find("#phase_data").data("phase-id");
    $.ajax({
      url: '/api/phases',
      type: 'GET',
      dataType: 'json',
      data: {id: formData}
    })
    .done(function(phase) {
      console.log('success');
    })
    .fail(function() {
      alert('error');
    });
  })
});