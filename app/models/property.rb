class Property < ApplicationRecord
    belongs_to :user
    has_many :images
    has_attached_file :image_file,
     styles: {large: "1080x640#", medium: "600x300#", thumb: "100x100#"},
     default_url: "/images/:style/missing.png"

    validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\z/
end
