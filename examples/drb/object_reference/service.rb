require "drb"
require "date"

class User
  include DRbUndumped
  attr_reader :name, :birthdate
  
  def initialize(name, birthdate)
    @name, @birthdate = name, birthdate
  end
end

class Date; include DRbUndumped; end

class Database
  include DRbUndumped
  
  def initialize(users)
    @users = users
  end
  
  def each(&block)
    @users.each(&block)
  end
end

db = Database.new([
  User.new("Rodrigo", Date.civil(1985, 10, 31)),
  User.new("John", Date.civil(1980, 1, 22)),
  User.new("Mary", Date.civil(1990, 5, 4))
])

DRb.start_service("druby://127.0.0.1:61676", db)
DRb.thread.join
