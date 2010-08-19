require "rinda/ring"

DRb.start_service
ring_server = Rinda::RingFinger.primary

service = ring_server.read([:primary_logger, nil, nil, nil])
logger  = service[2]

loop do
  print ">> "
  level, string = gets.chomp.split(/:/)
  logger.send(level, string)
end