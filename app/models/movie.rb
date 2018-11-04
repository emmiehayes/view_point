class Movie < ApplicationRecord
  validates_presence_of :title, :y_id
  has_many :flags, dependent: :destroy
  has_many :users, through: :flags
end
