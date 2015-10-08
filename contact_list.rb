require_relative 'contact'
require_relative 'contact_database'
require 'pry'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

#puts "Hello! Please type in 'help' for a list of options"
#commaned = gets.chomp


command, option = ARGV 

if command == "help"
  puts "Here is a list of available commands:"
  puts "\tnew - Create a new contact"
  puts "\tlist - List all contacts"
  puts "\tshow - Show a contact"
  puts "\tfind - Find a contact"
elsif command == "new"


  puts "Please enter the email address of the contact"
  email = STDIN.gets.chomp


  if Contact.duplicate?(email) == true
    puts "Sorry! Email already exists!!"
  else
    puts "Please enter the full name of the contact"
    name = STDIN.gets.chomp
    Contact.create(name, email)
  end
elsif command == "list"
  Contact.all
elsif command == "show"
  id = option
  Contact.show(id)
elsif command == "find"
  search_term = option
  Contact.find(search_term)
end





