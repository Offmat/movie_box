class OpinionPolicy < ApplicationPolicy
  def permitted_attributes
    [:score, :comment]
  end

  def destroy?
    user == record.user || user.admin
  end
end
