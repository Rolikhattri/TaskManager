class UserMailer < ApplicationMailer
  default from: "rlkhattri@gmail.com"

  def sample_email(id)
    emails = Team.find(id).users.collect{ |u| u.email}
    mail(to: emails, subject: 'Test Email')
  end

  def team_lead_email(id)
    emails = Team.find(id).users.where(:team_lead => true).collect{ |u| u.email}
    users = Team.find(id).users
    total_tasks = 0 
    total_complete = 0
    users.each do |u|
        all_tasks = u.tasks.count
        complete_tasks  = u.tasks.where(:status => true).count
        total_tasks = total_tasks + all_tasks
        total_complete = total_complete + complete_tasks
    end
    @percent_complete = (total_complete * 100.0) / total_tasks

    mail(to: emails, subject: 'Team Lead Email')
  end
end

  



 
  
