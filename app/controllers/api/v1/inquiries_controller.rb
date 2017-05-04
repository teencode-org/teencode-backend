class Api::V1::InquiriesController < ApplicationController
  def index
    inquirys = Inquiry.all
    render json: inquirys, status: 200
  end

  def show
    inquiry = Inquiry.find(params[:id])
    render json: inquiry, status: 200, root: false
  end

  def create
    create_inquiry = CreateInquiry.new(inquiries_params)
    if create_inquiry.save
      render json: create_inquiry.inquiry, status: 201, root: false
    else
      render json: { errors: create_inquiry.errors}, status: 422
    end
  end

  def update
    inquiry = Inquiry.find(params[:id])
    if inquiry.update_attributes(inquiries_params)
      render json: inquiry, status: 200, root: false
    else
      render json: { error: 'Inquiry could not be created'}, status: 422
    end
  end

  def destroy
    inquiry = Inquiry.find(params[:id])
    inquiry.destroy
    render json: { success: 'Inquiry deleted successfully' }, status: 200
  end


  private

  def inquiries_params
    params.permit(:phone_number, :email, :message, :name)
  end

  def not_found
    render json: { error: 'Request cannot be completed' }, status: 400
  end
end
