class Api::V1::LessonNotesController < ApplicationController
  def show
    session = Session.find_by(id: params[:session_id])
    unless session
      return render json: { error: "Invalid session id" }, status: 403
    end

    @lesson_note = session.lesson_notes.find_by(id: params[:id])

    if @lesson_note
      render json: @lesson_note,
             serializer: FacilitatorGuideSerializer,
             root: false,
             status: :ok
    else
      head 404
    end
  end
end
