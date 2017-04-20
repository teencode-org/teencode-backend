class Api::V1::SessionsController < ApplicationController
  def index
    sessions = Session.all
    if sessions.empty?
      head 404
    else
      render json: Session.all, root: false
    end
  end
end
