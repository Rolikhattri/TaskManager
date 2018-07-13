namespace :my_tasks do
  desc "TODO"
  task task1: :environment do
    target_time = (Time.now + 5.minutes).strftime("%I:%M %p")
    teams = Team.where(:start_time => target_time)
    puts  "start_teams:" + teams.count.to_s
    teams.each do |t|
      HardWorker.perform_async('start', t.id, 1)
    end
  end

  task task2: :environment do
    target_time = (Time.now - 5.minutes).strftime("%I:%M %p")
    teams = Team.where(:end_time => target_time)
     puts  "end_teams:" + teams.count.to_s
    teams.each do |t|
      HardWorker.perform_async('end',t.id, 1)
    end
  end

end
