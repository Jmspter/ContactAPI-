module Api
  module V1
    class ContactsController < ApplicationController
      def create
        name = params[:name]
        subject = params[:subject]
        message = params[:message]

        ContactMailer.contact_email(name, subject, message).deliver_later

        render json: { status: 'Message sent' }, status: :ok
      end
    end
  end
end
