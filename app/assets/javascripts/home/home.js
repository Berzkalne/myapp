/*var el = document.getElementsByClassName('login-link')[0];
el.onmouseover = function(){
  el.style.backgroundColor = "#ffffff"
}*/

$(document).ready(function(){
  $(".login-link").on("mouseover", function(){
    $(this).css({
      'background-color': '#fff',
      'font-style': 'italic'
    });
  });
});

/*
var but = document.getElementsByClassName('magic')[0];
but.onclick = function(){
  document.body.style.backgroundColor = "#ff0080"
}*/

$(document).ready(function(){
  $(".magic").on("click", function(){
    $("body").css('background-color', '#ff0080')
  });
});
