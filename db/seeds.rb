if Paslon.first.blank?
  puts 'seeding paslons table . . .'
  Paslon.create!([
    {id: 246, nama_calon: "Ridwan Mukti", nama_wakil_calon: "Rohidin Mersyah", qwords: "pasangan calon Ridwan Mukti Rohidin Mersyah"},
    {id: 624, nama_calon: "Sultan B Najamudin", nama_wakil_calon: "Mujiono", qwords: "pasangan calon Sultan B Najamudin Mujiono"}
  ])
else
  puts "not seeding paslons table"
end

if SumberMedia.first.blank?
  puts 'seeding sumber_media table . . .'
  SumberMedia.create!([
    {link: "m.liputan6.com"},
    {link: "www.rmolbengkulu.com"},
    {link: "www.rri.co.id"},
    {link: "bengkuluekspress.com"},
    {link: "kpu-bengkuluprov.go.id"},
    {link: "www.rumahpemilu.org"},
    {link: "news.okezone.com"}
  ])
else
  puts "not seeding sumber_media table"
end

if RekamJejak.first.blank?
  puts 'seeding rekam_jejaks table . . .'
  RekamJejak.create!([
    {paslon_id: 246, sumber_media_id: 1, judul: "Gelar Undian Calon, KPU Bengkulu Pakai Koin dan Bola Pingpong ...", link: "http://m.liputan6.com/pilkada-serentak-2015/read/2301646/gelar-undian-calon-kpu-bengkulu-pakai-koin-dan-bola-pingpong", content_media: "25 Ags 2015 ... Pengundian nomor urut Pilkada Bengkulu (Liputan6.com/Yuliardi Hardjo Putro) ... Setelah itu giliran pasangan Ridwan Mukti-Rohidin Mersyah??..."},
    {paslon_id: 246, sumber_media_id: 2, judul: "Ketua Tim Kampanye Duo RM Dilaporkan ke Bawaslu", link: "http://www.rmolbengkulu.com/index.php/politik/item/2813-ketua-tim-kampanye-duo-rm-dilaporkan-ke-bawaslu", content_media: "6 hari yang lalu ... Ketua Tim Kampanye Ridwan Mukti - Rohidin Mersyah, Heliardo dilaporkan ke Badan Pengawas Pemilu (Bawaslu) Provinsi Bengkulu. ... Digital ?? Saat Musim Pilkada, Warga Kota Bengkulu Ngaku Marak Serangan Pajar??..."},
    {paslon_id: 246, sumber_media_id: 3, judul: "Pilkada Serentak 2015 - Puskaki Bengkulu minta Bawaslu tindak ...", link: "http://www.rri.co.id/post/berita/197160/pilkada_serentak_2015/puskaki_bengkulu_minta_bawaslu_tindak_paslon_gubernur_ridwanrohidin.html", content_media: "4 hari yang lalu ... ... Bawaslu tindak Paslon Gubernur Ridwan-Rohidin KBRN, Bengkulu ... dan Wakil Gubernur Ridwan Mukti-Rohidin Mersyah bersama timnya,??..."},
    {paslon_id: 246, sumber_media_id: 4, judul: "Ridwan Mukti Luncurkan Media Centre RM-SATU - Bengkulu ...", link: "http://bengkuluekspress.com/ridwan-mukti-luncurkan-media-centre-rm-satu/", content_media: "27 Ags 2015 ... BENGKULU ??? Sehari setelah mendapatkan nomor urut 1, calon Gubernur ... Bengkulu (2015-2020) Ridwan Mukti-Rohidin Mersyah (RM-Satu) ... Selain itu, tim Media Centre juga berharap agar proses Pilkada Bengkulu ini??..."},
    {paslon_id: 624, sumber_media_id: 5, judul: "Hasil Pemeriksaan Berkas Pasangan Bakal Calon Sultan B ...", link: "http://kpu-bengkuluprov.go.id/web/index.php/download/hasil-pemeriksaan-berkas-pasangan-bakal-calon-sultan-b-najamudin-dan-mujiono/", content_media: "4 Ags 2015 ... Kpu Provinsi Bengkulu Komisi Pemilihan Umum Provinsi Bengkulu. HOME; PROFIL ... Hasil Pemeriksaan Berkas Pasangan Bakal Calon Sultan B Najamudin dan Mujiono ... Menuju Pilkada Bengkulu 9 Desember 2015."},
    {paslon_id: 624, sumber_media_id: 3, judul: "Pilkada Serentak 2015 - Panwaslu Kota Bengkulu Tindaklanjuti 3 ...", link: "http://www.rri.co.id/post/berita/196004/pilkada_serentak_2015/panwaslu_kota_bengkulu_tindaklanjuti_3_pelanggaran_pilgub_2015.html", content_media: "1 Sep 2015 ... KBRN, Bengkulu : Panitia Pengawas Pemilu (Panwaslu) Kota Bengkulu ... dengan Sultan B Najamudin - Mujiono ke Komisi Pemilihan Umum??..."},
    {paslon_id: 624, sumber_media_id: 6, judul: "Dua Pasang Calon Ikuti Pemilihan Gubernur ... - Rumah Pemilu", link: "http://www.rumahpemilu.org/read/9608/Dua-Pasang-Calon-Ikuti-Pemilihan-Gubernur-Bengkulu", content_media: "26 Ags 2015 ... Pasangan nomor urut dua adalah Sultan B Najamuddin-Mujiono. Sebelum resmi dilantik menjadi wakil Gubernur Bengkulu pada tahun 2013,??..."},
    {paslon_id: 624, sumber_media_id: 7, judul: "Lima Parpol di Bengkulu Dilarang Kampanye :: Okezone News", link: "http://news.okezone.com/read/2015/08/11/340/1193898/lima-parpol-di-bengkulu-dilarang-kampanye", content_media: "11 Ags 2015 ... Lima partai politik di Bengkulu dilarang ikut kampanye lantaran tidak ikut ... Sementara, untuk pasangan Sultan B Najamudin-Mujiono diusung Partai ... Bawaslu Nyatakan Sejumlah Daerah Masuk Zona Merah Pilkada??..."}
  ])
else
  puts "not seeding rekam_jejaks table"
end
