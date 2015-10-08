## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

def initialize(filename)
  @filename = filename
  #@full_array. 
end


def add(array)
  CSV.open(@filename, 'ab') do |file|
      file << array
  end
end

def contact_id(array)
  CSV.read(@filename).index(array).to_i + 1
end

def list
  CSV.foreach(@filename) do |row|
    puts "#{contact_id(row)}: #{row[0]} (#{row[1]})" 
  end
  puts "-------------"
  puts (CSV.read(@filename).length).to_s + " records total"
end

def find (term)
  temp_array = Array.new
  CSV.foreach(@filename) do |row|
    
      row.any? do |element|
        
        if element.include?(term)
          temp_array.push(element)
          puts contact_id(row).to_s + " : " + row.join(" : ")
        end
      end    
    end

puts "SORRY! Term doesn't exist!" if temp_array.length == 0

end

def show(id)
  if id.to_i > CSV.read(@filename).length || id.to_i < 1
    puts "Sorry! Contact with that ID cannot found"
  else
    CSV.foreach(@filename) do |row|
      if contact_id(row) == id.to_i
        puts row[0]
        puts row[1]
      end    
    end
  end
end

def duplicate?(email)
  @value = false
  CSV.foreach(@filename) do |row|
    #puts row.include?(email)
    if row[1] == email
    @value = true
      break
    end
  end
  @value
end

end

