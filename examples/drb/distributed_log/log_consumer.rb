require "drb"

logger = DRbObject.new_with_uri("druby://127.0.0.1:61676")

logger.info  "Client started"
logger.debug "I think I made something wrong, let's investigate"
logger.warn  "Oh yeah, watch out!"
logger.error "Something is definitely wrong!!"
logger.fatal "OMG! RUUUNNN!!"

