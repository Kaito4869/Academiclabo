const { post } = require("jquery");

const CLASSNAME = "-visible";
const TIMEOUT = 1500;
const $target = $(".title");

setInterval(() => {
  $target.addClass(CLASSNAME);
  setTimeout(() => {
    $target.removeClass(CLASSNAME);
  }, TIMEOUT);
}, TIMEOUT * 2);

$(function () {
  $('.post-btn-icon').hover(function() {
    $(this).addClass('rotateY');
  }, function() {
    $(this).removeClass('rotateY');
  });
});