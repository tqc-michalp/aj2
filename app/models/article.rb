# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user, counter_cache: true
end
