// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require turbolinks

$(document).ready(function(){
  
});

var jsArray = {};

function loadScript(scriptName, callback) {

  if (!jsArray[scriptName]) {
    jsArray[scriptName] = true;

    // adding the script tag to the head as suggested before
    var body = document.getElementsByTagName('body')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = scriptName;

    // then bind the event to the callback function
    // there are several events for cross browser compatibility
    //script.onreadystatechange = callback;
    script.onload = callback;

    // fire the loading
    body.appendChild(script);

  } else if (callback) {// changed else to else if(callback)
    //console.log("JS file already added!");
    //execute function
    callback();
  }

}

function append_url_ajax(url_str, div_id, parameters, type_call){  /*  usar este owo  */

  $.ajax({
    type: type_call,
    url: url_str,
    async: false,
    data: parameters
  }).done(function( data ) {
    $("#" + div_id).append(data);
  });
  return false;
}