class ContactController < ApplicationController
  def index
    Contact.order('name ASC')
    @contacts = Contact.take(10)
    render "contacts"
  end

  def new
    render "new"
  end

  def create
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone_number => params[:contact][:phone_number],
      :email => params[:contact][:email])

    if contact.save
      # Render contact's attributes
      redirect_to("/contacts")
    end
  end

  def show
    @contact = Contact.find(params[:id])

  end

end
