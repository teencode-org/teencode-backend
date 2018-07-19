class Api::V1::ApplicantsController < ApplicationController
  def index
    applicants = Applicant.all
    render json: applicants, status: 200
  end

  def show
    applicant = Applicant.find(params[:id])
    render json: applicant, status: 200
  end

  def create
    create_applicant = CreateApplicant.new(applicants_params)
    if create_applicant.save
      render json: create_applicant.applicant, status: 201
    else
      render json: { error: 'Applicant could not be created' }, status: 422
    end
  end

  def update
    applicant = Applicant.find(params[:id])
    if applicant.update_attributes(applicants_params)
      render json: applicant, status: 200
    else
      render json: { error: 'Applicant could not be created' }, status: 422
    end
  end

  def destroy
    applicant = Applicant.find(params[:id])
    applicant.destroy
    render json: { success: 'Applicant deleted successfully' }, status: 200
  end

  private

  def applicants_params
    params.permit(:name, :profession, :reason_for_applying, :phone_number, :email)
  end

  def not_found
    render json: { error: 'Request cannot be completed' }, status: 400
  end
end
