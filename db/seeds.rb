# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require_relative "flickr_toy_collection"

puts "Deleting everything...."
Toy.destroy_all
puts "Destroyed toys."

User.destroy_all
puts "Destroyed users."

puts "creating stuff...."

# Faker
# Faker::Name.male_first_name   #=> "Edward"
# Faker::Name.female_first_name
# Faker::Name.last_name
# Faker::Internet.email(name: 'Nancy') #=> "nancy@terry.biz"

# condition: "brand new": 0, damaged: 1, used: 2
flickr_toy_collection_array = [
  {
    item: "Knit Elephant",
    category: "soft toys",
    description: "A lovely hand knitted elephant.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/4023/4435779081_6b91100dcd_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/jenpotter/4435779081/in/photolist-chZ3bj-7KYwzF-bPweop-cgyqxS-5mnUpj-9fCY2g-6e2SAc-9gdjLH-QkdiQj-9PMaqR-2t7JX-3cc61Q-4z218-5iMiSj-dTCsHd-9m8Y2E-yraPV9-9bDveP-LAVfhX-BZLG4m-7JNZ5c-dQtwX1-b1wTUR-pLbbiF-cMXzzb-9rc7S1-oRzt4E-bVKNub-7JSUwA-HHnEz7-dunx3p-RH8nBS-MZHNhm-24C5X4v-9BQjF2-9c2gfz-umPY3S-3yx7Gy-qU7KvR-cMXyRo-dsYuce-b6Rvzx-4Y9719-RvNS31-4aok5M-cMXzgY-CLRYLm-2SEUSH-M1uGQM-9xQfmK",
  },
  {
    item: "McDonalds Toy Dog",
    category: "plastic toys",
    description: "The classic Mac dog.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/3207/2826647650_8dc936c2e4_b.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/fsse-info/2826647650/in/photolist-5iMiSj-dTCsHd-9m8Y2E-yraPV9-9bDveP-LAVfhX-BZLG4m-7JNZ5c-dQtwX1-b1wTUR-pLbbiF-cMXzzb-9rc7S1-oRzt4E-bVKNub-7JSUwA-HHnEz7-dunx3p-RH8nBS-MZHNhm-24C5X4v-9BQjF2-9c2gfz-umPY3S-3yx7Gy-qU7KvR-cMXyRo-dsYuce-b6Rvzx-4Y9719-RvNS31-4aok5M-cMXzgY-CLRYLm-2SEUSH-M1uGQM-9xQfmK-uf4BU3-24tgU1V-8VXB6o-93QrKh-bbgKwr-9yBypy-dcDhRb-21g7yoy-WDva8R-aA2Rd6-XsrUxu-9r5U1V-9bGBCS",
  },
  {
    item: "Thomas the Tank Engine",
    category: "toy trains",
    description: "Chu chuuu! Collection of Thomas the Tank Engine trains.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/5303/5611079195_6b1866f739_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/fsse-info/2826647650/in/photolist-5iMiSj-dTCsHd-9m8Y2E-yraPV9-9bDveP-LAVfhX-BZLG4m-7JNZ5c-dQtwX1-b1wTUR-pLbbiF-cMXzzb-9rc7S1-oRzt4E-bVKNub-7JSUwA-HHnEz7-dunx3p-RH8nBS-MZHNhm-24C5X4v-9BQjF2-9c2gfz-umPY3S-3yx7Gy-qU7KvR-cMXyRo-dsYuce-b6Rvzx-4Y9719-RvNS31-4aok5M-cMXzgY-CLRYLm-2SEUSH-M1uGQM-9xQfmK-uf4BU3-24tgU1V-8VXB6o-93QrKh-bbgKwr-9yBypy-dcDhRb-21g7yoy-WDva8R-aA2Rd6-XsrUxu-9r5U1V-9bGBCS",
  },
  {
    item: "Wooden Pinnochio",
    category: "wooden toys",
    description: "",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/4417/35620862564_6f16cb2935_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/fsse-info/2826647650/in/photolist-5iMiSj-dTCsHd-9m8Y2E-yraPV9-9bDveP-LAVfhX-BZLG4m-7JNZ5c-dQtwX1-b1wTUR-pLbbiF-cMXzzb-9rc7S1-oRzt4E-bVKNub-7JSUwA-HHnEz7-dunx3p-RH8nBS-MZHNhm-24C5X4v-9BQjF2-9c2gfz-umPY3S-3yx7Gy-qU7KvR-cMXyRo-dsYuce-b6Rvzx-4Y9719-RvNS31-4aok5M-cMXzgY-CLRYLm-2SEUSH-M1uGQM-9xQfmK-uf4BU3-24tgU1V-8VXB6o-93QrKh-bbgKwr-9yBypy-dcDhRb-21g7yoy-WDva8R-aA2Rd6-XsrUxu-9r5U1V-9bGBCS",
  },
  {
    item: "Buzz Lightyear",
    category: "plastic toys",
    description: "Classic Buzz Lightyear with Shotgun.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/4127/4979302833_a61d0f6b97_h.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/razaonetwo/4979302833/in/photolist-dCvyXj-b5NC2H-dFd4xk-dWxPDR-y64wX-8jdm9J-NfbZNX-36xfo-91PE5i-TMYgBh-STm9aH-93UNRu-DTzik-7QRXiT-u9ueJB-91D5Mc-dWxGzM-9d7pgY-dWwJpk-pvzkVx-F2zkNh-dWDm2o-5YQQjA-WW78rt-dWxGYD-vVC7n-SZBhHZ-azXBMW-dcQLhe-brKHKu-9vo2u8-KsHia-3oLqB-91SKTL-kgFn7x-kGE7NM-de2fR4-GgJepW-8tUnMH-91WNiJ-oG98h9-dWDkEU-kgHhkf-8A1efR-eaPQey-vpSyB5-2edCfqA-dWwHLt-F1rTDu-91cKaD",
  },
  {
    item: "Pile of Plush Toys",
    category: "soft toys",
    description: "30 soft and fluffy animal toys.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/7858/46744201034_4b688241f8_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/thedoglab/46744201034/in/photolist-dCvyXj-b5NC2H-dFd4xk-dWxPDR-y64wX-8jdm9J-NfbZNX-36xfo-91PE5i-TMYgBh-STm9aH-93UNRu-DTzik-7QRXiT-u9ueJB-91D5Mc-dWxGzM-9d7pgY-dWwJpk-pvzkVx-F2zkNh-dWDm2o-5YQQjA-WW78rt-dWxGYD-vVC7n-SZBhHZ-azXBMW-dcQLhe-brKHKu-9vo2u8-KsHia-3oLqB-91SKTL-kgFn7x-kGE7NM-de2fR4-GgJepW-8tUnMH-91WNiJ-oG98h9-dWDkEU-kgHhkf-8A1efR-eaPQey-vpSyB5-2edCfqA-dWwHLt-F1rTDu-91cKaD",
  },
  {
    item: "Lego People",
    category: "lego",
    description: "50 lego people to keep you happy.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/3721/10227025553_9dc84bcc3c_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/piratejohnny/10227025553/in/photolist-gzJboM-kgEGEK-U8juLq-4opoJj-kgEpRp-kgEmVV-9pxM1p-TVobn5-U6F1jQ-i5e8fb-9kZtRw-anAwhR-a3gjZW-TVoSDN-ctf1mA-nYxZuj-9ofaru-EGw7Gm-7NiA1T-9WFs4g-eb3VBU-dDYrtB-dWxGUP-dXeGKC-66dqbX-q884g5-a3C1pQ-pBYuGx-8DvYW2-UECE8J-V3git3-b2K1nZ-U8juMh-kgFmZt-98MJXg-bZWN93-6uP4cg-4zs34-98hzvr-91WNhm-8oDzCH-97dc69-23grBUN-72S2J7-gPTwE9-2bPCenq-gm9dQ-aN8XnF-21WRXLt-GuPkZS",
  },
  {
    item: "Wooden Hammering Toy",
    category: "wooden toys",
    description: "Hammering contentment like you've never known.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/685/32626896476_cfe0751b5d_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/byzantiumbooks/32626896476/in/photolist-RH8nBS-MZHNhm-24C5X4v-9BQjF2-9c2gfz-umPY3S-3yx7Gy-qU7KvR-cMXyRo-dsYuce-b6Rvzx-4Y9719-RvNS31-4aok5M-cMXzgY-CLRYLm-2SEUSH-M1uGQM-9xQfmK-uf4BU3-24tgU1V-8VXB6o-93QrKh-bbgKwr-9yBypy-dcDhRb-21g7yoy-WDva8R-aA2Rd6-XsrUxu-9r5U1V-9bGBCS-tiqSod-uf4B9f-8fsrt9-5RAiby-26bDDSQ-6irJbm-detW4T-d6Drnb-RVoMyT-6fAT91-aiCy2y-at6pNh-gim83-a8AY3w-7bwb7N-9xQf6z-cMXyvh-dvHt2Z",
  },
  {
    item: "Awesome Lego Collection",
    category: "lego",
    description: "3 big tubs of hadcore lego joy.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/8492/8319567241_6a5ea5d1bc_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/andrewsinclair/8319567241/in/photolist-dFaXuv-rcTY6S-9zQnDc-AvEM7v-agtNuw-agtNxs-aErJeC-ns5usj-huT4Dk-58rgyt-rNVkHy-capKLJ-QgtK9G-c8SGzy-e6rfp5-fKxnBQ-ctYeMC-nqZMf1-pppzE7-fKfMc4-fLhXSS-9rQnus-9o2rtK-fKxna5-ek2361-fAKtz5-qSCGi3-LBM6TY-9zTmpU-AwpG4V-ccL2Lu-KJV3P6-gDR7iV-bDEPKZ-7Qny5Z-oRSD1p-cj8PRJ-e5iiEh-bs4aPS-c6ioy7-cfEhWu-anKAiW-kFcFXv-iMemwd-9oDmBo-a7Bng-DP5Mxr-DpQZ1h-ecEZWf-Q9RUBz",
  },
  {
    item: "Collection of Board Games",
    category: "board games",
    description: "30+ board games old and new.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/7422/14125947172_a424ade5d9_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/120600995@N07/14125947172/in/photolist-nwgaXj-7TPurp-9GyZ3j-9Gw8up-ga3wRN-3D4QWD-BTxTb4-7sTBJF-9Gw6Fx-6Sz8bB-9Gw82Z-eCKb7Z-irv2cF-6SDa11-9PM7Sz-zpZX9a-rroTu9-rCXRpB-61NJnc-dRPNRY-9GyZZf-8iRwPh-9yujq6-zkp56a-9asJEo-wn9Cxi-5M1HRY-7ymiA7-b3UQYM-e2tX6c-thCDwb-qD6aib-3ck3gq-dnEW5o-qoN9aQ-pJA1RZ-fQmbxs-yWofZF-fxqpDx-pdTuwi-e8ht5L-qoWqtz-9yxjGm-qFnREP-qs2XEq-rNXoyi-eiHTY7-qrTGuR-qs2BF9-Nskbe",
  },
  {
    item: "toddler bike",
    category: "outdoor toys",
    description: "Bike riding fun for your little one.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/6099/6326625239_95afa5320b_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/hugojcardoso/6326625239/in/photolist-aD4Bgv-ZMgA5n-apMLGK-aRPkmn-oGU8Ww-byiFkz-awLRjf-7JRmf7-6irCu9-7iRrrj-q79JNS-gvvGM-Gqneuh-vH7WNx-22Ceodq-9wZDbr-rRitf4-dFiteW-252QNSR-6dCZXW-o7SumV-BjqSeA-Rm58Ng-oQwBa3-bVd1Jo-aB6P32-9wZFiM-V1eFzo-q79HNq-cfoPLU-SN6csP-ufCrrx-7fShqF-duQoCZ-abmdhU-aeu6qG-bfrHhx-dQceJ-dFiuGh-5tgvMN-c5m1w7-9wZCAM-Uaf3mW-5LEHtr-fAHFss-9eNnRj-9rcSKQ-5PBan-4Ntj5E-ufsuXK"
  },
  {
    item: "clockwork robot toy",
    category: "clockwork items",
    description: "Beautiful vintage clockwork robot with menacing 'I'm going to take over the world' speech function.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/1692/24961001054_85a6cabd34_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/47064420@N03/24961001054/in/photolist-4K9cFX-frFtep-2BNLh-E2HDZ9-5q8iBS-NHr77H-qnq25P-22LFLHf-27LEWqw-aSG9Mr-qh6Bj-24NnTuQ-4aeeJr-detUPw-as76yj-VgWr4v-22GnXCm-9uQ3bq-7uA3kY-C6sWW-95Gwfd-cqVcR-oj3T4-TyfLbj-53GBMn-65sh3Q-7uA3md-8kds1M-KgBr7g-PHvQH5-9xHKfu-dWxPQa-DrQCG-aj6LhJ-cjFhbb-LywVv-HVRea-Tsye2U-RFGNCZ-5mFeT-22QnYQy-sb5pPd-aGwPDx-dcQJME-aGwMCH-dWDsrj-9n5eu3-PfQfxU-3pcdov-LAesK"
  }

]

