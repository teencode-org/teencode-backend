class Api::V1::BlogsController < ApplicationController
  def index
    @blogs = Blog.page(params[:page]).per(params[:per_page])

    if @blogs.empty?
      render json: @blogs, status: 404
    else
      render(
        json: {
          blogs: ActiveModel::ArraySerializer.new(@blogs),
          page_data: page_data
        },
        status: 200,
        root: false
      )
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    if @blog
      render json: @blog
    else
      head 404
    end
  end

  def featured_blogs
    @blogs = Blog.where(featured: true).
             page(params[:page]).per(params[:per_page])
    render(
      json: {
        blogs: ActiveModel::ArraySerializer.new(@blogs),
        page_data: page_data
      },
      status: 200,
      root: false
    )
  end

  private

  def page_data
    {
      current_page: @blogs.current_page,
      records_per_page: @blogs.size,
      total_pages: @blogs.total_pages,
      total_records: @blogs.total_count
    }
  end
end
