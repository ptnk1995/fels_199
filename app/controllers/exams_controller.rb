class ExamsController < ApplicationController
  def index
  @exam = current_user.exams.new
  @categories = Category.all
  @exams = current_user.exams.page(params[:page])
    .per_page Settings.per_page
  end

  def create
    @exam = current_user.exams.new exam_params
    if @exam.save
      flash[:success] = t "created_exam"
    else
      flash[:danger] = t "fail_created_exam"
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :category_id
  end
end
