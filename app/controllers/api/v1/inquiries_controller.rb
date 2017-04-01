class Api::V1::InquiriesController < ApplicationController
  def index
    inquirys = Inquiry.all
    render json: inquirys, status: 200
  end

  def show
    inquiry = Inquiry.find(params[:id])
    render json: inquiry, status: 200
  end

  def create
    inquiry = Inquiry.new(inquiries_params)
    if inquiry.save
      render json: inquiry, status: 201
    else
      render json: { error: 'Inquiry could not be created'}, status: 422
    end
  end

  def update
    inquiry = Inquiry.find(params[:id])
    if inquiry.update_attributes(inquiries_params)
      render json: inquiry, status: 200
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
    params.permit(:phone_number, :email, :message)
  end

  def not_found
    render json: { error: 'Request cannot be completed' }, status: 400
  end
end
