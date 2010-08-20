require "rinda/ring"

DRb.start_service
ring_server = Rinda::RingFinger.primary

service = ring_server.read([:primary_logger, nil, nil, nil])
logger  = service[2]

logger.info  "Client started"
logger.debug "I think I made something wrong, let's investigate"
logger.warn  "Oh yeah, watch out!"
logger.error "Something is definitely wrong!!"
logger.fatal "OMG! RUUUNNN!!"