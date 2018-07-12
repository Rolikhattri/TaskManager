class HardWorker
  include Sidekiq::Worker

  def perform(id,count)
    # Do something
    UserMailer.sample_email(id).deliver
  end
end

      
    