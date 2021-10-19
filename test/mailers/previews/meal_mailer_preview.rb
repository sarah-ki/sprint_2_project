# Preview all emails at http://localhost:3000/rails/mailers/meal_mailer
class MealMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/meal_mailer/meal_created
  def meal_created
    MealMailer.meal_created
  end

end
