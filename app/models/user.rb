class User < ApplicationRecord
  after_initialize :set_default_attributes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  def admin?
    role == "admin"
  end

  def standard?
    role == "standard"
  end

  def premium?
    role == "premium"
  end

  private 

  def set_default_attributes
    self.role ||= "standard" 
  end
end
