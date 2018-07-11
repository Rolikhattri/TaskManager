json.extract! task, :id, :task_name, :user_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
