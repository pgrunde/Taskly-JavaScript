$(document).ready(function () {
//  day one jQuery
  var stopFlash = function () {
    $('.errors').slideUp();
  };

  window.setTimeout(stopFlash, 5000);

  $('.errors').click(function () {
    $('.errors').slideUp();
  });

  $('.up-shield').on("click", function () {

    $(this).hide();

    $('.up-shield').not($(this)).show();
    $('.down-shield').not($(this)).hide();
    $(this).siblings('.down-shield').show();

    var togglin = $(this).parents().parents().siblings('.tasks');
    togglin.slideToggle();
    $('.tasks').not(togglin).slideUp();

  });

  $('.down-shield').on("click", function () {
    var togglin = $(this).parents().parents().siblings('.tasks');
    togglin.slideToggle();
    $(this).hide()
    $(this).siblings('.up-shield').show();
  });

  var dueDate = $('.due-date');
  dueDate.each(function () {
    var num = this.innerHTML.split(" ");
    num = parseInt(num[0]);
    if (num < 0) {
      $(this).css("background-color", "red");
    } else if (num == 0) {
      $(this).css("background-color", "orange");
    }
  });

//  day two jQuery
  $('input[type="submit"]').attr('disabled', 'disabled');

  $("#new-task-page input[type=text], #new-task-page input[type=select-date]").focusout(function () {
    if (($(this).val()) != "") {
      $("input[type='submit']").removeAttr('disabled');
      $(".dingus").hide();
      $(".warning-triangle").hide();
    } else {
      $('input[type="submit"]').attr('disabled', 'disabled');
      $(this).siblings('.warning-triangle').show();
      $(".dingus").show();
    }
  });
  $('input[type=text], textarea').on({
    focusout: function () {
      if ($(this).val() != "") {
        $("input[type='submit']").removeAttr('disabled');
        $(".dingus").hide();
        $(".warning-triangle").hide();
      } else {
        $('input[type="submit"]').attr('disabled', 'disabled');
        $(this).siblings('.warning-triangle').show();
        $(".dingus").show();
      }
    },
    keyup: function() {
      if ($(this).val().length > 20) {
        $(this).val($(this).val().substr(0, 20));
      }
    }
  });

  $('input[type=submit]').on("click", function () {
    $("dingus").empty.show.append("<h2>Submitting...</h2>");
    $('input:submit').attr("disabled", true);
  });

  $(function () {
    $('.select-date').datepicker();
  });

  $('.clear-button').on("click", function () {
    $("input[type=text]").val("");
    $("input[type=text], textarea").val("");
    $('.select-date').val('mm/dd/yyyy')
  });

//  day three jQuery
  $('.list-search').on({
    keyup: function (){
      var searchItem = $(this).val();
      $('.task-list-link').each(function(){
        var taskListLinkText = $(this).text();
        if(taskListLinkText.indexOf(searchItem) > -1){
          $(this).parents('.task-list').show();
        } else {
          $(this).parents('.task-list').hide();
        }
      });
    }
  });
//      $('task-list-link').each(function(){
//        var query = $('.list-search').val();
//
//        console.log(query);
//        if(this.indexOf(query) > -1){
//          $(this).parents('.task-list').show();
//        } else {
//          $(this).parents('.task-list').hide();
//        }
//      });
});