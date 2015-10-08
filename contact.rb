class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self

    def duplicate?(email)
      csv_file = ContactDatabase.new('contacts.csv')
      if csv_file.duplicate?(email) 
        #puts "duplicate"
        true
      end
    end


    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      temp_array = Array.new
      temp_array << name
      temp_array << email

    
      csv_file = ContactDatabase.new('contacts.csv')
      csv_file.add(temp_array)
      id = csv_file.contact_id(temp_array)
      puts "client ID is #{id}"
      

    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      csv_file = ContactDatabase.new('contacts.csv')
      csv_file.find(term)
    end
 
    def all
      # TODO: Return the list of contacts, as is
      csv_file = ContactDatabase.new('contacts.csv')
      csv_file.list
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      csv_file = ContactDatabase.new('contacts.csv')
      csv_file.show(id)
    end
    
  end
 
end