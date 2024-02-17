class Poster < ApplicationRecord
    mount_uploader :image, PosterUploader
end
