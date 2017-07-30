function ajaxShowStatistics(type){
  $.ajax({
    method: "get",
    url: "/cash_turnovers/statistics",
    dataType: "text",
    data: { type: type },
    success: function(response){
      if (type == 'cash-turnovers'){
        $('.kind-content').remove();
      }else {
        $('.kind-content').remove();
        $('.cash-content').remove();
      }
      $('.statistics-wrapper').append(response);
    }
  });
};

$(document).ready(function(){
  var $tabLink = $('.tab-link');
  $tabLink.click(function(){
    type = $(this).data('type');
    var $statistics = $(type + '-content')
    console.log($statistics)
    if (!$statistics.length > 0){
      console.log('this stupid shit')
      ajaxShowStatistics(type);
    }
  });
});
