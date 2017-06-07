class Api::V1::ProgressesController < ApplicationController
  def index
    render json: Progress.first
  end
end
