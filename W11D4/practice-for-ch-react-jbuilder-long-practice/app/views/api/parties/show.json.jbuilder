json.guests @party.guests do |guest|
  json.id guest.id
  json.name guest.name
  json.age guest.age
end
