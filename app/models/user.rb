class User < ActiveRecord::Base
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_by_location(location_query)
    User.where("city ILIKE ?", "#{location_query}")
  end

  def self.location_search(user_ids)
    User.where(id: user_ids)
  end

  def self.search_by_name(last_name_query)
    User.where("last_name ILIKE ?", "#{last_name_query}")
  end

  def self.name_search(user_ids)
    User.where(id: user_ids)
  end
end
