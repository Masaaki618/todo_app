10.times do |n|
  Task.create!(
    name: "sample task #{n + 1}",
    description: "sample task #{n + 1} の説明",
    user_id: 1
  )
end
