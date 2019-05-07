class AddYayinlanmaToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :yayinlanma, :boolean, default: false
    add_column :posts, :yayinlanma_tarihi, :datetime
  end
end
