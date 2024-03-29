class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    return unless @contact.invalid?

    flash.now[:alert] = @contact.errors.full_messages.join(', ')
    render :new
  end

  # 非同期通信でも必要なのか
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_contacts_path
    else
      flash.now[:alert] = @contact.errors.full_messages.join(', ')
      render :new
    end
  end

  def done; end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
