$(function() {
  let btn = $('#header__btn');
  let btn2 = $('#header__btn2');
  let i;
  let q;
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

  for(q = 0; q < btn2.length; q++) { 
    btn2.eq(q).on('click', function() {
      let panel = $(this).next();
      if (panel.css('display') == 'block') {
        panel.slideUp(100);
      } else {
        panel.slideDown(100);
      }
    })
  };
});