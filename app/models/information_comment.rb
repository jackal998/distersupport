class InformationComment < ApplicationRecord
  validates_presence_of :title , :paragraph

  belongs_to :information
  belongs_to :user
end
