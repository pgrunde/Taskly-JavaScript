$(document).ready(function(){
//  day one jQuery
  var stopFlash = function() {
    $('.errors').slideUp();
  };

  window.setTimeout(stopFlash,5000);

  $('.errors').click(function(){
    $('.errors').slideUp();
  });

  $('.up-shield').on("click",function(){

    $(this).hide();

    $('.up-shield').not($(this)).show();
    $('.down-shield').not($(this)).hide();
    $(this).siblings('.down-shield').show();

    var togglin = $(this).parents().parents().siblings('.tasks');
    togglin.slideToggle();
    $('.tasks').not(togglin).slideUp();

  });

  $('.down-shield').on("click",function(){
    var togglin = $(this).parents().parents().siblings('.tasks');
    togglin.slideToggle();
    $(this).hide()
    $(this).siblings('.up-shield').show();
  });

  var dueDate = $('.due-date');
  dueDate.each(function(){
    var num = this.innerHTML.split(" ");
    num = parseInt(num[0]);
    if(num < 0){
      $(this).css("background-color","red");
    } else if(num == 0){
      $(this).css("background-color","orange");
    }
  });

//  day two jQuery
  $('input[type="submit"]').attr('disabled','disabled');
  $("input[type=text]").keyup(function(){
    if(($(this).val()) != ""){
      $("input[type='submit']").removeAttr('disabled')
    } else {
      $('input[type="submit"]').attr('disabled','disabled');
    }
  });
  $('input[type=text], textarea').keyup(function(){
    if($(this).val() != "") {
      $("input[type='submit']").removeAttr('disabled')
    } else {
      $('input[type="submit"]').attr('disabled','disabled');
    }
  });
});