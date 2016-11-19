class Information < ApplicationRecord
  validates_presence_of :title, :paragraph
  validates_inclusion_of :category, :in => ["emergency", "help", "news", "none"], message: "category %{value} is not included in the list"
  belongs_to :user

  has_many :information_comments, :dependent => :destroy
end
