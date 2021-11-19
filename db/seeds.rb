# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require_relative "flickr_toy_collection"

def dotdotdot
  3.times do
    print "."
    sleep 0.3
  end
end

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
#{
#    item: "",
#    category: "",
#    description: "",
#    condition: 0,
#    flickr_image_url: "",
#    flickr_imagepage_url: ""
#  },
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
  },
  {
    item: "big baby toy collection",
    category: "baby toys",
    description: "massive collection of baby-suitable toys",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/3684/11819313295_ddd0d72aaf_h.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/walimai/11819313295/in/photolist-j1r54H-6cz6Qu-SSbEyN-DsRkbM-4Xw9SE-duQoCZ-22dY8VP-25X4LaX-9KX8KX-27JDyda-auBXT2-FNWp4u-HqwJsb-ENp96m-ihRtUF-FWUYvf-DoKSCk-aCyxvP-jsMur3-CDHWyR-mxbeLq-sAr2RD-67Dd87-mx9o4x-ihRuva-ETuWx1-igEMtY-R6G4mz-FNWqfY-DsRaya-aJpmyR-259Dwcf-23srXaL-CDJ1C2-SHXsVL-5w3srx-DsRgpi-kmf4h-nbphVy-wy5e4e-HA54mW-f4Qsdq-EkZiUF-22mweGt-288eF1Y-MsgnH-2786ab2-zC1wqG-9dXdJD-9dXdJH"
  },
  {
    item: "Whoozit Whatzat",
    category: "baby toys",
    description: "Whoozit Whatzat single item",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/6122/5978301046_65e5387504.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/magisch/5978301046/in/photolist-a7hmBY-98MJXg-cjFhbb-6cQexa-j1r54H-6cz6Qu-SSbEyN-DsRkbM-4Xw9SE-duQoCZ-22dY8VP-25X4LaX-9KX8KX-27JDyda-auBXT2-FNWp4u-HqwJsb-ENp96m-ihRtUF-FWUYvf-DoKSCk-aCyxvP-jsMur3-CDHWyR-mxbeLq-sAr2RD-67Dd87-mx9o4x-ihRuva-ETuWx1-igEMtY-R6G4mz-FNWqfY-DsRaya-aJpmyR-259Dwcf-23srXaL-CDJ1C2-SHXsVL-5w3srx-DsRgpi-kmf4h-nbphVy-wy5e4e-HA54mW-f4Qsdq-EkZiUF-22mweGt-288eF1Y-MsgnH"
  },
  {
    item: "LEGO Circus Baby",
    category: "lego",
    description: "Cute lego toy",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/3703/33601398602_7492ad86ca_h.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/fallentomato/33601398602/in/photolist-TceX9E-DWNvqE-CrJ9zX-9bnVHB-aJaicx-24yYYss-X4uUsw-D3Ce68-21tRv4H-F83TtR-SGVyGh-dA2xnL-douRoK-R6G4jR-DB7FAk-23JjmCX-dzW6yK-JZezAW-9R4dx-222b3b5-DxHgew-F83Qje-Hyw1S8-ngWCAq-ihRupP-ihQThA-dzWvuM-9ycGeQ-aspt2x-asrdP3-XpEnyQ-S24VKu-DqGTqN-igJ3up-24M9Eex-7uupMx-dJ9hQ6-2cG81Qc-qdoy39-fcanxF-brYcex-Mxz2rt-bjJCAE-iaRHYe-R754Hd-Lt4Kpv-9u7i8q-hxV7kj-4JsYDi-okut2b"
  },
  {
    item: "Furbies",
    category: "soft toys",
    description: "Cute Furby collection.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/8074/8314450323_b27e3f68be_b.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/jovriens/8314450323/in/photolist-dEHJpM-LywDk-dMCN5H-912MZ6-dJFShC-CgMHoZ-23sme6V-aqEhBz-6irxYA-EBzs7Y-r4ErEA-oFWL-NYr3L-6infNg-KEsz-VHPVVx-WaugZJ-dQ3GTY-detVdQ-VgLyNK-GKJZpn-WaugAh-Mhb5SM-dh2RtM-bscbCt-VAPHVy-3Ny79j-dFioh9-UPkqRH-qTzrS5-Y3VreJ-4qWsA7-9SyvDn-6oAm42-a78168-9SBp6U-ppaeWm-2cmTaya-bo8Dvm-aEYpwg-cqVcs-tRywVb-9epUbC-sj8t1L-at19hJ-7zenJ4-qsAkoH-285KQBd-9m4Lmq-oeEVA4"
  },
  {
    item: "Godzilla action figure set of 2",
    category: "action figures",
    description: "Big action Godzilla figures.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/2434/3563739646_40707df36f_k.jpg",
    flickr_imagepage_url: "https://live.staticflickr.com/5717/23082892869_4ac76c540d_k.jpg"
  },
  {
    item: "Transformers action figures set of 20",
    category: "action figures",
    description: "Big set of transformer toys.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/5717/23082892869_4ac76c540d_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/gogdog/23082892869/in/photolist-BaKRRx-fgvbs5-HAEGRr-WBpHwA-27ZX7t9-Sdd3V8-9Sjews-UqQxmr-EHPMUQ-VqJaNG-9WJ5b3-dSRyXB-9Sgm5a-khzUb4-duspmJ-UMEpFY-bE4okw-qhNC4r-czyScJ-SdMEUJ-TiNCas-fgvdL7-9UzALP-fgfZmP-aLA7LX-LdyrJ-GF18aG-DL33rM-2dH3khE-8Xg1ef-jJPHVh-Wq4Sw1-diuoch-bruQnA-fcxKwm-QC44H2-k8zTpt-UUCDa3-9UaCeW-rUM1AD-WDQpq1-cozu8j-b2j6Xz-fA3MF8-WBN6jh-UU567N-cwAUuA-aZP6Tt-k8zH9i-bWmTn1"
  },
  {
    item: "Star Wars",
    category: "action figures",
    description: "Massive Star Wars collection",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/8621/16259010897_bfbdd51011_k.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/doc_brown/16259010897/in/photolist-qLKFu6-ZtJwsy-eAyRj2-25jmMKr-5JqCV3-9moxrU-2jc5Dc6-bPDU1n-piAwYE-5JfNdh-bAKfmA-8hMz4-bAwFYQ-wv139d-W2VkuY-ST7tnS-r3X2Bf-2bKKM9d-62GuMc-qAtisK-6W9Mub-u52S7-6w7ySr-oDywds-4ueLwK-7Xgdzw-bPDU3V-bPDTNZ-bAKeW1-KgakN-c7dXLo-c7aJjS-s8sbhs-7U4QqH-cS4DdL-21QdS7j-qLBcv7-UoXwZj-bAwFXj-bAPwSb-bAPwX1-W2Vkof-2maK6dU-2iw3e6y-2maSzhx-ivrFSP-6F5na3-bPrk7H-2kLv7NP-bAwFZU"
  },
  {
    item: "Lethal Water Gun",
    category: "outdoor toys",
    description: "Really strong pump action water gun.",
    condition: 0,
    flickr_image_url: "https://live.staticflickr.com/5184/5653390473_15808f7642_b.jpg",
    flickr_imagepage_url: "https://www.flickr.com/photos/britanglishman/5653390473/in/photolist-2jZA5Tm-2haYSi4-2mhnEnU-2mi3m6K-2jMKzaQ-2jZKunx-2k3tS5j-2kBkha4-2mwNPed-2kUmdm3-2is7KNb-2mo7fgY-2mo3ALS-9Bz72x-qoUrqX-2jgXntm-2m6q8c7-4AbSVa-9YYDqH-52cQ5m-9BC6rb-CTk4ej-2hSaXqB-2aXnR2F-4Ag9s1-2mo2kTA-2mgyUjM-5Adove-2gpc9TE-2mdMfws-ph11Uz-28BTmPd-2gzajmR-2iLVdta-s6bDZs-9Bz92F-5BYksm-8dngjw-9Bz9Hn-s6kdE2-snKjBR-KRU7tb-52cgwG-9BC7cL-2gWMHMX-snKtBe-s4ste8-snM4EB-2jMVjkk-8rPtNi"
  },
]

