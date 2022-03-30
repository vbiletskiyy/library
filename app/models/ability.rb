# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user&.has_role? :admin
      can :manage, :all
    elsif current_user&.has_role? :book_manager
      can :manage, Book
      can :read, [Author, Category, User]
    elsif current_user&.has_role? :category_manager
      can :manage, Category
      can :read, [Author, Book, User]  
    end
  end
end
