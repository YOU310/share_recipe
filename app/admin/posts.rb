ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :video, :image, :title, :material, :recipe, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:video, :image, :title, :material, :recipe, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :name, :video, :image, :title, :material, :recipe, :genre

  index do
    selectable_column
    id_column
    column :title
    column :genre, &:genre_i18n
    column :user
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :genre, &:genre_i18n
      row :user
      row :material
      row :recipe
      row :image
      row :video
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user
      input :title
      input :genre, as: :select, collection: Post.genres_i18n.invert
      input :material
      input :recipe
      input :image, as: :file
      input :video, as: :file
    end
    f.actions
  end

  filter :genre, as: :select, collection: Post.genres_i18n.invert.transform_values {|v| Post.genres[v] }
  filter :user
  filter :title

end


