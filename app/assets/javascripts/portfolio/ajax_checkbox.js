$(function() {
  $('.ajax_checkbox').change(function() {
    var el = $(this);
    var checked = el.is(':checked');
    var url = el.data('path');
    var field = el.data('field');
    var data = {site_project: {}};
    
    data['site_project'][field] = checked;
    
    $.ajax({
      type: 'patch',
      dataType: 'json',
      url: url,
      data: data
    });
  });
});
