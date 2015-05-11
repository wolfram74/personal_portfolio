function headerGrab2(){
  event.preventDefault();
  var captures = [/projects/, /cv/ ,/contact/ ,/articles/ ,/collaborators/ ]
  for(index in captures){
    if(captures[index].test(this.href)){
      console.log("You found "+ this.href)
      View[captures[index].source].get(this.href)
      break
    };
  };
};

function articleIndexGrab(){
  event.preventDefault();
  var index = View.articleShow.get(this.href)
  var article = View.articles.find(parseInt(index,10))
  // debugger
  View.articleShow.render(article)
}

var View = (function(){
  var cache = []
  var API = {}
  API.projects = {}
  API.collaborators = {}
  API.cv = {}
  API.contact = {}
  API.articles = {}
  API.articleShow = {}

  API.projects.get = function(url){
    $.ajax({
      type:"GET",
      url: url
    }).done(this.render);
  };

  API.projects.render = function(projects){
    var source = $("#projectsIndex").html();
    var template = Handlebars.compile(source);
    var context = {projects: projects};
    var rendered = template(context);
    viewHandler(rendered);
  }

  API.collaborators.get = function(url){
    $.ajax({
      type:"GET",
      url: url
    }).done(this.render);
  };

  API.collaborators.render = function(collabs){
    var source = $("#collaboratorsIndex").html();
    var template = Handlebars.compile(source);
    var context = {collabs: collabs};
    var rendered = template(context);
    viewHandler(rendered);
  }

  API.cv.get = function(url){
    this.render()
  };

  API.cv.render = function(){
    var source = $("#cvIndex").html();
    var template = Handlebars.compile(source);
    var context = {};
    var rendered = template(context);
    viewHandler(rendered);
  };

  API.contact.get = function(url){
    this.render()
  };

  API.contact.render = function(){
    var source = $("#contactIndex").html();
    var template = Handlebars.compile(source);
    var context = {};
    var rendered = template(context);
    viewHandler(rendered);    
  };

  API.articles.get = function(url){
    $.ajax({
      type:"GET",
      url: url
    }).done(this.render.bind(this));
  };

  API.articles.render = function(articles){
    var source = $("#articlesIndex").html();
    var template = Handlebars.compile(source);
    articles = this.format(articles);
    var context = {articles: this.cache};
    var rendered = template(context);
    viewHandler(rendered);
  };

  API.articles.format = function(articles){
    for(var i in articles){
      articles[i].rawParagraphs = articles[i].content.split("\n\n");
      articles[i].paragraphs = [];
      for(var j in articles[i].rawParagraphs){
        articles[i].paragraphs[j] = articles[i].rawParagraphs[j].split("\n");
      };
      articles[i].lead = articles[i].paragraphs[0]
    };
    this.cache = articles
  };

  API.articles.find = function(art_id){
    for(var index in this.cache){
      if(this.cache[index].id === art_id){return this.cache[index]}
    };
  };

  API.articleShow.get = function(url){
    var capture = /articles\/([\d]+)/g;
    // var index = capture.exec(url)[1]
    return capture.exec(url)[1]
    // debugger
  };

  API.articleShow.render = function(article){
    var source = $("#articlesShow").html();
    var template = Handlebars.compile(source);
    var context = article;
    var rendered = template(context);
    viewHandler(rendered);    
  }

  return API
})()
