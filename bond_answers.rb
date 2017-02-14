# requiring a local file
require './bond_data.rb'

# accessing the array inside the module
movie = Bond::MOVIE_DATA.first

# puts movie[:title]

def get_gross_for(title, movies)
  # everything returns something
  movie =  movies.find { |movie| movie[:title] == title}
  # the last line is implicitly returned
  parse_gross movie[:gross]
end

def parse_gross(gross)
  gross.gsub(/[$,]/, '').to_f
end

def bond_names(movies)
  movies.map { |movie| movie[:actor] }.uniq
end

def odd_bonds(movies)
  movies.select { |movie| movie[:year].odd? }
end

def worst_grossing_bond(movies)
  movies.min { |a, b| parse_gross(a[:gross]) <=> parse_gross(b[:gross])}
end

def movies_per_actor(movies)
  groups = movies.group_by { |movie| movie[:actor] }
  groups.each { |key, value| groups[key] = value.count }
end

def movies_sorted(movies)
  movies.sort { |a, b| a[:year] <=> b[:year] }
end

puts get_gross_for('Skyfall', Bond::MOVIE_DATA) # => "$1,108,561,008"
puts bond_names(Bond::MOVIE_DATA)
puts odd_bonds(Bond::MOVIE_DATA)
puts worst_grossing_bond(Bond::MOVIE_DATA)
puts movies_per_actor(Bond::MOVIE_DATA)
puts movies_sorted(Bond::MOVIE_DATA)
