require "rinda/ring"
require "rinda/tuplespace"

DRb.start_service
puts "Starting ring server"
Rinda::RingServer.new(Rinda::TupleSpace.new)
DRb.thread.join