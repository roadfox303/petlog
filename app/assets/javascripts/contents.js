$(document).on('turbolinks:load', function() {
  let dataController = $('body').attr('data-controller');
  let dataAction = $('body').attr('data-action');
  $(".memo_btn").click(function () {
    target = $(this).attr("data");
    $(target).toggleClass("hidden");
  });
});
