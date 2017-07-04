class NotificationMailer < ApplicationMailer
  default from: "no-reply@MilongaYelp.com"

  def comment_added
    mail(to: "murdyn@gmail.com", subject: "A comment has been added to your place")
  end
end
