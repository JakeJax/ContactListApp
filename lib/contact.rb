require 'csv'
require 'pg'
require 'active_record'

# Represents a person in an address book.
class Contact < ActiveRecord::Base

  # Returns an Array of Contacts loaded from the database.
  def self.list
    Contact.all.each do |contact|
      puts "#{contact.id}: #{contact.name}: #{contact.email}"
    end
  end

  def self.contact_create
    puts "Enter Name:"
    new_name = STDIN.gets.chomp
    puts "Enter Email"
    new_email = STDIN.gets.chomp
    puts Contact.create(name: new_name, email: new_email)
  end

  def self.find_with_id
    # binding.pry
    puts "Enter ID:"
    id = STDIN.gets.chomp.to_i
    contact_info = Contact.find(id)
    p contact_info.name
    p contact_info.email
  end

  def self.find_to_update
    # binding.pry
    puts "Enter ID:"
    id = STDIN.gets.chomp.to_i
    contact_info = Contact.find(id)
    p contact_info.name
    p contact_info.email
    puts "Enter new name"
    new_name = STDIN.gets.chomp
    puts "Enter new email"
    new_email = STDIN.gets.chomp
    contact_info.name = new_name
    contact_info.save
    p contact_info.name
    contact_info.email = new_email
    contact_info.save
    p contact_info.email

  end

  def self.search_contacts
    puts "Enter a keyword"
    term = STDIN.gets.chomp
    Contact.where("name LIKE ? OR email LIKE ?", "%#{term}%", "%#{term}%").each do |result|
      p "#{result.name}: #{result.email}"
    end
  end

  def self.find_to_destroy
    # binding.pry
    puts "Enter ID:"
    id = STDIN.gets.chomp.to_i
    contact_info = Contact.find(id)
    puts "Destroying:"
    contact_info = Contact.destroy(id)
    p contact_info.name
    p contact_info.email
  end

end
