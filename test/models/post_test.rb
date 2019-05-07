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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
