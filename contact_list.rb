require 'pry'
require 'active_record'
require_relative 'lib/contact'


ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database...'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact_list',
  username: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
  )
puts "CONNECTED"


command, option = ARGV 

if command == "help"
  puts "Here is a list of available commands:"
  puts "\tnew - Create a new contact"
  puts "\tlist - List all contacts"
  puts "\tshow - Show a contact"
  puts "\tfind - Find a contact"
elsif command == "new"
  puts "Please enter the first name of the contact"
  first_name = STDIN.gets.chomp

  puts "Please enter the last name of the contact"
  last_name = STDIN.gets.chomp

  puts "Please enter the email address of the contact"
  email = STDIN.gets.chomp

  new_contact = Contact.create(firstname: first_name, lastname: last_name, email: email)
  puts new_contact.errors.full_messages
elsif command == "list"
  contacts = Contact.all
  contacts.each do |contact|
    puts contact.attributes 
  end
elsif command == "show"
  id = option.to_i
  contact = Contact.find(id)
  puts contact.attributes 
elsif command == "find"
  search_term = option
  contacts = Contact.where('firstname = ? OR lastname = ?', search_term, search_term)
  contacts.each do |contact|
    puts contact.attributes 
  end
end





