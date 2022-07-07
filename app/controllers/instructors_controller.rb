class InstructorsController < ApplicationController
  before_action :set_instructor, only: %i[ show update destroy ]

  # GET /instructors
  def index
    @instructors = Instructor.all
    data = ActiveModelSerializers::SerializableResource.new(@instructors)
    render json: { success: true, data: data }
  end

  # GET /instructors/1
  def show
    data = ActiveModelSerializers::SerializableResource.new(@instructor)
    render json: { success: true, data: data }
  end

  # POST /instructors
  def create
    @instructor = Instructor.new(instructor_params)

    if @instructor.save
      render json: @instructor, status: :created, location: @instructor
    else
      render json: @instructor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instructors/1
  def update
    if @instructor.update(instructor_params)
      render json: @instructor
    else
      render json: @instructor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instructors/1
  # def destroy
  #   @instructor.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instructor_params
      params.require(:instructor).permit(:first_name, :middle_name, :last_name, :email)
    end
end
