class Profile < ApplicationRecord
  belongs_to :user

  enum sex: { male: 0, female: 1 }
end
