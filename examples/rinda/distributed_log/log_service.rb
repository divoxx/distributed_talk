require "rinda/ring"
require "logger"

DRb.start_service
ring_server = Rinda::RingFinger.primary
ring_server.write([:primary_logger, :Logger, Logger.new(STDOUT), "The primary logger to be used by all systems"], Rinda::SimpleRenewer.new)
DRb.thread.join