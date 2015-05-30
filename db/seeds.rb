# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
projects = [
  # {title:"" ,description:"",file_name:""},
  # {title:"" ,description:"",file_name:""},
  # {title:"" ,description:"",file_name:""},
  # {title:"" ,description:"",file_name:""},
  # {title:"" ,description:"",file_name:""},
  {title:"Perfect Shuffle" ,
    description:"A Perfect Shuffle, also known as a Faro Shuffle is actually super predictable, and this little javascript toy demonstrates it while occasionally quite pleasing patterns.",
    file_name:"perfect_shuffle"},
  {title:"Speckled Moths" ,
    description:"An interactive simulation built with the intent of exercising good OOJS techniques, click on Moths to make Predators that eat moths and see how the population changes over time.",
    file_name:"moths"},
  {title:"Mandelbrot Explorer" ,
    description:"A little app exploring the canvas manipulation methods to draw and explore the mandelbrot set.",
    file_name:"mandelbrot"},
  {title:"Spectrogram" ,
    description:"Taking advantage of the powerful WebAudio API, if you give access to your mic, this can generate a live audio spectrogram of your surroundings, best performance on chrome.",
    file_name:"spectrogram"}
]
projects.each do |proj|
  Project.create(proj)
end

collaborators = [
  # {name:"", email: "",url:"", description:"" },
  # {name:"", email: "",url:"", description:"" },
  # {name:"", email: "",url:"", description:"" },
  # {name:"", email: "",url:"", description:"" },
  {name:"Tobias Merkle", email: "tgamerkle@gmail.com", url:"", description:"A writer with an exceptionally broad talent base, fluent in Chinese, background in linquistics and rudiments of programming." },
  {name:"Paul Hlebowitsh", email: "phleb@mit.edu",url:"", description:"An electrical engineer with loads of experience and strong mathematical background" },
  {name:"Soren Peterson", email: "soren468@gmail.com",url:"http://www.otterhive.com", description:"An up and coming full stack developer with an intense emphasis on solid programming foundations" }
]

collaborators.each do |proj|
  Collaborator.create(proj)
end

articles = [
  {title:"test article 1", subtitle:"a handful of vespers",content:"this is a test of the emergency broadcast system.

    If this had not been a test instructions would have accompanied this announcement."},
  {title:"test article 2", subtitle:"a modest proposal",content:"This limerick goes in reverse
unless I'm remiss
the neat thing is this:
if you start from the bottom-most verse
this limerick's not any worse.

lets see if line insertions as well paragraph testing works. <a href='http://www.smbc-comics.com/?id=3201#comic'>source</a> link insertion!"}
]
articles.each do |artic|
  Article.create(artic)
end
