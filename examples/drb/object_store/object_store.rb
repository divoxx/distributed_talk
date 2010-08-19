require "drb"

class ObjectStore
  def initialize
    @store = {}
  end
  
  def set(key, object)
    @store[key] = object
  end
  
  def get(key)
    @store[key]
  end
end

DRb.start_service("druby://127.0.0.1:61676", ObjectStore.new)
DRb.thread.join
  