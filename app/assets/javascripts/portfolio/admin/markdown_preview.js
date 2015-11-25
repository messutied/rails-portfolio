function setupMarkdownPreview() {
  $('.js_markdown_preview').click(function (evt) {
    var el = $(this);
    var parent = el.parent()
    var textEl = parent.find('textarea');
    var previewEl = parent.find('.markdown_preview');
    evt.preventDefault();
    
    if (textEl.is(':visible')) {
      $.post(adminPath()+'/markdown_preview', {text: textEl.val()}, function(data) {
        textEl.hide();
        previewEl.html(data.html).show();
        el.html('Hide preview');
      });
    }
    else {
      previewEl.hide().html('');
      textEl.show();
      el.html('Show preview');
    }
  });
}

function adminPath() {
  var pieces = window.location.pathname.split('/');
  var adminPathArr = [];
  
  for (var i in pieces) {
    var piece = pieces[i];
    
    adminPathArr.push(piece);
    
    if (piece == 'admin') {
      return adminPathArr.join('/');
    }
  }
}

$(document).ready(setupMarkdownPreview);
$(document).off('page:load').on('page:load', setupMarkdownPreview);
