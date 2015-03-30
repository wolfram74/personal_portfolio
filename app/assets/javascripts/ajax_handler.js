$(document).ready(function() {
  bindEvents();
});

function bindEvents(){
  $("#header").on("click", "a", headerGrab);
}

function headerGrab(){
  event.preventDefault();
  if (this.href.indexOf("projects")>-1){
    grabProjects(this.href)
  } else if (this.href.indexOf("cv")>-1){
    grabCV(this.href)
  };
};

function grabProjects(url){
  $.ajax({
    type:"GET",
    url: url
  }).done(loadProjects)
}

function grabCV(url){
  loadCV()
}



function loadProjects(objects){
  var source = $("#projectsIndex").html();
  var template = Handlebars.compile(source);
  var context = {projects: objects}
  var rendered = template(context)
  viewHandler(rendered)
}

function loadCV(){
  var source = $("#cvIndex").html();
  var template = Handlebars.compile(source);
  var context = {}
  var rendered = template(context)
  viewHandler(rendered)  
}

function viewHandler(newSection){
  $("#stage").children().hide()
  $("#stage").append(newSection)
}
function shout(){
  console.log("EVERYTHING IS HAPPENING?!S")
}