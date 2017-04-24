class TasklistsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @tasklists = Tasklist.all.page(params[:page]).per(3)
  end

  def show
     set_tasklist
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = current_user.tasklists.build(tasklist_params)
    if @tasklist.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      @tasklists = current_user.tasklists.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    set_tasklist
  end

  def update
    set_tasklist

    if @tasklist.update(tasklist_params)
      flash[:success] = 'Tasklist は正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist は更新されませんでした'
      render :edit
    end
  end

  def destroy
    set_tasklist
    @tasklist.destroy

    flash[:success] = 'Tasklist は正常に削除されました'
    redirect_to tasklists_url
  end

  private


  def tasklist_params
    params.require(:tasklist).permit(:content, :status)
  end
  
  def set_tasklist
    @tasklist = Tasklist.find(params[:id])
  end


  def correct_user
    @tasklist = current_user.tasklists.find_by(id: params[:id])
    unless @tasklist
      redirect_to root_path
    end
  end

end
