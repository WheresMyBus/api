filename = File.join Rails.root, 'data', 'seattle_neighborhoods'

File.readlines(filename).each do |line|
  Neighborhood.create name: line.strip
end
