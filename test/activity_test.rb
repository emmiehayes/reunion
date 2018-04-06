require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Hiking", 40)
    assert_instance_of Activity, activity
  end

  def test_it_has_attributes
    activity = Activity.new("Hiking", 40)
    assert_equal "Hiking", activity.name
    assert_equal Hash.new, activity.participants
  end

  def test_it_can_add_participant
    activity = Activity.new("Hiking", 40)
    activity.add_participant("Erin", 20)
    assert_equal ({"Erin" => 20}), activity.participants
  end

  def test_it_can_add_more_than_one_participant
    activity = Activity.new("Hiking", 40)
    activity.add_participant("Erin", 20)
    activity.add_participant("Jordyn", 20)
    assert_equal ({"Erin" => 20, "Jordyn" => 20}), activity.participants
  end

  def test_total_cost_can_be_evaluated
    activity = Activity.new("Hiking", 40)
    assert_equal 40, activity.cost
  end

  def test_cost_can_be_split_based_on_participants
    activity = Activity.new("Hiking", 40)
    activity.add_participant("Jordyn", 10)
    activity.add_participant("Erin", 10)
    activity.add_participant("Bridget", 10)
    activity.add_participant("Stephanie", 10)
    assert_equal 10, activity.cost_per_person(40)
  end

  def test_can_calculate_refunds
    activity = Activity.new("Hiking", 40)
    activity.add_participant("Jordyn", 15)
    activity.add_participant("Bridget", 5)
    activity.add_participant("Stephanie", 10)
    activity.add_participant("Erin", 22)
    #if participant paid too much, they are owed money, number will be negative
    expected = ({"Jordyn"=>-5, "Bridget"=>5, "Stephanie"=>0, "Erin"=>-12})
    assert_equal expected, activity.calculate_debts_and_refunds
  end
end
