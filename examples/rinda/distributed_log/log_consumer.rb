require "rinda/ring"

DRb.start_service
ring_server = Rinda::RingFinger.primary

service = ring_server.read([:primary_logger, nil, nil, nil])
logger  = service[2]

logger.info "Log Consumer connected"
logger.debug "A debug message here"