require "rufus-scheduler"
require_relative "./beeminder.rb"
require_relative "./oyster.rb"

scheduler = Rufus::Scheduler.new

oyster = Oyster.new
bee = Bee.new

scheduler.every '1s' do
  require 'pry'; binding.pry

  date = 1.week.ago
  amount = oyster.journey_total_from_week_ago

  # TODO
  bee.save(value: 0, timestamp: DateTime.now)
end

scheduler.join
