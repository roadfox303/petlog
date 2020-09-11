$(document).on('turbolinks:load', function() {
  let dataController = $('body').attr('data-controller');
  let dataAction = $('body').attr('data-action');
  if (dataController == 'record_categories' && (dataAction == 'new' || dataAction == 'create' || dataAction == 'edit' || dataAction == 'update')) {
    let icon_number = $('#record_category_icon_id option:selected').val();
    $(".icons_btn li").eq(icon_number-1).addClass('btn_on');
    $(".icons_btn li").click(function () {
      $target = $(`#${$(this).parent().parent().parent().find(".icons_btn").attr("data")}_id`);
      $target.attr("selected", false);
      $target.val($("span",this).text());
      $(this).parent().find("li").removeClass('btn_on');
      $(this).addClass('btn_on');
    });
    console.log($('#record_category_icon_id option:selected').val());
  }
});
