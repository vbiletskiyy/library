class ApplicationController < ActionController::Base
  def admin?
    current_user&.has_role?(:admin)
  end

  def book_manager?
    current_user&.has_role?(:book_manager)
  end

  def category_manager?
    current_user&.has_role?(:category_manager)
  end
end
