$(document).ready(function(){
  $('.task-list').on("click",function(){
    var togglin = $(this).siblings('.tasks');
    togglin.slideToggle();
    $('.tasks').not(togglin).slideUp();
  });
});