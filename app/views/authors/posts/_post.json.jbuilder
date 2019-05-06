json.extract! post, :id, :kategoriId, :baslik, :aciklama, :icerik, :foto, :tarih, :okunma, :slug, :created_at, :updated_at
json.url post_url(post, format: :json)
