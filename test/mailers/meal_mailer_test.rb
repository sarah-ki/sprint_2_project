require "test_helper"

class MealMailerTest < ActionMailer::TestCase
  test "meal_created" do
    mail = MealMailer.meal_created
    assert_equal "Meal created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
