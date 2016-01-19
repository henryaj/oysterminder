require "active_support"
require "beeminder"

class Bee
  def initialize
    @goal_name = ENV.fetch("BEEMINDER_GOAL_SLUG")
    @user = Beeminder::User.new(ENV.fetch("BEEMINDER_API_TOKEN"))
    @goal = Beeminder::Goal.new(user, goal_name)
  end

  def save(params)
    datapoint = Beeminder::Datapoint.new(
      goal: goal,
      value: params.fetch(:value),
      timestamp: params.fetch(:timestamp)
    )
    goal.add(datapoint)
    puts "Posted #{datapoint.inspect} to #{goal_name}"
  end

  private

  attr_reader :user, :goal, :goal_name
end
