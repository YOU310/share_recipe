ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :email, :password

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :created_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :name
      input :email
      input :password
      input :password_confirmation
    end
    f.actions
  end
end
