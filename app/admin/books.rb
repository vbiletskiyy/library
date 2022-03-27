ActiveAdmin.register Book do
  permit_params :title, :image, author_ids: [], category_ids: []

  index do
    selectable_column
    column :title
    column :categories do |book|
      safe_join(book.categories.map { |e| content_tag(:span, e.name, class: 'status_tag yes') }, ' ')
    end
    column :authors do |book|
      safe_join(book.authors.map { |e| content_tag(:span, e.name, class: 'status_tag yes') }, ' ')
    end
    actions
  end

  filter :categories

  form do |f|
    f.inputs do
      f.input :title
      f.input :categories, collection: Category.all, as: :check_boxes
      f.input :authors, collection: Author.all, as: :check_boxes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :categories
      row :image do |ad|
        image_tag url_for(ad.image) if ad.image.attached?
      end
    end
  end
end
