ActiveAdmin.register Category do
  permit_params :name, book_ids: []

  index do
    selectable_column
    column :name
    column :books do |category|
      safe_join(category.books.map { |e| content_tag(:span, e.title, class: 'status_tag yes') }, ' ')
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :books, collection: Book.all, as: :check_boxes
    end
    f.actions
  end
end
