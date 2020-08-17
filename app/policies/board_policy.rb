class BoardPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    if plan_b_user || admin
      true
    elsif plan_a_user
      user.boards.count < 2
    else
      false
    end
  end
end
