require "service_locator"

class Mail
  def initialize(opts = {})
    # Creates a hash with indifferent access (Symbol or String)
    opts = Hash.new {|hash,key| hash[key.to_s] if Symbol === key }.merge(opts)
    
    @recipient = opts[:recipient]
    @subject   = opts[:subject]
    @body      = opts[:body]
    @logger    = ServiceLocator.locate(:primary_logger)
  end
  
  def send
    @logger.info "[Mail] Sending email \"#{@subject}\" to \"#{@recipient}\""
  end
end