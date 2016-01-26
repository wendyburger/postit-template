class Post < ActiveRecord::Base
  include VoteableWendyJan
  include Sluggable
  PRE_PAGE = 3

  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  default_scope{order("created_at ASC")}


  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true

  sluggable_column :title




end