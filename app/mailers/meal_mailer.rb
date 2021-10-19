class MealMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meal_mailer.meal_created.subject
  #
  def meal_created
    @greeting = "Hi"
    @title = params[:new_title]

    mail to: User.all.pluck(:email), subject: "New Meal option added!"
  end
end
