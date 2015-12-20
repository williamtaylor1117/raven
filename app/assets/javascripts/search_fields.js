$(document).ready(function() {
  
  $("#file_browse").hide();
  $(".search_field").hide();
        
   $("#type_url").click(function() {
     $("#file_browse").hide();
     $("#q").css("height", "30px")
     $(".search_field").show();
   });
  
  $("#type_text").click(function() {
     $("#file_browse").hide();
     $("#q").css("height", "300px");
     $(".search_field").show();
  });
  
  $("#file").click(function() {
     $("#q").css("height", "300px");
     $("#file_browse").show();
     $(".search_field").show();
  });
  
}); 

