class UsersController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + " " + sort_direction).page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
