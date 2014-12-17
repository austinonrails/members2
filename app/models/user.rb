class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, length: { maximum: 500 }

  scope :name_search_for, ->(text) {
    # where("first_name ILIKE '#{text}%' OR last_name ILIKE '#{text}%' OR email ILIKE '#{text}%'")
    where("first_name ILIKE '#{text}%' OR last_name ILIKE '#{text}%'").
      where.not(confirmed_at: nil)
  }


  def name
    [first_name, last_name].join(' ').strip
  end

  def twitter_url
    return nil unless twitter_handle.present?
    handle = twitter_handle.gsub('@','')
    "https://twitter.com/#{handle}"
  end

  def aor_join_date
    self.try(:joined_aor_on) || self.created_at.to_date
  end


end
