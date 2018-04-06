require 'pry'
class Activity

attr_reader :name,
            :cost,
            :participants

  def initialize(name, cost)
    @name = name
    @cost = cost
    @participants = {}
  end

  def add_participant(person, paid)
    @participants.store(person, paid)
  end

  def number_of_participants
    @participants.length
  end

  def cost_per_person(cost)
    @cost / number_of_participants
  end

  def calculate_debts_and_refunds
    total = {}
    @participants.keep_if do |name, paid|
      amount = cost_per_person(cost)-paid
      total[name] = amount
    end
    total
  end
end
