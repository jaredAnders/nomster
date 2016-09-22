class NotificationMailer < ActionMailer::Base
  default from: "info@nomstrocity.com"

  def comment_added
    mail(to: "neclacusta@throwam.com",
          subject: "A new comment has been added")
  end

end
