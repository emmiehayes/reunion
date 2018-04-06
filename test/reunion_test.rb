require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

    def test_it_exists
      reunion = Reunion.new("Denver")
      assert_instance_of Reunion, reunion
    end

    def test_it_has_attributes
      reunion = Reunion.new("Denver")
      assert_equal "Denver", reunion.location
      assert_equal ({}), reunion.activities
    end

    def test_it_can_add_activity
      reunion = Reunion.new("Denver")
      activity = Activity.new("Hiking", 40)
      reunion.add_activity("Hiking", 40)
      assert_equal ({"Hiking"=>40}), reunion.activities
    end

    def test_it_can_add_more_than_one_activity
      reunion = Reunion.new("Denver")
      activity = Activity.new("Hiking", 40)
      reunion.add_activity("Hiking", 40)
      reunion.add_activity("Swimming", 30)
      reunion.add_activity("Climbing", 40)
      assert_equal ({"Hiking"=>40, "Swimming"=>30, "Climbing"=>40}), reunion.activities

    end

    def test_it_can_calculate_total_cost
      reunion = Reunion.new("Denver")
      activity = Activity.new("Hiking", 40)
      reunion.add_activity("Hiking", 40)
      reunion.add_activity("Swimming", 30)
      reunion.add_activity("Climbing", 40)
      assert_equal 110, reunion.total_cost
    end

    def test_it_can_calculate_summary_of_total_owed
        reunion = Reunion.new("Denver")
        activity = Activity.new("Hiking", 40)
        reunion.add_activity("Hiking", 40)
        reunion.add_activity("Swimming", 30)
        reunion.add_activity("Climbing", 40)

        activity.add_participant("Jordyn", 60)
        activity.add_participant("Erin", 50)
        activity.add_participant("Bridget", 20)
        activity.add_participant("Stephanie", 110)
        assert_equal [["Climbing", 40], ["Hiking", 40], ["Swimming", 30]], reunion.summarize
      end
end
