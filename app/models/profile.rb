class Profile < ApplicationRecord
  belongs_to :user

  enum sex: { 男性: 0, 女性: 1 }
end
