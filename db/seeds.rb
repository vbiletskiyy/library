if Rails.env.development?
  u = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  admin_role = Role.create(name: "admin")
  book_manager = Role.create(name: "book_manager")
  category_manager = Role.create(name: "category_manager")
  u.roles << [admin_role, book_manager, category_manager]
end
