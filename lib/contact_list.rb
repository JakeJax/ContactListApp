require_relative 'contact'
require 'pry'
# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class Contactlist

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
    puts "update - Update name or email"
    puts "destroy - Remove contact by ID"

    choice = gets.chomp

    case choice
    when "list"
      Contact.list
    when "new"
      Contact.contact_create
    when "show"
      Contact.find_with_id
    when "search"
      Contact.search_contacts
    when "update"
      Contact.find_to_update
    when "destroy"
      Contact.find_to_destroy
    end
  end
end


