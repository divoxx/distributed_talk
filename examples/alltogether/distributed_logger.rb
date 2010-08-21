require "rinda/ring"
require "logger"

class DistributedLogger < Logger
  include DRbUndumped
end

DRb.start_service
ring_server = Rinda::RingFinger.primary

ring_server.write([
  :primary_logger, 
  :DistributedLogger, 
  DistributedLogger.new(STDOUT),
  "The primary logger to be used by all systems"
], Rinda::SimpleRenewer.new)

puts "Distributed logger service started"
DRb.thread.join