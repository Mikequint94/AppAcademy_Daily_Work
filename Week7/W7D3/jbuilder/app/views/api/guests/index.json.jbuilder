@guests = @guests.select { |guest| guest.age.between?(40, 50) }

json.array! @guests do |guest|
  json.partial! 'api/guests/guest', guest: guest
end
