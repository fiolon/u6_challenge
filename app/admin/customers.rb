ActiveAdmin.register Customer do

  permit_params :full_name, :phone_number, :email, :notes, :image

  index do
    selectable_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column "Image" do |customer|
      if customer.image.present?
        image_tag customer.image.variant(resize_to_limit: [75, 75])
      else
        "Image not Available"
      end
    end
    actions
  end

  form do |f|
    f.inputs 'Customer Details' do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.inputs do
        f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize_to_limit: [100, 100])) : "No image Available"
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :full_name
      row :phone_number
      row :email
      row :notes
      row "Image" do |customer|
        if customer.image.present?
          image_tag customer.image.variant(resize_to_limit: [100, 100])
        else
          "Image not Available"
        end
      end
      row :created_at
      row :updated_at
    end
  end

end
