class User < ActiveRecord::Base
  has_attached_file :picture,
    default_url: "/images/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.location_search(location_query)
    User.where("city ILIKE ?", "#{location_query}")
  end

  def self.name_search(last_name_query)
    User.where("last_name ILIKE ?", "#{last_name_query}")
  end
end
