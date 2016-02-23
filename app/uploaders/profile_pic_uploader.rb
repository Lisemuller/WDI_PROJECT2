class ProfilePicUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{APP_ROOT}/public/uploads"
  end
end