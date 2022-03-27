ActiveAdmin.register Author do
  permit_params :first_name, :last_name

  index do
    selectable_column
    column :first_name
    column :last_name
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :books
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
