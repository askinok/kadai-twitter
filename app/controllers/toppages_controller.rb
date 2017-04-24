class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasklists= current_user.tasklists.build
      @tasklists= current_user.tasklists.order('created_at DESC').page(params[:page])
    end
  end
end
