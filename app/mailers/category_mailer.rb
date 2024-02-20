class CategoryMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def info_email(user)
    @user = user 
    @category = Category.last
    mail(to: @user.email, subject: "New category created")
  end 
end