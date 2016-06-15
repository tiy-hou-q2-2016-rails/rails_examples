require 'csv'

class ContactsController < ApplicationController
  class Contact
    attr_accessor :id, :first_name, :last_name, :email, :photo

    def initialize(id, first, last, email, photo)
      @id = id
      @first_name = first
      @last_name = last
      @email = email
      @photo = photo
    end

    def full_name
      [@first_name, @last_name].join(' ').titlecase
    end
    end

  def list
    @contacts = fetch_contacts
  end

  def detail
    @contacts = fetch_contacts

    @contact = @contacts.find { |c| c.id == params[:id] }
  end

  def edit
    @contacts = fetch_contacts

    @contact = @contacts.find { |c| c.id == params[:id] }
  end

  def fetch_contacts
    contacts = []

    CSV.foreach("#{Rails.root}/customers.csv", headers: true) do |row|
      the_hash = row.to_hash
      id       = the_hash['id']
      first    = the_hash['first_name']
      last     = the_hash['last_name']
      email    = the_hash['email']
      photo    = "https://randomuser.me/api/portraits/med/#{%w(men women).sample}/#{id}.jpg"
      contact  = Contact.new id, first, last, email, photo
      contacts << contact
    end

    contacts

    # jwo = Contact.new "jesse", "yolo", "jesse@example.com"
    # dorton = Contact.new "brian", "batana", "brian.dorton@example.com"
    # matt = Contact.new "Matt", "kuju", "matt@example.com"
    #
    # return [
    #   jwo,
    #   dorton,
    #   matt,
    # ]
  end
end
