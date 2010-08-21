require "rubygems"
require "skynet"
require "word_counter"
require "pp"

job = Skynet::Job.new(
  :mappers          => 8,
  :reducers         => 1, 
  :map_reduce_class => WordCounter, 
  :map_data         => File.readlines("text.txt")
)
pp job.run