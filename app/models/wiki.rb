class Wiki < ApplicationRecord
  after_initialize :set_default_attributes
  
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order(created_at: :desc) }

  searchkick text_start: [:title], suggest: [:title]

  private

  def set_default_attributes
    private ||= false
  end
end
