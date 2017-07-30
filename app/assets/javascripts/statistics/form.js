$(document).ready(function(){
  var $cashContent = $('.cash-content');
  var $cashButton = $('#cash-turnover-statistics');
  $cashButton.click(function(){
    $cashContent.toggle();
  });
});

$(document).ready(function(){
  var $kindContent = $('.kind-content');
  var $kindsButton = $('#kinds-statistics');
  $kindsButton.click(function(){
    $kindContent.toggle();
  });
});

