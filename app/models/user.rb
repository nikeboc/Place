class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorited_posts, through: :favorites, source: :post, dependent: :destroy
    has_one_attached :image
    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: {maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:30 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 10 }, allow_nil: true
    validates :content, length: {maximum:1000 }
    validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "画像のフォーマットが正しくありません" },
    size:         { less_than: 5.megabytes,
    message: "画像のサイズは５MB以下でお願いします" }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # いいねしてるかどうか
  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end

  # マイページサイズの画像
  def mypage_image
    image.variant(resize_to_limit: [75, 75])
  end

  # # 小サイズの画像
  # def mini_image
  #   image.variant(resize_to_limit: [160, 80])
  # end
end
