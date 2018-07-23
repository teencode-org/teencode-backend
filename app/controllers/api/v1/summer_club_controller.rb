class Api::V1::SummerClubController < ApplicationController
  def apply
    result = CreateSummerClubApplication.perform(parent: params['parent'], children: params['children'])
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
