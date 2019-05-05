class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :kategoriId
      t.string :baslik
      t.text :aciklama
      t.text :icerik
      t.string :foto
      t.datetime :tarih
      t.integer :okunma
      t.string :slug

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
