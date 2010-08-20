require "rubygems"
require "starling"

starling = Starling.new("127.0.0.1:22222")

starling.set("log_queue", [:info,  "Client started"])
starling.set("log_queue", [:debug, "I think something is wrong"])
starling.set("log_queue", [:warn,  "Oh yeah, watch out!"])
starling.set("log_queue", [:error, "Something is definitely wrong!!"])
starling.set("log_queue", [:fatal, "OMG! RUUUNNN!!"])