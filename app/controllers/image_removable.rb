module ImageRemovable
  extend ActiveSupport::Concern
  
  private
  
  def remove_images
    return unless params[:anounce][:remove_images].present?
    
    params[:anounce][:remove_images].each do |image_id|
      image = ActiveStorage::Attachment.find_by(id: image_id)
      image.purge if image && image.record_id == @anounce.id
    end
  end
end