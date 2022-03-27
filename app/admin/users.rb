ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :roles do |user|
      safe_join(user.roles.map { |e| content_tag(:span, e.name, class: 'status_tag yes') }, ' ')
    end
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
      f.input :roles, collection: Role.all, as: :check_boxes
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :password do
        '[PROTECTED]'
      end
    end
  end
end
