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

  index do
    column :id
    column :title
    column :user
    column :created_at
    column :updated_at
    actions
  end

  permit_params :name, :video, :image, :title, :material, :recipe
end
