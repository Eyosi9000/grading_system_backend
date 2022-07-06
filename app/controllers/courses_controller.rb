class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]

  # GET /courses
  def index
    @courses = Course.all
    data = ActiveModelSerializers::SerializableResource.new(@courses)
    render json: { success: true, data: data }
  end

  # GET /courses/1
  def show
    data = ActiveModelSerializers::SerializableResource.new(@course)
    render json: { success: true, data: data }
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :course_description, :credit_hour, :submission)
    end
end
