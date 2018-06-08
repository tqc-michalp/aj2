# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable
  has_many :articles, dependent: :destroy
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
