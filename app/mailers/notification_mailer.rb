class NotificationMailer < ActionMailer::Base
  default from: "info@nomstrocity.com"

  def comment_added(comment)
    @place = comment.place
    @owner = @place.user

    mail(to: @owner.email,
          subject: "A new comment has been added to #{@place.name}")
  end

end
