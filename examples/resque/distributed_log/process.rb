require "rubygems"
require "resque"
require "worker"

Resque.enqueue(LogService, "info",  "Client started")
Resque.enqueue(LogService, "debug", "I think something is wrong")
Resque.enqueue(LogService, "warn",  "Oh yeah, watch out!")
Resque.enqueue(LogService, "error", "Something is definitely wrong!!")
Resque.enqueue(LogService, "fatal", "OMG! RUUUNNN!!")
