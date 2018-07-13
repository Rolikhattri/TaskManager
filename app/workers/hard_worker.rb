class HardWorker
  include Sidekiq::Worker

  def perform(type, id, count)
    # Do something
    if type=='start'
      UserMailer.sample_email(id).deliver
    elsif type=='end'
      UserMailer.team_lead_email(id).deliver
    end
  end
end

      
    