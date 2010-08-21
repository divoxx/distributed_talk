class WordCounter
  def self.map(lines)
    counts = []
    lines.each do |line|
      line.scan(/\w+/).each do |word|
        counts << [word.downcase.strip, 1]
      end
    end
    counts
  end
  
  def self.reduce(counts)
    totals = Hash.new(0)
    counts.each do |word, count|
      totals[word] += count
    end
    totals
  end
end