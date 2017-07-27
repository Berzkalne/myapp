var checkBox = document.querySelector('.check-box');
checkBox.onchange = function() { displayList() }
function displayList() {
  var colorBox = document.querySelector('.color-box');
  
  for (var i=0; i<checkBox.lenght; i++){
    if(chackBox[i].type == 'checkbox'){
      checkBox[i].checked == false;
  }
  }

  if (checkBox.checked) {
    colorBox.style.display = "block";
  } else {
    colorBox.style.display = "none";
  }
}
