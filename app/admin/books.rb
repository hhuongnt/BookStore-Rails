ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :author, :published_on, :price, { photos: [] }, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :author, :published_on, :price, :photos]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    column :id
    column :name
    column :description
    column :author
    column :published_on
    column :price
    column 'Photos' do |book|
      image_tag(book.photos.first.url, style: 'height: 260px; width: 170px;')
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :author
      row :published_on
      row :price
      row :created_at
      row :updated_at
      row :photos do |book|
        book.photos.each do |photo|
          span do
            image_tag(photo.url, style: 'height: 260px; width: 170px;')
          end
        end
      end
    end
    active_admin_comments
  end

  form(html: { multipart: true }) do |f|
    f.inputs do
      @categories = Category.all
      f.input :name
      f.input :description
      f.input :author
      f.input :published_on
      f.input :price, min: 0
      f.file_field :photos, multiple: true, image_preview: true
      f.collection_select :category_id, @categories, :id, :name, prompt: 'Select Category'
    end
    f.actions
  end
end