puts "creating users"
dotdotdot
puts ""
address = [
  {
    place: "Tokyo",
    geolocation: [139.77, 35.68]
  },
  {
    place: "London",
    geolocation: [-0.12764739999999997, 51.507321899999994]
  },
  {
    place: "Chiba",
    geolocation: [140.12333, 35.605]
  },
  {
    place: "Hiroshima",
    geolocation: [132.75, 34.43333]
  }
]

louis = User.create!(name: "louis",  email: "louis@lewagon.com", password: "123456789", address: address[0][:place], child_age: 5, latitude: address[0][:geolocation][0], longitude: address[0][:geolocation][1])
puts "Louis. place: #{louis.address} latitude: #{louis.latitude} longitude: #{louis.longitude}"
gareth = User.create!(name: "gareth", email: "gareth@lewagon.com", password: "123456789", address: address[1][:place], child_age: 1, latitude: address[1][:geolocation][0], longitude: address[1][:geolocation][1])
puts "Gareth. place: #{gareth.address} latitude: #{gareth.latitude} longitude: #{gareth.longitude}"
emanuel = User.create!(name: "emanuel", email: "emanuel@lewagon.com", password: "123456789", address: address[2][:place], child_age: 9, latitude: address[2][:geolocation][0], longitude: address[2][:geolocation][1] )
puts "Emanuel. place: #{emanuel.address} latitude: #{emanuel.latitude} longitude: #{emanuel.longitude}"
anju = User.create!(name: "anju", email: "anju@lewagon.com", password: "123456789", address: address[3][:place], child_age: 4, latitude: address[3][:geolocation][0], longitude: address[3][:geolocation][1])
puts "Anju. place: #{anju.address} latitude: #{anju.latitude} longitude: #{anju.longitude}"

