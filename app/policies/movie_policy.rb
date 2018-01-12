class MoviePolicy < ApplicationPolicy
  def update?
    user == record.user || user.admin
  end
end
