class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  # validates :age, presence: true, numericality: {greater_than: 0}
  # validates :gender, presence: true
  # validates :phone_number, presence: true

  has_secure_password

  has_one_attached :avatar

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :responds, dependent: :destroy

  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :following, through: :follower_relationships, source: :followed
  has_many :followers, through: :followed_relationships #, source: :follower

  after_commit :add_default_avatar, on: %i[create update]

  # follow a user
  def follow (other_user)
    following << other_user
  end

  # unfollow a user
  def unfollow (other_user)
    following.delete(other_user)
  end

  # return True if other_user is being followed
  def following? (other_user)
    following.include?(other_user)
  end

  private
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.png'
          )
        ),
        filename: 'default_avatar.png',
        content_type: 'image/png'
      )
    end
  end
end
