class Information < ApplicationRecord
  belongs_to :user

  has_many :information_comments
end
