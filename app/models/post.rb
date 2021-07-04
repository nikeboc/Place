class Post < ApplicationRecord
  belongs_to :user
  # 投稿を消した時に消せるようにするかは後で決める
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user, dependent: :destroy
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: {maximum: 20 }
  validates :price, presence: true, length: {maximum: 10 }
  validates :location, presence: true, length: {maximum: 20 }
  validates :image,   presence: true, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "画像のフォーマットが正しくありません" },
    size:         { less_than: 5.megabytes,
    message: "画像のサイズは５MB以下でお願いします" }


  # ホーム画面用のサイズ
  def home_image
    image.variant(resize_to_limit: [160, 80])
  end

  # 詳細画面用のサイズ
  def display_image
    image.variant(resize_to_limit: [450, 300])
  end
end
