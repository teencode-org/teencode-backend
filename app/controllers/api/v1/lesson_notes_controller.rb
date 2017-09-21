class Api::V1::LessonNotesController < ApplicationController
  def show
    @lesson_note = LessonNote.find_by(id: params[:id])

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
