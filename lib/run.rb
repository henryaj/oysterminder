require "rufus-scheduler"
require_relative "./beeminder.rb"

scheduler = Rufus::Scheduler.new
bee = Bee.new

scheduler.every '1s' do
end

scheduler.join
