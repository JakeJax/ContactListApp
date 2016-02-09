require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  def initialize
    puts "Contact List booting..."
  end
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  def list_options
    puts "Here is a list of available commands:"
    puts "new    - Create a new contact"
    puts "list   - List all contacts"
    puts "show   - Show a contact"
    puts "search - Search contacts"

    choice = gets.chomp

    case choice
    when "list"
      puts Contact.all
    when "new"
      puts "Enter Name:"
      new_name = gets.chomp
      puts "Enter Email"
      new_email = gets.chomp
      puts Contact.create(new_name, new_email)
    when "show"
      puts "Enter ID:"
      id = gets.chomp.to_i
      puts Contact.find(id)
    end
  end
end

run = ContactList.new
run.list_options
