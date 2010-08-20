require "rubygems"
require "redis"
require "logger"

redis  = Redis.new(:host => "127.0.0.1", :port => 6379)
logger = Logger.new(STDOUT)

loop do
  _, data = redis.brpop('log_queue', 0)
  level, string = Marshal.load(data)
  logger.send(level, string)
end
