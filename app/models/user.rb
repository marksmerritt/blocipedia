class User < ApplicationRecord
  after_initialize :set_defaults

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

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

  def set_defaults
    self.role ||= "standard" 
  end
end