address = ["Tokyo", "London", "Chiba", "Hiroshima"]
# A user can have many toys, but a toy only has one owner (Ask Sheriff Woody for more info)
gareth = User.create!(name: "gareth", email: "gareth@lewagon.com", password: "123456789" )
anju = User.create!(name: "anju", email: "anju@lewagon.com", password: "123456789" )
emanuel = User.create!(name: "emanuel", email: "emanuel@lewagon.com", password: "123456789" )
louis = User.create!(name: "louis",  email: "louis@lewagon.com", password: "123456789" )

users = [gareth, anju, emanuel, louis]

puts "created users"

# toy_name = ["Sword", "Sponge Bob Doll", "Sailormoon doll", "Princess doll", "Mini race car", "wig"]

puts "creating toys"
flickr_toy_collection_array.each_with_index do |item, index|
toy_image_file = URI.open(item[:flickr_image_url])
image_filename = item[:item].gsub(" ", "") + item[:flickr_image_url][35..44]

# category = ["music", "puzzle", "soft toy", "train", "car", "drawing"]
# description = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", nil ]

  toy = Toy.create!(
    user:users.sample,
    name:item[:item],
    description:item[:description],
    category:item[:category],
    condition:rand(0..2),
    dates_available:Date.today,
    price:rand(10..1000),
    photo_url:item[:flickr_image_url])
  # adding the flickr photo-id to filename here to avoid duplicate image filenames
  toy.photo.attach(io: toy_image_file, filename: item[:item].gsub(" ", ""), content_type: 'image/jpg')
  puts "Toy #{index}: #{item[:item]}. Price: #{toy.price}. Cloudinary image file: #{image_filename}"
end

puts "created #{Toy.count} toys. :) and users."

puts "creating bookings"
today = DateTime.now.to_date
#today.to_s # "2009-08-31"
seven_days_from_now = (today + 7).to_date
5.times do
  Booking.create(
    start_date: today,
    end_date: seven_days_from_now,
    delivery_option: 'deliver',
    user_id: rand(1..3),
    toy_id: rand(1..10)
  )
  puts "User #{index}: #{item[:item]}. Price: #{toy.price}. Cloudinary image file: #{image_filename}"
end

puts "bookings created"
