class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  with_options presence: true do
    validates :name
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :weight_id
  end

  enum sex_id: { 男: 1, 女: 2 }
  # enum climbing_type: { ボルダリング: 1, リードクライミング: 2, トップロープ: 3 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :weight

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_one_attached :image
  has_many :sns_credentials, dependent: :destroy
  has_many :users_climbing_types
  has_many :climbing_types, through: :users_climbing_types

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
        name: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
