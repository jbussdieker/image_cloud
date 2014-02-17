class Image < ActiveRecord::Base
  before_save :bs

  # This method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    mini: '64x64>',
    thumb: '100x100>',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def bs
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    image_info = EXIFR::JPEG.new(image.queued_for_write[:original].path)
    if image_info.gps?
      self.latitude = image_info.gps_lat
      self.longitude = image_info.gps_lng
    end
    if image_info.date_time
      self.taken_at = image_info.date_time
    end
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end
end
