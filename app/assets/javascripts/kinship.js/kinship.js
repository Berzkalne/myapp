var color = document.getElementsByClassName('kinship-wrapper')[0];
document.body.style.color = color.dataset.color;

//Color in Kinships
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
