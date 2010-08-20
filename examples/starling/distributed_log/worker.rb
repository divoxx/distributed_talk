require "rubygems"
require "starling"
require "logger"

starling = Starling.new("127.0.0.1:22222")
logger   = Logger.new(STDOUT)

loop do
  level, string = starling.get('log_queue')
  logger.send(level, string)
end
  