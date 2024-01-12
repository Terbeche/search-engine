# db/seeds.rb

# Array of dummy search terms
search_terms = ['test', 'hello', 'world', 'rails', 'ruby', 'programming']

# Array of dummy IP addresses
ip_addresses = ['192.0.2.1', '192.0.2.2', '192.0.2.3', '192.0.2.4', '192.0.2.5']

# Create dummy records
ip_addresses.each do |ip|
  search_terms.each do |term|
    Search.create(term: term, ip: ip)
  end
end
