$(document).on('turbolinks:load', function() {
  let dataController = $('body').attr('data-controller');
  let dataAction = $('body').attr('data-action');
  if (dataController == 'records' && (dataAction == 'new')) {
    let icon_number = $('#record_record_category_id option:selected').val();
    $("#category_select li a").eq(icon_number-1).addClass('btn_on');
    $("#category_select li").click(function () {
      $target = $(`#${$('#category_select').attr("data")}`);
      $target.attr("selected", false);
      $target.val($(".category_id",this).text());
      $('#category_select li a').removeClass('btn_on');
      $('a',this).addClass('btn_on');
    });
  }
});
