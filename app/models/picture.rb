class Picture < ActiveRecord::Base
  belongs_to :pictured, polymorphic: true
  attr_accessible :description, :title, :image
  has_attached_file :image,
                    styles: {
                      hd: "1200x1200",
                      large: "600x600",
                      medium: "300x300",
                      small: "150X150",
                      thumb: "100x100"
                      mini: "24x24"
                    }

  validates :image, prescence: true                  
end