users = [gareth, anju, emanuel, louis]

puts "created 4 users"

puts "creating toys. This is going to take a bit of time because of the url grabbing and cloudinary."
dotdotdot
puts ""
flickr_toy_collection_array.each_with_index do |item, index|
  toy_image_file = URI.open(item[:flickr_image_url])
  image_filename = item[:item].gsub(" ", "") + item[:flickr_image_url][35..44]

  toy = Toy.create!(
    user:users.sample, # random owner # A user can have many toys, but a toy only has one owner (Ask Sheriff Woody for more info)
    name:item[:item],
    description:item[:description],
    category:item[:category],
    condition:rand(0..2),
    # dates_available:Date.today,
    price:rand(1..10) * 100, # price rounded to 100
    photo_url:item[:flickr_image_url])

  toy.photo.attach(io: toy_image_file, filename: item[:item].gsub(" ", ""), content_type: 'image/jpg')
  puts "Toy id: #{toy.id} #{item[:item]}. Price: #{toy.price}. Toy Owner: #{toy.user.name}"

end

puts "created #{Toy.count} toys."

puts "creating bookings"
puts "booking 3 toys to test the availability filter."
dotdotdot
puts ""

today = DateTime.now.to_date

booking_before_availability_window = [(today - 14).to_date, (today - 9).to_date]
booking_after_availability_window = [(today + 14).to_date, (today + 19).to_date]
booking_within_availability_window  = [(today + 3).to_date, (today + 12).to_date]

availability_tester = [booking_before_availability_window, booking_after_availability_window, booking_within_availability_window]
availability_notes = [
  "IS AVAILABLE: A booking made for 2 weeks ago for 5 days: fnishes before the start of the 1 week availability window",
  "IS AVAILABLE: A booking made for 2 weeks in the future for 5 days: starts after the end of the availability window",
  "IS NOT AVAILABLE: A booking made for 3 days from now for 8 days:"
]
i = 0
while i < 3 do
  random_booking_creator = users[rand(0..3)]
  booking = Booking.create!(
    user: random_booking_creator, # random booking person
    start_date: availability_tester[i][0],
    end_date: availability_tester[i][1],
    delivery_option: 1,
    user_id: random_booking_creator.id, # random booking person
    toy_id: Toy.all.sample.id # random toy to be booked
  )
  puts availability_notes[i]
  # puts "#{Toy.all.sample.id}"
  puts "Booking id: #{booking.id} #{booking.toy.name} Toy owner: #{booking.toy.user.name} Booked by: #{booking.user.name} Booked from: #{booking.start_date}, until: #{booking.end_date}"
  puts ""
  i += 1
end

puts "bookings created"
