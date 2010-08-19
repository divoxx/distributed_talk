require "drb"

class RecommendationService
  def initialize
    @store = {}
  end
  
  def compute(uid)
    num = (rand * 1000).ceil
    ids = []
    
    num.times do |i|
      ids << (i * rand * num).ceil
    end
    
    @store["recommendations:#{uid}"] = ids.uniq
  end
  
  def retrieve(uid)
    @store["friends:#{uid}"]
  end
end

DRb.start_service("druby://127.0.0.1:61676", RecommendationService.new)
DRb.thread.join