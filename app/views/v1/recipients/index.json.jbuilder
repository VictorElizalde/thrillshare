json.recipients @recipients do |recipient|
  json.id recipient.id
  json.name recipient.name
  json.adress recipient.address
  json.school_id recipient.school.id
  json.created_at recipient.created_at
  json.updated_at recipient.updated_at
end
