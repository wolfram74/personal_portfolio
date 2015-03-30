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
  }else if (this.href.indexOf("#")>-1){
    homeLoad()
  };
};

function grabProjects(url){
  $.ajax({
    type:"GET",
    url: url
  }).done(loadProjects);
}

function grabCV(url){
  loadCV();
}



function loadProjects(objects){
  var source = $("#projectsIndex").html();
  var template = Handlebars.compile(source);
  var context = {projects: objects};
  var rendered = template(context);
  viewHandler(rendered);
};

function loadCV(){
  var source = $("#cvIndex").html();
  var template = Handlebars.compile(source);
  var context = {};
  var rendered = template(context);
  viewHandler(rendered);
};

function homeLoad(){
  $("#stage").children().hide()
  $("#start_point").show()

};

function viewHandler(newSection){
  $("#stage").children().hide()
  $("#stage").append(newSection)
};

function shout(){
  console.log("EVERYTHING IS HAPPENING?!S")
}