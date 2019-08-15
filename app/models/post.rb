class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments

  scope :alpha, -> { order(:title) }
  scope :most_comments, -> {joins(:comments).group('posts.id').order('count(posts.id) desc')}



  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end


end
