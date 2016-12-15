class User < ActiveRecord::Base
  has_many :shoes
  has_many :sales
  has_many :purchases, through: :sales, source: :shoe
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :fn, :ln, presence:true, length: {minimum:2}
  validates :email, presence:true, uniqueness: {case_sensitive:false}, format:{with:EMAIL_REGEX}
  # validates :password, {in: 8..20}
end
