class MoviePolicy < ApplicationPolicy
  def update?
    user == record.user
  end
end
