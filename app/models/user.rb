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

  def self.location_search(location_query)
    user_ids = User.where("city ILIKE ?", "#{location_query}")
    User.id_search(user_ids)
  end

  def self.name_search(last_name_query)
    user_ids = User.where("last_name ILIKE ?", "#{last_name_query}").pluck(:id)
    User.id_search(user_ids)
  end

  private

  def self.id_search(ids)
    User.where(id: ids)
  end
end
