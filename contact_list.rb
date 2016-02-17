require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  def initialize
    puts "Contact List booting..."
  end
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  def contact_create
    puts "Enter Name:"
    new_name = STDIN.gets.chomp
    puts "Enter Email"
    new_email = STDIN.gets.chomp
    puts Contact.create(new_name, new_email)
  end

  def find_with_id
    puts "Enter ID:"
    id = STDIN.gets.chomp
    puts Contact.find(id)
  end

  def find_to_update
    puts "Enter ID:"
    id = STDIN.gets.chomp
    puts Contact.find(id)
    update_info = {}
    update_info[:id] = id
    puts "New Name:"
    new_name = STDIN.gets.chomp
    update_info[:name] = new_name
    puts "New Email:"
    new_email = STDIN.gets.chomp
    update_info[:email] = new_email
    Contact.instantiate_contact_from_list(update_info)
  end


  def list_options
    puts "Here is a list of available commands:"
    puts "new    - Create a new contact"
    puts "list   - List all contacts"
    puts "show   - Show a contact"
    puts "search - Search contacts"
    puts "update - Update name or email"

    choice = gets.chomp

    case choice
    when "list"
      puts Contact.all
    when "new"
      contact_create
    when "show"
      find_with_id
    when "search"
      puts "Enter a keyword"
      term = STDIN.gets.chomp
      puts Contact.search(term)
    when "update"
      find_to_update
    end
  end
end

run = ContactList.new
run.list_options
