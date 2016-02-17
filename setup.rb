require 'pry' # in case you want to use binding.pry
require 'active_record'
require_relative 'lib/contact'
require_relative 'lib/contact_list'

# Output messages from Active Record to standard out
# ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contactlist',
  # username: '',
  # password: '',
  # host: 'localhost',
  # port: 5432,
  # pool: 5,
  # encoding: 'unicode',
  # min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

puts 'Setup DONE'
