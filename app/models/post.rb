# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  kategoriId        :integer
#  baslik            :string
#  aciklama          :text
#  icerik            :text
#  foto              :string
#  tarih             :datetime
#  okunma            :integer
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :integer
#  yayinlanma        :boolean          default(FALSE)
#  yayinlanma_tarihi :datetime
#

class Post < ApplicationRecord
    
    has_attached_file :resim, styles: { medium: "670x402>", thumb: "360x216>" }, default_url:
"/images/:style/missing.png"
validates_attachment_content_type :resim, content_type: /\Aimage\/.*\z/
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  extend FriendlyId
  friendly_id :baslik, use: :slugged
  
  belongs_to :author, :optional => true
  
  PER_PAGE = 6
  
  scope :most_recent, -> {order(yayinlanma_tarihi: :desc)}
  scope :yayinlanma, -> {where(yayinlanma: :true)}
  scope :recent_paginated, -> (page) { most_recent.paginate(page: page, per_page: PER_PAGE) }
  scope :with_tag, -> (tag) {  tagged_with(tag) if tag.present? }

  
  scope :list_for, -> (page, tag) do
           recent_paginated(page).with_tag(tag)
  end
  
  
  def should_generate_new_friendly_id?
	baslik_changed?
  end

 def display_day_published
    if yayinlanma_tarihi.present?
	    "Yayınlanma: #{yayinlanma_tarihi.strftime('%-b %-d, %Y')}"
	else
	    "Henüz yayınlanmadı."
	end
  end
  
  def publish
      update(yayinlanma: true,yayinlanma_tarihi: Time.now)
  end
  def unpublish
      update(yayinlanma: false,yayinlanma_tarihi: nil)
  end
end
