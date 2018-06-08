# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.eager_load(:articles).order(:id)
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    authorize @user
  end

  def create
    @user = User.new(set_params)
    authorize @user
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    authorize @user
    redirect_to users_path if @user.update(set_params)
  end

  def destroy
    authorize @user
    redirect_to users_path if @user.delete
  end

  private

  def set_params
    params.require(:user).permit(:email, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
