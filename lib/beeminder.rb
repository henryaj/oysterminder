require "active_support"
require "beeminder"

class Bee
  def initialize
    @goal_name = ENV.fetch("BEEMINDER_GOAL_SLUG")
    @bee = Beeminder::User.new(
      ENV.fetch("BEEMINDER_API_TOKEN")
    )
  end

  def save(value)
    bee.send(goal_name, value)
    puts "Posted #{value} to #{goal_name}"
  end

  private

  attr_reader :bee, :goal_name
end
