class CreateKategoris < ActiveRecord::Migration[5.2]
  def change
    create_table :kategoris do |t|
      t.string :ad
      t.text :aciklama

      t.timestamps
    end
  end
end
