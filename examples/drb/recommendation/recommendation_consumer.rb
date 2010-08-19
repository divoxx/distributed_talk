require "drb"

recommendation_srv = DRbObject.new_with_uri("druby://127.0.0.1:61676")
recommendation_srv.compute(10)
p recommendation_srv.retrieve(10)