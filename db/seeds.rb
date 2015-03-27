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
  # {title:"" ,description:"",file_name:""},
  # {title:"" ,description:"",file_name:""},
  {title:"Mandelbrot Explorer" ,description:"A little app exploring the canvas manipulation methods to draw and explore the mandelbrot set.",file_name:"mandelbrot"},
  {title:"Spectrogram" ,description:"Taking advantage of the powerful WebAudio API, if you give access to your mic, this can generate a live audio spectrogram of your surroundings, best performance on chrome.",file_name:"spectrogram"}
]
projects.each do |proj|
  Project.create(proj)
end