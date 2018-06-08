# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  private

  def after_sign_in_path_for(_resource)
    users_path
  end
end
