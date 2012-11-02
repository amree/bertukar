states = Array.new
states << { "nama" => "Wilayah Persekutuan", "districts" => ["Kuala Lumpur", "Labuan", "Putrajaya"]}
states << { "nama" => "Johor",           "districts" => ["Johor Bahru", "Batu Pahat", "Muar", "Kluang", "Kota Tinggi", "Segamat", "Pontian", "Mersing", "Kulaijaya", "Ledang"]}
states << { "nama" => "Kedah",           "districts" => ["Baling" ,"Bandar" ,"Baharu" ,"Kota Setar" ,"Kuala" ,"Muda" ,"Kubang" ,"Pasu" ,"Kulim" ,"Langkawi" ,"Padang" ,"Terap" ,"Pendang" ,"Pokok" ,"Sena" ,"Sik" ,"Yan"]}
states << { "nama" => "Kelantan",        "districts" => ["Kota Bharu", "Pasir Mas", "Tumpat", "Pasir Puteh", "Bachok", "Kuala Krai", "Machang", "Tanah Merah", "Jeli", "Gua", "Musang"]}
states << { "nama" => "Melaka",          "districts" => ["Alor Gajah", "Melaka Tengah", "Jasin"]}
states << { "nama" => "Negeri Sembilan", "districts" => ["Jelebu", "Jempol", "Kuala Pilah", "Port Dickson", "Rembau", "Seremban", "Tampin"]}
states << { "nama" => "Pahang",          "districts" => ["Bera", "Bentong", "Cameron Highlands", "Jerantut", "Kuantan", "Lipis", "Maran", "Pekan", "Raub", "Rompin", "Temerloh"]}
states << { "nama" => "Perak",           "districts" => ["Kinta", "Larut, Matang dan Selama", "Hilir Perak", "Manjung", "Batang Padang", "Kerian", "Kuala Kangsar", "Hulu Perak", "Perak Tengah", "Kampar"]}
states << { "nama" => "Perlis",          "districts" => ["Abi", "Arau", "Beseri", "Chuping", "Jejawi", "Kayang", "Kechor", "Kuala Perlis", "Kurong Anai", "Kurong Batang", "Ngulang", "Oran", "Padang Pauh", "Paya", "Pedang Siding", "Sanglang", "Sena", "Seriab", "Sungai Adam", "Sungai Baru", "Titi Tinggi", "Utan Aji", "Wang Bintong"]}
states << { "nama" => "Pulau Pinang",    "districts" => ["Barat Daya Pulau Pinang", "Timur Laut Pulau Pinang", "Seberang Perai Utara", "Seberang Perai Tengah", "Seberang Perai Selatan"]}
states << { "nama" => "Sabah",           "districts" => ["Pedalaman", "Kudat", "Sandakan", "Tawau", "Pantai Barat"]}
states << { "nama" => "Sarawak",         "districts" => ["Betong", "Bintulu", "Kapit", "Kuching", "Limbang", "Miri", "Mukah", "Samarahan", "Sarikei", "Sibu", "Sri Aman"]}
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
