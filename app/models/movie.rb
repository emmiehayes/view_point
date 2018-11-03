class Movie < ApplicationRecord
  validates_presence_of :title
  has_many :flags
  has_many :users, through: :flags
end
