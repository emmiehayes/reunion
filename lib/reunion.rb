require './lib/activity'
require "pry"

class Reunion

  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = {}
  end

  def add_activity(name, cost)
    @activities[name] = cost
  end

  def total_cost
    cost_values = @activities.values
    total_cost = cost_values.sum
  end

  def summarize
    final = @activities.sort
  end

end
