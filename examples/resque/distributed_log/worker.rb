require "rubygems"
require "resque"
require "singleton"
require "logger"

class LogService
  include Singleton
  
  @queue = :log
  
  def self.perform(level, string)
    self.instance.log(level, string)
  end
  
  def initialize
    @logger = Logger.new(STDOUT)
  end
  
  def log(level, string)
    @logger.send(level, string)
  end
end