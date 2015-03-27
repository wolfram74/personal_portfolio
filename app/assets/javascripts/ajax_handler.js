$(document).ready(function() {
  bindEvents();
});

function bindEvents(){
  $("#header").on("click", "a", headerGrab);
}

function headerGrab(){
  event.preventDefault();
  shout()
  console.log(event)
  console.log(this.href)
  $.ajax({
    type:"GET",
    url: this.href
  }).done(loadPage)
}

function loadPage(objects){
  var source = $("#projectsIndex").html();
  var template = Handlebars.compile(source);
  var context = {projects: objects}
  // var tc= 
  // console.log(objects)
  var rendered = template(context)
  // $("#stage").empty()
  $("#startpoint").hide()
  $("#stage").append(rendered)
}

function shout(){
  console.log("EVERYTHING IS HAPPENING?!S")
}
