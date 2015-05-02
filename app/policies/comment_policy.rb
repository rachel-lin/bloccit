class CommentPolicy < ApplicationPolicy

  def new
    user.present? && user.admin?
  end

  def create?
    new?
  end
  
end