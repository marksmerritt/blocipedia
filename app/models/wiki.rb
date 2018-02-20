class Wiki < ApplicationRecord
  after_initialize :set_default_attributes
  belongs_to :user

  default_scope { order(created_at: :desc) }

  private

  def set_default_attributes
    self.private ||= false
  end
end
