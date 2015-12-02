// this js file use to home page article pagination
$(function(){
  $(".pagination a").on("click", function(e){
  	e.preventDefault();
    $.getScript(this.href);
    return false;
  });
});