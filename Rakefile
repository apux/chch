require "rake/testtask"

task default: :test

Rake::TestTask.new(:test) do |t|
  t.libs = %w(lib test)
  t.pattern = 'test/**/test_*.rb'
end
