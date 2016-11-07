class Automobile < ActiveRecord::Base
  has_many :comments, dependent: :destroy

	validates :brand, :model, :modification, presence: true

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search, brand, model, modification)
    if brand != "" || model != "" || modification != ""
      where(["brand LIKE ? AND model LIKE ? AND modification LIKE ?", "%#{brand}%", "%#{model}%", "%#{modification}%"])
    elsif search
      where(["brand LIKE ? OR model LIKE ? OR modification LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      all
    end
  end
end
