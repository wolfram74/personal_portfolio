class WelcomeController < ApplicationController
  def index
    if Lock.find_by(property: "admin_pass").updated_at < Date.today()
      AdminMailer.report_key().deliver!
    end
  end
end
