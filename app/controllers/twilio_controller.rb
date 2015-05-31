require 'twilio-ruby'
class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
      r.Play 'http://linode.rabasa.com/cantina.mp3'
    end
    render_twiml response
  end

  def text
    p "hit route"
    twilio_sid = Figaro.env.twilio_sid
    twilio_token = Figaro.env.twilio_token
    out_num = Figaro.env.twilio_out_num
    in_num = Figaro.env.my_num
    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages.create({from: out_num ,to:in_num, body: 'fartnoises'})
    # response = Twilio::TwiML::Response.new do |r|
    #   r.Sms 'Fart noises', to: "+13193257978"
    # end
    # render_twiml response
  end



end
