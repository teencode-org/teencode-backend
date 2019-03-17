class Api::V1::CodeClubController < ApplicationController
  def apply
    result = CreateCodeClubApplication.perform(parent: params['parent'], student: params['student'])
    if result.succeeded?
      success
    else
      not_found(result.reason)
    end
  end

  private

  def not_found(error)
    render json: { error: error }, status: 400
  end

  def success
    render json: { success: 'Application Successful' }, status: 200
  end
end
