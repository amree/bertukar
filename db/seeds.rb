states = Array.new
states << { "nama" => "Wilayah Persekutuan", "districts" => ["Kuala Lumpur", "Labuan", "Putrajaya"]}
states << { "nama" => "Johor",           "districts" => ["Johor Bahru", "Batu Pahat", "Muar", "Kluang", "Kota Tinggi", "Segamat", "Pontian", "Mersing", "Kulaijaya", "Ledang"]}
states << { "nama" => "Kedah",           "districts" => ["Baling" ,"Bandar Baharu" ,"Kota Setar" ,"Kuala Muda" ,"Kubang Pasu" ,"Kulim" ,"Langkawi" ,"Padang Terap" ,"Pendang" ,"Pokok Sena" ,"Sik" ,"Yan"]}
states << { "nama" => "Kelantan",        "districts" => ["Kota Bharu", "Pasir Mas", "Tumpat", "Pasir Puteh", "Bachok", "Kuala Krai", "Machang", "Tanah Merah", "Jeli", "Gua", "Musang"]}
states << { "nama" => "Melaka",          "districts" => ["Alor Gajah", "Melaka Tengah", "Jasin"]}
states << { "nama" => "Negeri Sembilan", "districts" => ["Jelebu", "Jempol", "Kuala Pilah", "Port Dickson", "Rembau", "Seremban", "Tampin"]}
states << { "nama" => "Pahang",          "districts" => ["Bera", "Bentong", "Cameron Highlands", "Jerantut", "Kuantan", "Lipis", "Maran", "Pekan", "Raub", "Rompin", "Temerloh"]}
states << { "nama" => "Perak",           "districts" => ["Kinta", "Larut, Matang dan Selama", "Hilir Perak", "Manjung", "Batang Padang", "Kerian", "Kuala Kangsar", "Hulu Perak", "Perak Tengah", "Kampar"]}
states << { "nama" => "Perlis",          "districts" => ["Abi", "Arau", "Beseri", "Chuping", "Jejawi", "Kayang", "Kechor", "Kuala Perlis", "Kurong Anai", "Kurong Batang", "Ngulang", "Oran", "Padang Pauh", "Paya", "Pedang Siding", "Sanglang", "Sena", "Seriab", "Sungai Adam", "Sungai Baru", "Titi Tinggi", "Utan Aji", "Wang Bintong"]}
states << { "nama" => "Pulau Pinang",    "districts" => ["Barat Daya Pulau Pinang", "Timur Laut Pulau Pinang", "Seberang Perai Utara", "Seberang Perai Tengah", "Seberang Perai Selatan"]}
states << { "nama" => "Sabah",           "districts" => ["Beaufort", "Beluran", "Bingkor", "Bongawan", "Donggongon", "Inanam", "Kalabakan", "Keningau", "Kimanis", "Kinabatangan", "Kinarut", "Kota Belud", "Kota Kinabalu", "Kota Marudu", "Kuala Penyu", "Kudat", "Kunak", "Kundasang", "Lahad Datu", "Membakut", "Menggatal", "Nabawan", "Papar", "Pensiangan", "Pitas", "Putatan", "Ranau", "Sandakan", "Sapulut", "Semporna", "Sepanggar", "Sindumin", "Sipitang", "Tambunan", "Tamparuli", "Tawau", "Telipok", "Telupid", "Tenom", "Tongod", "Tuaran", "Weston"]}
states << { "nama" => "Sarawak",         "districts" => ["Asajaya", "Ba'kelalan", "Bau", "Beladin", "Belaga", "Betong", "Bintangor", "Bintulu", "Dalat", "Daro", "Debak", "Julau", "Kanowit", "Kapit", "Kota Samarahan", "Kuching", "Lawas", "Limbang", "Lingga", "Lubok Antu", "Lundu", "Maludam", "Matu", "Meradong", "Miri", "Mukah", "Marudi", "Oya", "Pakan", "Pusa", "Saratok", "Sarikei", "Sebuyau", "Serian", "Selangau", "Sibu", "Siburan", "Simunjan", "Song", "Spaoh", "Sri Aman", "Sungai Tujuh", "Tanjung Kidurong", "Tatau", "Tebedu"]}
states << { "nama" => "Selangor",        "districts" => ["Gombak", "Hulu Langat", "Hulu Selangor", "Klang", "Kuala Langat", "Kuala Selangor", "Sabak Bernam", "Sepang", "Petaling"]}
states << { "nama" => "Terengganu",      "districts" => ["Kuala Terengganu", "Hulu Terengganu", "Besut", "Setiu", "Marang", "Dungun", "Kemaman"]}

ActiveRecord::Base.transaction do
  states.each do |state|
    s = Location.new
    s.nama = state["nama"]
    s.save!

    unless state["districts"].nil?
      state["districts"].each_with_index do |district, i|
        d = Location.new
        d.nama = district
        d.state = s
        d.save!
      end
    end # unless
  end # states
end

ministries = Array.new
ministries << "Jabatan Perdana Menteri"
ministries << "Kementerian Belia dan Sukan"
ministries << "Kementerian Penerangan Komunikasi Dan Kebudayaan"
ministries << "Kementerian Kemajuan Luar Bandar dan Wilayah"
ministries << "Kementerian Kerja Raya"
ministries << "Kementerian Dalam Negeri"
ministries << "Kementerian Kesihatan"
ministries << "Kementerian Kewangan"
ministries << "Kementerian Luar"
ministries << "Kementerian Pelajaran"
ministries << "Kementerian Pelancongan"
ministries << "Kementerian Pembangunan Wanita, Keluarga dan Masyarakat"
ministries << "Kementerian Pengajian Tinggi"
ministries << "Kementerian Pengangkutan"
ministries << "Kementerian Perdagangan Antarabangsa dan Industri"
ministries << "Kementerian Perdagangan Dalam Negeri dan Hal Ehwal Pengguna"
ministries << "Kementerian Pertahanan"
ministries << "Kementerian Pertanian dan Industri Asas Tani"
ministries << "Kementerian Perumahan dan Kerajaan Tempatan"
ministries << "Kementerian Perusahaan Perladangan dan Komoditi"
ministries << "Kementerian Sains, Teknologi dan Inovasi"
ministries << "Kementerian Sumber Asli dan Alam Sekitar"
ministries << "Kementerian Sumber Manusia"
ministries << "Kementerian Wilayah Persekutuan"


ministries.each do |ministry|
  Ministry.create(nama: ministry, is_aktif: true)
end