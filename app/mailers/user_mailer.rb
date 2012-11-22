class UserMailer < ActionMailer::Base
  default from: 'noreply@localhost'
  def comment(comment)
    @comment = comment
    mail(to: comment.post.user.email, subject: "New comment on #{comment.post.title}")
  end
end
