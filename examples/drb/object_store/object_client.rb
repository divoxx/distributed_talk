require "drb"
require "date"

class User
  attr_accessor :name, :birthdate
  
  def initialize(name, birthdate)
    @name, @birthdate = name, birthdate
  end
end

store = DRbObject.new_with_uri("druby://127.0.0.1:61676")

user = User.new("Rodrigo", Date.civil(1985,10,31))
p user

store.set("rodrigo", user)
p store.get("rodrigo")