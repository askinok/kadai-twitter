class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasklist= current_user.tasks.build
      @tasklists= current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
end
