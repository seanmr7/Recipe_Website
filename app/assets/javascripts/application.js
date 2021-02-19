// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//

//= require rails-ujs
//= require jquery3
//= require bootstrap-sprockets
//= require popper
//= require turbolinks
//= require activestorage
//= require_tree .

// Fade out alert messages
$(document).on('turbolinks:load', function() {
  $('.alert').delay(1000).fadeOut(3500);

  $('form').on('click', '.remove_record', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).prev().remove();
    $(this).remove();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    attached_to = $(this).prev()
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.ingredient-field').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});

jQuery('button').click( function(e) {
  jQuery('.collapse').collapse('hide');
});