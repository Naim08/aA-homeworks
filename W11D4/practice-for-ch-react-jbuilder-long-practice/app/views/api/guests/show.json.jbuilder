json.name @guest.name
json.age @guest.age
json.gifts @guest.gifts do |gift|
  json.id gift.id
  json.title gift.title
  json.description gift.description
end
