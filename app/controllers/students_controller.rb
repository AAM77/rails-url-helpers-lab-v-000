class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = set_student
    @student.active ? @status = 'active' : @status = 'inactive'
  end
  
  def active
    @student = set_student
    change_status(@student)
    @student.save
    redirect_to student_path(@student)
  end

  #PRIVATE METHODS - available to only this class
  private
  
    #find the student by id
    def set_student
      @student = Student.find(params[:id])
    end
    
    #change the student's status
    def change_status(student)
      !student.active
      student.save
    end
end