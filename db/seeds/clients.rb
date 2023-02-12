first_names = %w[John Jane Jim Sally Tom Kim Mike Emily David Nancy]

last_names = %w[Doe Smith Johnson Wilson Brown Davis Clark Martinez Anderson
                Taylor]

names = []
100.times do |i|
  names << "#{first_names[i % first_names.length]} #{last_names[i % last_names.length]}"
end

100.times do |i|
  Client.create(name: names[i % names.length], tel: "555-555-#{format('%04d', i + 1)}")
end
