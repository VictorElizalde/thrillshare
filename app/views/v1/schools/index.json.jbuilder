json.schools @schools do |school|
  json.id school.id
  json.name school.name
  json.adress school.address
  json.created_at school.created_at
  json.updated_at school.updated_at
end
