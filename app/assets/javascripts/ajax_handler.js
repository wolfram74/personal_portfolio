$(document).ready(function() {
  console.log("I finished being ready")
  bindEvents();
});

function bindEvents(){
  $("#header").on("click", "a", headerGrab2);
  $("#stage").on("click", "a.article", articleIndexGrab);
}

function headerGrab(){
  event.preventDefault();
  if (this.href.indexOf("projects")>-1){
    grabProjects(this.href)
  } else if (this.href.indexOf("cv")>-1){
    grabCV(this.href)
  } else if (this.href.indexOf("contact")>-1){
    grabContact(this.href)
  } else if (this.href.indexOf("collab")>-1){
    grabCollaborators(this.href)
  } else if (this.href.indexOf("artic")>-1){
    grabArticles(this.href)
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

function grabArticles(url){
  $.ajax({
    type:"GET",
    url: url
  }).done(loadArticles);
}

function grabCollaborators(url){
  $.ajax({
    type:"GET",
    url: url
  }).done(loadCollaborators);
}

function grabCV(url){
  loadCV();
}

function grabContact(url){
  loadContact();
}

function loadProjects(objects){
  var source = $("#projectsIndex").html();
  var template = Handlebars.compile(source);
  var context = {projects: objects};
  var rendered = template(context);
  viewHandler(rendered);
};

function loadArticles(objects){
  // console.log(objects);
  // debugger
  var source = $("#articlesIndex").html();
  var template = Handlebars.compile(source);
  objects = formatArticles(objects);
  var context = {articles: objects};
  var rendered = template(context);
  viewHandler(rendered);
};

function loadCollaborators(objects){
  var source = $("#collaboratorsIndex").html();
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

function loadContact(){
  var source = $("#contactIndex").html();
  var template = Handlebars.compile(source);
  var context = {};
  var rendered = template(context);
  viewHandler(rendered);
};

function formatArticles(articles){
  console.log(articles)
  // debugger
  for(var i in articles){
    // console.log(article.content)
    articles[i].rawParagraphs = articles[i].content.split("\n\n");
    articles[i].paragraphs = [];
    for(var j in articles[i].rawParagraphs){
      articles[i].paragraphs[j] = articles[i].rawParagraphs[j].split("\n");
    };
    articles[i].lead = articles[i].paragraphs[0]
  };
  console.log(articles)
  return articles;
};

function homeLoad(){
  $("#stage").children().hide()
  $("#start_point").show()
};

function viewHandler(newSection){
  $("#stage").children().hide()
  $("#stage").append(newSection)
};
