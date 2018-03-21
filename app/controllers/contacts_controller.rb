class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @q = Contact.ransack(params[:q])
    @q.sorts = 'email_address asc' if @q.sorts.empty?
    @contacts = @q.result
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def email_address_alphabetical_filter
    # Should filter contacts by email address alphabetically.
  end

  def email_com_address_filter
    # Should only display contacts with .com email addresses
  end

  def csv_upload
    Contact.csv_upload(params[:file])
    redirect_to contacts_path, notice: "Contacts Uploaded."
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      # format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      # format.json { head :no_content }
      format.js { render layout: false, locals: { contact: @contact } }
    end
  end

  private
    
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email_address, :phone_number, :company_name)
  end
end
