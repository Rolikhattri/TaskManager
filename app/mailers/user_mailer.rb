class UserMailer < ApplicationMailer
  default from: "rlkhattri@gmail.com"

  def sample_email(id)
    emails = Team.find(id).users.collect{ |u| u.email}
    mail(to: emails, subject: 'Sample Email')
  end
end

  



 
  
