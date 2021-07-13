class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, :RecipeImageUploader

  enum genre: {
    invisible: 0,
    appetizer: 1,
    main: 2,
    dessert: 3,
    drink: 4
  }
end
