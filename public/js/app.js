$(function() {
  var data = $('#friend option').toArray().map(function(option) {
    return { id: $(option).val(), text: $(option).text() };
  });

  $("#friend").select2({
    data: data
  });
});