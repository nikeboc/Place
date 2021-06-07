class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, presence: true, length: {maximum: 20 }
  validates :price, presence: true, length: {maximum: 10 }
  validates :location, presence: true, length: {maximum: 10 }
  validates :image,   presence: true, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "画像のフォーマットが正しくありません" },
    size:         { less_than: 5.megabytes,
    message: "画像のサイズは５MB以下でお願いします" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [450, 300])
  end
end
