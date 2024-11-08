# config/initializers/ransack_active_storage.rb
Rails.application.config.to_prepare do
  # Define ransackable attributes for ActiveStorage::Attachment
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end
  end

  # Define ransackable attributes for ActiveStorage::Blob
  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["content_type", "created_at", "filename", "id", "metadata", "service_name", "byte_size"]
    end
  end
end