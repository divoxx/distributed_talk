require "drb"

DRb.start_service
db = DRbObject.new_with_uri("druby://127.0.0.1:61676")

db.each do |user|
  p user
  puts "Name: #{user.name}, Birthdate: #{user.birthdate}"
end