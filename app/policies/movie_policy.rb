class MoviePolicy < ApplicationPolicy
def permitted_attributes
  [:title, :release_date, :duration, :info, :genres, :countries, director_ids: [], writer_ids: []]
end

  def update?
    user == record.user || user.admin
  end

  def destroy?
    user.admin
  end
end
