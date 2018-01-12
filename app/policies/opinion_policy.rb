class OpinionPolicy < ApplicationPolicy
  def destroy?
    user == record.user || user.admin
  end
end
