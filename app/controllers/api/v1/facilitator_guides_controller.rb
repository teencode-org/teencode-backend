class Api::V1::FacilitatorGuidesController < ApplicationController
  def show
    @facilitator_guide = FacilitatorGuide.find_by(id: params[:id])

    if @facilitator_guide
      render json: @facilitator_guide, root: false, status: :ok
    else
      head 404
    end
  end
end
