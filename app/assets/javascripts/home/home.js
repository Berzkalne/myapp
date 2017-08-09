$(document).ready(function(){
  $(".login-link").on("mouseover", function(){
    $(this).css({
      'background-color': '#fff',
      'font-style': 'italic'
    });
  });
});

$(document).ready(function(){
  $(".magic").on("click", function(){
    $("body").css('background-color', '#ff0080')
  });
});
