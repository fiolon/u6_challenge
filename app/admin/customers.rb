ActiveAdmin.register Customer do

  permit_params :full_name, :phone_number, :email, :notes

  index do
    selectable_column
    column "Customers", :title
    column :full_name
    column :phone_number
    column :email
    column :notes
    actions
  end

  form do |f|
    f.inputs 'Customer Details' do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
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
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
