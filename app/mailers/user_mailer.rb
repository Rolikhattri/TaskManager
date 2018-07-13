class UserMailer < ApplicationMailer
  default from: "rlkhattri@gmail.com"

  def sample_email(id)
    emails = Team.find(id).users.collect{ |u| u.email}
    mail(to: emails, subject: 'Test Email')
  end

  def team_lead_email(id)
    emails = Team.find(id).users.where(:team_lead => true).collect{ |u| u.email}
    mail(to: emails, subject: 'Team Lead Email')
  end
end

  



 
  
