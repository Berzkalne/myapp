/*var checkBox = document.querySelector('.check-box');
checkBox.onchange = function() { displayList() }

function displayList() {
  if (checkBox.checked) {
    colorBox.style.display = "block";
  } else {
    colorBox.style.display = "none";
  }
}*/

$(document).ready(function(){
  $('.check-box').attr('checked', false);
  $('.check-box').click(function(){ 
    if (this.checked){
      $('.color-box').css('display', 'block');
    }else{
      $('.color-box').css('display', 'none');
    }
  });
});
