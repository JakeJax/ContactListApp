require 'csv'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      store_contacts = []
      CSV.open("./contact.csv", "r") do |file|
        file.readlines.each_with_index do |line, idx|
          store_contacts << line
        end
      end
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      new_entry = Contact.new(name, email)
      CSV.open("./contact.csv", "a") do |csv|
        csv << [name, email]
      end
      new_entry
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.open("./contact.csv", "r") do |contact|
        return contact.readlines[id]
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      search_results = []
      CSV.open("./contact.csv", "r") do |contact|
        contact.readlines.each_with_index do |line, idx|
          line.each do |words_in_list|
            if /#{words_in_list}/.match(term)
              search_results << line
            end
          end
        end
      end
      search_results
    end

  end

end
