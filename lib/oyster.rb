require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'awesome_print'

Capybara.run_server = false
Capybara.current_driver = :poltergeist

class Oyster
  include Capybara::DSL

  def initialize
    @username = ENV.fetch("OYSTER_USERNAME")
    @password = ENV.fetch("OYSTER_PASSWORD")
  end

  def journey_total_from_week_ago
    visit "https://oyster.tfl.gov.uk/oyster/journeyHistory.do"
    # TODO
  end

  private

  attr_reader :username, :password

  def log_in
    visit "https://oyster.tfl.gov.uk/oyster/entry.do"
    fill_in('UserName', :with => username)
    fill_in('Password', :with => password)
    click_button('Sign in')
  end
end

oyster = Oyster.new
oyster.log_in
oyster.get_journey_total_from_week_ago
