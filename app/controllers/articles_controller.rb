# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end
end
