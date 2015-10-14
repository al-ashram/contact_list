require 'pg'

class Contact

attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
  end

  class << self 
    def connection 
      #puts 'Connecting to the database!!'
      @@connection = PG.connect(
        host: 'localhost',
        dbname: 'contact_list',
        user: 'development',
        password: 'development')
    end

    def find(id)
      #return a Contact instance!
      result = @@connection.exec("SELECT * from CONTACTS WHERE id = #{id};")
      firstname = result[0]['firstname']
      lastname = result[0]['lastname']
      email = result[0]['email']
      id = result[0]['id']
      
      new_object = Contact.new(firstname, lastname, email)
      new_object.id = id
      return new_object
    end

    def find_all_by_lastname(name)
      #exact string match, if none => []
      result = @@connection.exec("SELECT * from CONTACTS WHERE lastname = '#{name}';")
    end

    def find_all_by_firstname(name)
      #exact string match, if none => []
      result = @@connection.exec("SELECT * from CONTACTS WHERE firstname = '#{name}';")
    end

    def find_by_email(email)
      #exact string match, if none => nil 
      result = @@connection.exec("SELECT * from CONTACTS WHERE email = '#{email}';")
      if result.num_tuples() == 0
        nil
      else
        result[0]
      end
    end
  end

  def check_id
    @@connection.exec("SELECT id FROM contacts \
                    WHERE firstname ='#{@firstname}' AND lastname = '#{@lastname}' AND email ='#{@email}';")
  end

  def save
    result = @@connection.exec("SELECT * FROM contacts \
                    WHERE firstname ='#{@firstname}' AND lastname = '#{@lastname}' AND email ='#{@email}';")

    
    if self.id != nil
        puts "UPDATED EXISTING CONTACT!"
        @@connection.exec("UPDATE contacts  SET firstname ='#{@firstname}',\
                     lastname = '#{@lastname}', email ='#{@email}' WHERE id=#{self.id};")

    else
      if result.num_tuples() == 0
        puts "NEW CONTACT SAVED!"
        @@connection.exec("INSERT INTO contacts (firstname, lastname,email) \
                      VALUES ('#{@firstname}', '#{@lastname}', '#{@email}');")
        result = check_id
      else
        puts "SORRY! contact already exists!"
      end
      @id = result.getvalue(0,0)
    end
  end

  def destroy
    #DELETE
    @@connection.exec("DELETE FROM contacts WHERE id = #{@id};")
  end

end


