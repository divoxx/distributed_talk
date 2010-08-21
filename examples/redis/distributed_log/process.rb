require "rubygems"
require "redis"

redis  = Redis.new(:host => "127.0.0.1", :port => 6379)

redis.lpush("log_queue", Marshal.dump([:info,  
  "Client started"]))
redis.lpush("log_queue", Marshal.dump([:debug, 
  "I think something is wrong"]))
redis.lpush("log_queue", Marshal.dump([:warn,  
  "Oh yeah, watch out!"]))
redis.lpush("log_queue", Marshal.dump([:error, 
  "Something is definitely wrong!!"]))
redis.lpush("log_queue", Marshal.dump([:fatal, 
  "OMG! RUUUNNN!!"]))