// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function stock(){
  $(".stock_th").css('display','none');
  var edit = $('.stock_edit');
  edit.css('display','block');
  edit.css('width','100%');
  $('#submit_bt').css('display','block');
  $('#submit_bt').css('margin-left','90%');
  $('#bt_th').css('display','none');
  $('#bt_th2').css('display','table');
}
function editer(){
    $(".stock_th").css('display','block');
    $(".stock_edit").css('display','none');
    var th = $('.stock_th');
    th.css('display','block');
    th.css('width','100%');
    $('#submit_bt').css('display','none');
    $('#bt_th').css('display','table'); 
    $('#bt_th2').css('display','none');

}