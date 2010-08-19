require "drb"
require "logger"

DRb.start_service("druby://127.0.0.1:61676", Logger.new(STDOUT))
DRb.thread.join