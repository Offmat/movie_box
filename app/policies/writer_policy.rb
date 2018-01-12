class WriterPolicy  < ApplicationPolicy
  def destroy?
    user.admin
  end
end
