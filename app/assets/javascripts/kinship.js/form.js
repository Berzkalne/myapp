/*var checkBox = document.querySelector('.check-box');
checkBox.onchange = function() { displayList() }

function displayList() {
  if (checkBox.checked) {
    colorBox.style.display = "block";
  } else {
    colorBox.style.display = "none";
  }
}*/

function ajaxResponse($kinshipSelect){
  $.ajax({
    method: "get",
    url: "/colors",
    dataType: "json",
    data: { color: "list" },
    success: function(response){
      var id, name, option;
      $.each( response, function(index, record){
        id = record.id;
        name = record.name;
        option = "<option value='" + id + "'>" + name + "</option>";
        $kinshipSelect.append(option);
      });
    }
  });
};

function toggleSelectBox(state){
  $('.color-box').css('display', state);
}

$(document).ready(function(){
  var $checkBox = $('.check-box');
  $checkBox.attr('checked', false);
  $checkBox.click(function(){ 
    if (this.checked){
      var $kinshipSelect = $('#kinship_color_id');
      if ($kinshipSelect.children().length == 0) {
        ajaxResponse($kinshipSelect);
      }
      toggleSelectBox('block');
    }else{
      toggleSelectBox('none');
    }
  });
});
