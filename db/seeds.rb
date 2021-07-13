User.create!(name:  "トマト",
    email: "tomato@example.com",
    password:              "samplepass",
    password_confirmation: "samplepass",
    id: 1
    )

User.create!(name:  "パスタ",
    email: "pasuta@example.com",
    password:              "samplepass",
    password_confirmation: "samplepass",
    id: 2
    )


Post.create!(content: "都心から約１時間の癒しの里山にキャンプ場があります。
    自社で野菜やお茶を作る他、その野菜を生かした直営の農園レストランや、オーガ
    ニックの自然食品コーナー、会員制の貸し農園、採れたて野菜がそのまま焼けるバ
    ーベキュー場、テニスコート貸し古民家など、農的な暮らしがゆったりと楽しめる
    場所になっています。また、提携の源泉かけ流しの天然温泉も近くにあります。眼
    下に広がる景色はこのエリアでも見晴らしの良い場所です。バーベキュー施設も隣
    接しており、のんびりと過ごす事が出来ます。テニスコート、レストラン。近くに
    は温泉もあるので緑の中でいろいろ楽しめます。 キャンピングカーにはベットが4
    台。ちょっと古いタイプなので、その点はご了承ください。備え付けのクーラーは
    ありますが、夏場は少し暑いかと思われます。冬はオイルヒーターがありますが、
    少し寒いです。小さい冷蔵庫はついており、またBBQ場での食器、調理器具などが
    お使い頂けます。ガス台利用でしたら無料、炭の利用には880円かかります。",
   title: "相模原キャンプ場",
   price: 5000,
   location: "神奈川県相模原市",
   id: 1,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sagamihara.jpg"), filename:"sagamihara.jpg"),
   user_id: 1
   )

Post.create!(content: "京阪神から1時間ちょっとで気軽に行け、自然を満喫でき
    るスポットして人気です。森林浴を楽しみながら、渓流沿いを散策できるハイキン
    グコースやゴルフ場、釣り堀などもございます。お車で10分のところにある『心と
    身体の癒しの森・温泉』では、岩盤浴やサウナ・露天風呂・プールなどが併設さ
    れており、お食事も可能です。",
   title: "京都ログハウス",
   price: 10000,
   location: "京都府",
   id: 2,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kyoto.jpg"), filename:"kyoto.jpg"),
   user_id: 1
   )

Post.create!(content: "全国的に有名な温泉地である北海道登別市にある物件です。
    ロフト付ログハウスで、薪ストーブをくべながら、ゆったりとした時間が過ごせます。
    建物すぐ裏には渓流が流れており、景色も良いです。当エリアにはスキーや工場夜景
    ・イルカウォッチング・サミット開催地となった洞爺湖温泉等の観光のほかに北海道
    （しかも噴火湾）ならではのグルメ（カニ・焼き鳥・白老牛・虎杖浜たらこ等）も楽
    しめる地域ですよ。千歳から自動車でおよそ1時間、札幌から1時間30分、函館から3
    時間の位置にあり各都市へのアクセスも良いです。木の丸太で組まれたログハウスで
    ロフトがあります。５～６人分のスペースは十分にあります。ぜひ、ご家族・カップ
    ル・お仲間でのスキー旅行や、夏場のキャンプ時にご利用はいかがですか？当物件の
    すぐ裏手の急傾斜と渓流は、危険ですから近づかないようにしてください。暖かい時
    期には釣り等も楽しめますが、道具はご自分でご用意頂き、救命胴衣を着用する等、
    安全面に気を付けてください。",
   title: "北海道ログハウス",
   price: 8000,
   location: "北海道登別市",
   id: 3,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/hokkaido.jpg"), filename:"hokkaido.jpg"),
   user_id: 1
   )

Post.create!(content: "スタジオ利用やコスプレ撮影、友人との宅飲みなど、
    横浜駅から徒歩7分の駅近、ブルックリン風なおしゃれなスペース、落ち着いた
    雰囲気となっておりますので、ゆったりしたゴロゴロスペースで癒されちゃってください。
    たこ焼き器もあるので女子会やパーティーにも最適ですよ。もちろん撮影スタジ
    オでも写真映えするのでおすすめです。皆様の予約お待ちしております
    不明点ございましたらお気軽にお問い合わせください",
   title: "横浜貸スペース",
   price: 4000,
   location: "神奈川県横浜市",
   id: 4,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/kanagawa.jpg"), filename:"kanagawa.jpg"),
   user_id: 2
   )

Post.create!(content: "東京都町田市にあるリハーサルスタジオ＆ライブハウスです。
    スタジオは全14部屋17畳以上、現在、営業時間が日によって変わっていますのでご注
    意ください。小田急線 町田駅東口から徒歩5分、JR横浜線 町田駅北口から徒歩10分",
   title: "町田音楽スタジオ",
   price: 6000,
   location: "神奈川県町田市",
   id: 5,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/studio.jpg"), filename:"studio.jpg"),
   user_id: 2
   )
   
