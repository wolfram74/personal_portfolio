class AdminMailer < ActionMailer::Base
  default from: "steamboot01@gmail.com"

  def report_key
    puts "a thing happened\n"*8
    admin = "phaugen@gmail.com"
    admin_pass = Lock.find_by(property: "admin_pass")
    admin_pass.value = "%x" % rand(10**9)
    admin_pass.save
    @key = admin_pass.value
    mail(to: admin, 
        from: "steamboot01@gmail.com",
        subject: "daily password for portfolio")
  end
end
=begin
steamboot01@gmail.com
squirrel5
=end
