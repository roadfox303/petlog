document.addEventListener('turbolinks:load', function() {
  if ($('body').attr('data-controller') == 'pets' && $('body').attr('data-action') == 'new') {
    let $birthday = $('#birthday_birthday_1i,#birthday_birthday_2i,#birthday_birthday_3i');
    let birthdayArray = ["","",""];

    $('#check_birthday').change(function() {
      $('#birthday_birthday_1i').parent('div').toggleClass('disable');
      $birthday.val('');
      birthdayArray.map( function( value, index, array ) {
        array[index] = "";
        $('#raw_join_age,#label_join_age').removeClass('disable');
        $('.join_age_comment').addClass('hidden');
      });
    });

    $birthday.change(function() {
      birthdayArray[$birthday.index(this)] = $(this).val();
      if (birthdayArray.includes("") == false){
        $('#raw_join_age,#label_join_age').addClass('disable');
        $('#pet_join_age').val("");
        $('.join_age_comment').removeClass('hidden');
      }else{
        $('#raw_join_age,#label_join_age').removeClass('disable');
        $('.join_age_comment').addClass('hidden');
      }
    });
  }
});
