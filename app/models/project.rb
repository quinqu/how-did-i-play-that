class Project < ApplicationRecord
  has_many :songs
  belongs_to :user
end
