class ArticleList {
  ArticleList(
    this.articleImage,
    this.articleTitle,
    this.articleDate,
    this.articleTime,
    this.readingTime,
    this.articleContent,
  );
  late String articleImage;
  late String articleTitle;
  late String articleDate;
  late String articleTime;
  late int readingTime;
  late String articleContent;

  static List<ArticleList> articleList = [
    ArticleList(
      'https://static.doviz.com/news/f-k-orani-nedir-ideal-f-k-orani-kac-olmalidir-1703250030.jpg',
      'F/K oranı nedir? İdeal F/K oranı kaç olmalıdır?',
      '26.03.2023',
      '18.34',
      11,
      'Borsada işlem gören hisse senetlerini analiz etmek için yatırımcılar temel ve teknik analiz yöntemlerini sıklıkla kullanır.',
    ),
    ArticleList(
      'https://static.doviz.com/news/darphane-altin-sertifikasi-nedir-fiziki-altina-donusturulebilir-mi-1703250033.jpg',
      'Darphane Altın Sertifikası nedir? Fiziki altına dönüştürülebilir mi?',
      '28.05.2023',
      '23:27',
      9,
      'Bireylerin tasarruflarını korumak ve kar elde edebilmek amacıyla uzun yıllardır güvenilir yatırım araçlarından biri olarak gördüğü altına zaman içerisinde değişen ihtiyaçlar sebebiyle alternatif yatırım yolları getirilmiştir. ',
    ),
    ArticleList(
      'https://static.doviz.com/news/yatirim-icin-altin-mi-gumus-mu-alinmali-avantaj-ve-dezavantajlar-neler-1703250034.jpg',
      'Yatırım için altın mı gümüş mü alınmalı?: Avantaj ve dezavantajlar neler?',
      '07.08.2023',
      '08.14',
      8,
      'Altın ve gümüş, hem değer saklama hem de enflasyondan korunma amacı taşıyan kişiler için uzun yıllardır iki popüler yatırım aracıdır.',
    ),
    ArticleList(
      'https://static.doviz.com/news/dunyanin-en-buyuk-petrol-ureticileri-ve-piyasaya-etkileri-1703250036.jpg',
      'Dünyanın en büyük petrol üreticileri ve piyasaya etkileri',
      '02.10.2023',
      '17.27',
      7,
      'Hızla artan dünya nüfusu başta sanayileşme olmak üzere enerjiye olan talebin önemine dikkat çekmekte ve bu talebi karşılayamayan ülkelerin bazı riskler ile karşı karşıya kalmasına yol açmaktadır. Bu durum da petrolü elinde tutan ülkelerin küresel çapta güç sahibi olduğuna işaret etmektedir.',
    ),
    ArticleList(
      'https://static.doviz.com/news/teknik-analiz-nedir-teknik-analiz-yontemleri-nelerdir-1703250031.jpg',
      'Teknik analiz nedir? Teknik analiz yöntemleri nelerdir?',
      '16.04.2023',
      '21.32',
      12,
      'Yatırımcılar finansal piyasalarda volatilitenin arttığı dönemlerde genellikle borsa ve altın gibi yatırımları için en iyi stratejiyi bulmayı ve bu hedef doğrultusunda bireysel ihtiyaçları ile yatırım tercihlerine yönelik uygun yatırımı yapabilmeyi amaçlar.',
    ),
    ArticleList(
      'https://static.doviz.com/news/vix-endeksi-nedir-volatiliteden-nasil-korunulur-1703250027.jpg',
      'VIX Endeksi nedir? Volatiliteden nasıl korunulur?',
      '01.01.2023',
      '18.04',
      9,
      'Finansal bir yatırım enstrümanın fiyatının belirli bir süre içinde aniden artması veya azalması olarak tanımlanan volatilite, piyasalarda dalgalanma ya da oynaklık olarak da bilinir.',
    ),
    ArticleList(
      'https://static.doviz.com/news/temettu-nedir-temettu-yatirim-stratejileri-nelerdir-1703250025.jpg',
      'Temettü nedir? Temettü yatırım stratejileri nelerdir?',
      '06.11.2022',
      '18.59',
      13,
      'Pek çok yatırımcının aklına gelen ilk yatırım seçeneği hisse senetleridir. Yatırımcılar, hisse senetlerine yatırım yaparak şirket hisselerinin değer kazandığı dönemlerde kâr elde ederler. ',
    ),
    ArticleList(
      'https://static.doviz.com/news/nasil-emekli-olunur-emeklilik-maasini-artirmanin-yollari-nelerdir-1703250027.jpg',
      'Nasıl emekli olunur? Emeklilik maaşını artırmanın yolları nelerdir?',
      '11.12.2022',
      '18.53',
      10,
      'Bireylerin yıllarca süren yoğun çalışma hayatındaki en büyük motivasyonu emeklilik döneminde refaha ulaşmaktır.',
    ),
    ArticleList(
      'https://static.doviz.com/news/tarihi-borsa-acik-artirmasi-coinex-epic-sat-basladi-1713967129.jpg',
      "Tarihi borsa açık artırması: CoinEx 'Epic Sat' başladı",
      '24.04.2024',
      '16:58',
      2,
      "Dünyanın en büyük üçüncü madencilik havuzu olan ViaBTC tarafından öne çıkarılan dördüncü 'epic sat' şu anda kripto para borsası CoinEx'te açık artırmaya sunuluyor. CoinEx kullanıcıları, açık artırma sayfasına eriştikten sonra tekliflerini minimum 1 BTC olarak  verebiliyor.",
    ),
    ArticleList(
      'https://static.doviz.com/news/bitcoin-halving-e-detayli-bakis-kripto-ve-kuresel-finans-dinamikleri-hakkinda-analizler-1710078699.jpg',
      'Bitcoin Halving’e detaylı bakış: Kripto ve küresel finans dinamikleri hakkında analizler',
      '10.03.2024',
      '16.51',
      7,
      "Bitcoin Yarılanması, 2009'daki başlangıcından bu yana protokolün ayrılmaz bir parçası olmuştur. Satoshi Nakamoto'nun bilinçli bir seçimini yansıtan bu olay, sınırlandırılmış 21 milyon arza sahip Bitcoin’lerin, madenciliği yapılarak işlem doğrulaması karşılığında katılımcılara ödül olarak verilmesi işlemi için kullanılmaktadır. Yaklaşık olarak her 4 yılda bir ya da her 210.000 blokta bir meydana gelen bu süreç içerisinde yeni bir bloğun madenciliği için verilen ödül, yarı yarıya düşürülmektedir (şu anda blok ödülü 6,25 BTC’dir). Buna göre teknik olarak 2140 yılında sona erecek yarılanma süreci yıllar içerisinde arzı kademeli olarak azaltacaktır.",
    ),
    ArticleList(
      'https://static.doviz.com/news/bitcoin-yarilanma-oncesi-64-bin-dolari-test-etti-istanbul-ve-manila-daki-gizemli-panolarin-sirri-cozuldu-1709197632.jpg',
      "İstanbul ve Manila'daki gizemli panoların sırrı çözüldü: Bitcoin, yarılanma öncesi 64 bin doları test etti",
      '29.02.2024',
      '12.07',
      3,
      "Bitcoin, Kasım 2021'den sonra ilk kez 64 bin doları test ettikten sonra 63 bin dolar sınırından işlem görmeye başladı. Bitcoin’in bu yükselişinin hemen öncesinde 26 Şubat tarihinde ise İstanbul ve Manila’daki kişiler, alışılmadık bir manzarayla karşılaştı. Buna göre 'Bitcoin Yarılanması: Az Çoktur' ifadesinin yer aldığı reklam panolarında, 2024 Bitcoin Yarılanması’na ilişkin tanıtım videoları oynatıldı. Bu gizemli reklam panoları yaklaşan Bitcoin Yarılanması’na işaret ederken, arkasında kimin olduğu konusundaki spekülasyonların da artmasına yol açtı.",
    ),
    ArticleList(
      'https://static.doviz.com/news/yeni-baslayanlara-14-adimda-borsa-nedir-1703250018.jpg',
      "Yeni Başlayanlara 14 Adımda 'Borsa Nedir?'",
      '21.10.2019',
      '17:11',
      11,
      'Borsa, hisse senetleri, borçlanma araçları ve yatırım fonları gibi menkul değerler ve petrol, altın, kahve gibi emtianın alınıp satıldığı düzenli ve denetlenen piyasalara verilen genel bir isimdir.',
    ),
    ArticleList(
      'https://static.doviz.com/news/davranissal-finans-nedir-geleneksel-finans-teorileriyle-arasindaki-farklar-nelerdir-1713876879.jpg',
      'Davranışsal finans nedir? Geleneksel finans teorileriyle arasındaki farklar nelerdir?',
      '19.11.2023',
      '18.06',
      6,
      'Bireyler yatırım kararı alırken duyguların, varsayımların ve kişisel bakış açılarının etkisiyle hata yapmaya eğilimlidir. Bu açıdan bakıldığında yatırımcıların ruh hallerindeki değişimler, bazı yanlış kararlar alınabileceğini göstermektedir. Bu durum ise bireylerin davranışlarının incelenmesini gerekli kılmaktadır.',
    ),
    ArticleList(
      'https://static.doviz.com/news/proforma-fatura-nedir-nasil-kesilir-1703250000.jpg',
      'Proforma Fatura Nedir? Nasıl Kesilir?',
      '12.03.2019',
      '12.12',
      5,
      'Proforma fatura ürün veya hizmet satışı kesinleşmeden önce alıcıya gönderilen teklif niteliğindeki ön faturadır. Alıcı proforma fatura üzerinde yer alan fiyat, teslimat şekli, tarihi, yeri, ürün adedi vs gibi şartları kabul ederek bunlara istinaden sipariş vermesi durumunda proforma fatura ticari faturaya dönüştürülür. Proforma fatura, satış bedeli ve şartlarının onaylanmasını gerektiren hallerde ve ithalat /ihracat işlemlerinde malın yüklenmesinden ve ticari fatura kesilmeden önce alıcının onayının alınması amacıyla düzenlenenir. Proforma fatura ayrıca ihracat veya ithalat işlemlerinde akreditif açılması ve buna benzer diğer işlemlerin başlatılabilmesi için gerekli olan bir belgedir. Alıcı, proforma faturada belirtilen fiyat teslimat tarihi vs gibi şartları inceleyerek kesin sipariş vermeden önce gerekli düzeltmelerin yapılmasını talep edebilir. Proforma fatura düzenlenmesi ileride yaşanabilecek yanlış anlaşmaların ve zaman ve para kayıplarının önlenmesini sağlar. ',
    ),
  ];
}
