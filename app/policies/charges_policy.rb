class ChargesPolicy < ApplicationPolicy
  def create?
    user.present? && user.standard?
  end

  def new?
    create?
  end
end