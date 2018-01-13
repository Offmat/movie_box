class WriterPolicy < ApplicationPolicy
  def permitted_attributes
    [:name, :surname]
  end

  def destroy?
    user.admin
  end
end
