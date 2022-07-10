class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show update destroy ]

  # GET /students
  def index
    @students = Student.all
    data = ActiveModelSerializers::SerializableResource.new(@students)
    render json: { success: true, data: data }
  end

  # GET /students/1
  def show
    data = ActiveModelSerializers::SerializableResource.new(@student)
    render json: { success: true, data: data }
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # def destroy
  #   @student.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :middle_name, :last_name, :email, :class_room_id, :grade)
    end
end
