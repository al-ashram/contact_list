require_relative 'contact'

Contact.connection

# create new
#==============
# contact = Contact.new('mama', 'mimi', 'mimi@gmail.com')
# contact.save


# updating
#==============
some_contact = Contact.find(35)


# some_contact.firstname = "sarsoor"
# some_contact.lastname = "veggie"
# some_contact.email = "veggie@mail.com"
# some_contact.save



# find by id
#=============
# some_contact = Contact.find(36)
# puts some_contact.firstname
# puts some_contact.lastname
# puts some_contact.email
# puts some_contact.id

#find_by lastname
#==================
# contacts = Contact.find_all_by_lastname('mon')
# contacts.each do |c|
#   puts c
# end

#find_by firstname
#==================
# contacts = Contact.find_all_by_firstname('joe')
# contacts.each do |c|
#   puts c.inspect
# end


#find_by email
#==================
# contact = Contact.find_by_email('sarah@email.com')
# puts contact.inspect


#destroying
#==================
#some_contact.destroy




