class UserMailer < ApplicationMailer
  default from: "rlkhattri@gmail.com"

  def sample_email(user)
    
    @user = user
    emails = @user.team.users.collect{ |u| u.email}
    mail(to: emails, subject: 'Sample Email')
  end
end
