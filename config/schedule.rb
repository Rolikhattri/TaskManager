# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"
#
every 1.minute do
  rake 'my_tasks:task1'
  command "echo 'test'"
  rake 'my_tasks:task2'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
