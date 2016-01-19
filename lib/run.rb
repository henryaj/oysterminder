require "rufus-scheduler"
require_relative "./beeminder.rb"
require_relative "./oyster.rb"

scheduler = Rufus::Scheduler.new

oyster = Oyster.new
bee = Bee.new

scheduler.cron '5 0 * * *' do
  date = 1.week.ago
  amount = oyster.journey_total_from_week_ago

  # TODO
  bee.save()
end

scheduler.join
