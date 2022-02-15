# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :name, presence: true, length: { minimum: 5 }
end
