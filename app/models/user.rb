class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true,
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,
      allow_blank: true,
      message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }

  attr_accessor :current_password
  validates :password, presence: { if: :current_password }
  
end
