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
end
