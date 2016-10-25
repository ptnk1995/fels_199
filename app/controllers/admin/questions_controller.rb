class Admin::QuestionsController < AdminController
  before_action :logged_in_user
  before_action :verify_admin_access?
  before_action :load_question, except: [:new, :create, :index]

  def index
    @questions = Question.recent.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @question = Question.new
    @category = Category.all
    @question.answers.build
  end

  def create
    @category = Category.all
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "question_admin.create_success"
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  def edit
    @category = Category.all
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "question_admin.update_success"
      redirect_to admin_questions_path
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "question_admin.destroy_success"
      redirect_to admin_questions_path
    else
      flash[:danger] = t "question_admin.destroy_danger"
      redirect_to admin_root_path
    end
  end

  private
    def question_params
      params.require(:question).permit :content, :pattern, :category_id,
        answers_attributes: [:id, :content, :is_correct, :_destroy]
    end

    def load_question
      @question = Question.find_by id: params[:id]
      if @question.nil?
        flash[:success] = t "question_admin.not_found"
        redirect_to admin_root_path
      end
    end

end
