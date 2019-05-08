class AddKategoriToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :kategori, foreign_key: true
  end
end
