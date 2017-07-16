/*var el = document.getElementsByClassName('login-link')[0];
el.onmouseover = function(){
  el.style.backgroundColor = "#ffffff"
}*/


/*
var element = document.getElementsByClassName('main-image')[0];
var pos = 0;
var t = setInterval(move, 10);
function move(){
  if (pos == 600){
    clearInterval(t);
  }
  else{
    pos++;
    element.style.left = pos + 'px';
  }
}*/

/*
var but = document.getElementsByClassName('magic')[0];
but.onclick = function(){
  document.body.style.backgroundColor = "#ff0080"
};
but.onmouseenter = function(){
  but.style.backgroundColor = "#000";
};
but.onmouseleave = function(){
  but.style.backgroundColor = "red";
}*/

/*$(document).ready(function(){
  $(".magic").onmouseenter(function(){
    $(this).css("background-color", "#ff0080");
  }); 
});*/

/*
$(document).ready(function(){
  $(".check-box").on('click', function(){
    $('div').toggleClass('color-box';)
  });
});*/


var checkBox = document.querySelector('.check-box');
checkBox.onchange = function() { displayList() }

function displayList() {
  var colorBox = document.querySelector('.color-box');
  if (checkBox.checked) {
    colorBox.style.display = "block";
  } else {
    colorBox.style.display = "none";
  }
}

/*
var checkBox = document.getElementsByClassName('check-box');
checkBox.checked = true;
var colorBox = document.getElementsByClassName('color-box');

if(true) {
  colorBox.display = "block";
};*/

