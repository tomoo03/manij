$(function() {
  function buildCurrentText() {
    let currentPhase = '現在のフェーズに変更';
    return currentPhase;
  };
  function buildOngoingText() {
    let ongoingPhase = '進行中のフェーズ';
    return ongoingPhase;
  };

  $('.goal-show-info__contents__phase__config').on('click',function() {
    let phaseBlock = $(this);
    if (phaseBlock.find("p").text() == "現在のフェーズに変更") {
      let phaseText = $("p:contains('進行中のフェーズ')");
      let formData = $(this).next("#phase_data").data("phase-id");
      $.ajax({
        url: '/api/phases',
        type: 'GET',
        dataType: 'json',
        data: {id: formData}
      })
      .done(function(phase) {
        let currentPhase = buildCurrentText();
        let ongoingPhase = buildOngoingText();
        phaseBlock.find("p").text(ongoingPhase);
        phaseText.text(currentPhase);
      })
      .fail(function() {
        alert('error');
      });
    } else {
      ;
    }
  });

  $('.project-show-info__contents__phase__config').on('click',function() {
    let phaseBlock = $(this);
    if (phaseBlock.find("p").text() == "現在のフェーズに変更") {
      let phaseText = $("p:contains('進行中のフェーズ')");
      let formData = $(this).next("#project_phase_data").data("projectphase-id");
      $.ajax({
        url: '/api/project_phases',
        type: 'GET',
        dataType: 'json',
        data: {id: formData}
      })
      .done(function(phase) {
        let currentPhase = buildCurrentText();
        let ongoingPhase = buildOngoingText();
        phaseBlock.find("p").text(ongoingPhase);
        phaseText.text(currentPhase);
      })
      .fail(function() {
        alert('error');
      });
    } else {
      ;
    }
  })
});