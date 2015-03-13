json.array!(@deadlines) do |deadline|
  json.extract! deadline, :id, :title, :completed, :course_id
  json.url deadline_url(deadline, format: :json)
end
