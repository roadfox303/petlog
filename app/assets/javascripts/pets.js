document.addEventListener('turbolinks:load', function() {

});
$(document).on('turbolinks:load', function() {
  let dataController = $('body').attr('data-controller');
  let dataAction = $('body').attr('data-action');

  if (dataController == 'pets' && (dataAction == 'new' || dataAction == 'create')) {
    let $birthday = $('#birthday_birthday_1i,#birthday_birthday_2i,#birthday_birthday_3i');
    let birthdayArray = ["","",""];

    if (dataAction == 'create' && $birthday.val() != ""){
      disable_JoinAge();
    }

    $('#check_birthday').change(function() {
      $('#birthday_birthday_1i').parent('div').toggleClass('disable');
      $birthday.val('');
      birthdayArray.map( function( value, index, array ) {
        array[index] = "";
        enable_JoinAge();
      });
    });

    $birthday.change(function() {
      birthdayArray[$birthday.index(this)] = $(this).val();
      if (birthdayArray.includes("") == false){
        disable_JoinAge();
      }else{
        enable_JoinAge();
      }
    });

    function disable_JoinAge() {
      $('#raw_join_age,#label_join_age').addClass('disable');
      $('#pet_join_age').val("");
      $('.join_age_comment').removeClass('hidden');
    }
    function enable_JoinAge() {
      $('#raw_join_age,#label_join_age').removeClass('disable');
      $('.join_age_comment').addClass('hidden');
    }
  }
});
