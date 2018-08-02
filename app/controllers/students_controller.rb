class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = set_student
    @active_status = @student.active
  end
  
  def activate
    @student = set_student
    change_status(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
    
    def change_status(student)
      if @student.active == false
        @student.active = true
      else
        @student.active = false
      end
    end
end