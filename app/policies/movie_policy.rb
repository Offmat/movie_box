class MoviePolicy < ApplicationPolicy
  def update?
    user == record.user || user.admin
  end

  def destroy?
    user.admin
  end
end
