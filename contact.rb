require 'csv'
require 'pg'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email



  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  def save
      if self.id
        # => update the record
        res = self.class.conn.exec_params('
        UPDATE contacts SET 
        name = $1, email = $2 
        WHERE id = $3::int RETURNING *
      ', [self.name, self.email, self.id])
      else
        # => insert a new record
        self.class.conn.exec_params("
          INSERT INTO contacts (name, email) 
          VALUES($1, $2) RETURNING *", [self.name, self.email])

        id = res.first["id"]
      end
    end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    def conn
      PG::Connection.open(host: 'localhost', dbname: 'contactlist', user: 'development', password: 'development')
    end

    def instantiate_contact_from_list(update_info)
      contact = Contact.find(update_info[:id])
      contact.name =  update_info[:name]
      contact.email = update_info[:email]
      contact.save
    end

    # Returns an Array of Contacts loaded from the database.
    def all
      res = conn.exec_params('SELECT * FROM contacts')
      puts res.to_a
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      contact = Contact.new(name, email)
      contact.save
      contact
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      res = conn.exec_params('SELECT * FROM contacts WHERE id = $1::int',[id])
      puts res.to_a
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      puts term
      res = conn.exec_params('SELECT * FROM contacts WHERE name LIKE $1 OR email LIKE $1',['%' + term + '%'])
      puts res.to_a
    end

  end

end
