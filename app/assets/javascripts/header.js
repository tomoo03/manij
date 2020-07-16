$(function() {
  let btn = $('#header__btn');
  let i;
  for(i = 0; i < btn.length; i++) { 
    btn.eq(i).on('click', function() {
      let panel = $(this).next();
      if (panel.css('display') == 'block') {
        panel.slideUp(100);
      } else {
        panel.slideDown(100);
      }
    })
  };
});