require "rubygems"
require "sinatra"
require "resque"
require "mail_sender"
require "mail"

set :views, File.dirname(__FILE__) + '/templates'

get "/" do
  @mail = Mail.new
  erb :index
end

post "/" do
  Resque.enqueue(MailSender, params[:email])
end