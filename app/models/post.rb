class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, depemdent: :destroy

  with_options presence: true do
    validates :title
    validates :material
    validates :recipe
    validates :genre
  end

  mount_uploader :image, RecipeImageUploader
  mount_uploader :video, VideoUploader

  enum genre: {
    invisible: 0,
    appetizer: 1,
    main: 2,
    dessert: 3,
    drink: 4
  }

  def self.genre_classification(genre)
    case genre
    when nil
      order(id: :DESC)
    when "invisible"
      where(genre: :invisible).order(id: :DESC)
    when "appetizer"
      where(genre: :appetizer).order(id: :DESC)
    when "main"
      where(genre: :main).order(id: :DESC)
    when "dessert"
      where(genre: :dessert).order(id: :DESC)
    when "drink"
      where(genre: :drink).order(id: :DESC)
    end
  end
end
