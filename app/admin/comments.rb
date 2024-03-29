ActiveAdmin.register Comment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :post_id, :content, :image, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :post_id, :content, :image, :title]
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
  permit_params :user, :post, :content, :image
end
