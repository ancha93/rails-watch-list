class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: 'Bookmark must be unique for a given movie/list couple' }

end
