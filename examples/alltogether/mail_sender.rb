require "rubygems"
require "resque"
require "service_locator"
require "mail"

class MailSender
  @queue = :mail
  
  def self.perform(mail_data)
    ServiceLocator.locate(:primary_logger).info "[MailSender] Async sending email"
    mail = Mail.new(mail_data)
    mail.send
  end
end