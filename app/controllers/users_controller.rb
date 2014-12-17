class UsersController < ApplicationController
  # before_filter :authenticate_user!
  USERS_PER_PAGE = 5

  def index
    scope = User.where.not(confirmed_at: nil)
    @members_count = scope.count
    scope = scope.name_search_for(params[:search]) if params[:search].present?
    @users = scope.order(:last_name).page(params[:page]).per(USERS_PER_PAGE)
    render(partial: @users) if request.xhr?
  end

  def show
    @user = User.find(params[:id])
  end

end
