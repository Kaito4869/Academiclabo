const { post } = require("jquery");

$(function () {
  $('.post-btn-icon').hover(function() {
    $(this).addClass('rotateY');
  }, function() {
    $(this).removeClass('rotateY');
  });
});