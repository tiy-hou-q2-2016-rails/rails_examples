class ContactsController < ApplicationController

  class Contact
    attr_accessor :first_name, :last_name, :email

    def initialize(first, last, email)
      @first_name = first
      @last_name = last
      @email = email
    end

    def full_name
      [@first_name, @last_name].join(" ").titlecase
    end

    def id
      full_name.parameterize
    end
  end

  def list
    @contacts = fetch_contacts
  end

  def detail
    @contacts = fetch_contacts

    @contact = @contacts.find {|c| c.id == params[:id]}
  end

  def edit
    @contacts = fetch_contacts

    @contact = @contacts.find {|c| c.id == params[:id]}
  end

  def fetch_contacts
    jwo = Contact.new "jesse", "yolo", "jesse@example.com"
    dorton = Contact.new "brian", "batana", "brian.dorton@example.com"
    matt = Contact.new "Matt", "kuju", "matt@example.com"

    return [
      jwo,
      dorton,
      matt,
    ]
  end

end
