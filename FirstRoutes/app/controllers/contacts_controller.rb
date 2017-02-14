class ContactsController < ApplicationController
  def index
    if params[:user_id]
      @contacts = Contact.find_by(user_id: params[:user_id])
    else
      @contacts = Contact.all
    end
    render json: @contacts
  end

  def create
    @contacts = Contact.new(contact_params)
    if @contacts.save
      render json: @contacts
    else
      render json: @contacts.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contacts = Contact.find(params[:id])
    if @contacts
      render json: @contacts
    else
      render json: @contacts.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @contacts = Contact.find(params[:id])
    if @contacts.update(contact_params)
      render json: @contacts
    else
      render json: @contacts.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contacts = Contact.find(params[:id])
    if @contacts.destroy
      render json: @contacts
    else
      render json: @contacts.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :user_id, :email)
  end
end
