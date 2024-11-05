import 'package:doviz_clone_app/models/fuel_model/fuel_seller_model.dart';
import 'package:doviz_clone_app/models/news_model/news.model.dart';
import 'package:doviz_clone_app/views/menu_view/pages/fuel_views/all_fuel_news.dart';
import 'package:doviz_clone_app/views/screens/news_view/news_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FuelsView extends StatefulWidget {
  const FuelsView({super.key});

  @override
  State<FuelsView> createState() => _FuelsViewState();
}

class _FuelsViewState extends State<FuelsView> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  final GlobalKey _categoryKey = GlobalKey();

  List<String> categories = [
    'Benzin',
    'Motorin',
    'LPG',
  ];

  List<FuelSellerList> fuelSellerList = FuelSellerList.fuelSellerList;

  List<_FuelValueGraphicData> data = [
    _FuelValueGraphicData('17 Eki', 44.7),
    _FuelValueGraphicData('18 Eki', 44.7),
    _FuelValueGraphicData('19 Eki', 44.7),
    _FuelValueGraphicData('20 Eki', 44.7),
    _FuelValueGraphicData('21 Eki', 44.7),
    _FuelValueGraphicData('22 Eki', 42.8),
    _FuelValueGraphicData('23 Eki', 42.8),
    _FuelValueGraphicData('24 Eki', 42.8),
  ];

  String selectedRange = '1H';

  // Şehir ve İlçeler için değişkenler
  String selectedCity = 'İstanbul Avrupa';
  String selectedDistrict = 'Fatih';
  Map<String, List<String>> citiesAndDistricts = {
    'İstanbul Avrupa': [
      'Arnavutköy',
      'Avcılar',
      'Bağcılar',
      'Bahçelievler',
      'Bakırköy',
      'Başakşehir',
      'Bayrampaşa',
      'Beşiktaş',
      'Beylikdüzü',
      'Beyoğlu',
      'Büyükçekmece',
      'Çatalca',
      'Esenler',
      'Esenyurt',
      'Eyüpsultan',
      'Fatih',
      'Gaziosmanpaşa',
      'Güngören',
      'Kağıthane',
      'Küçükçekmece',
      'Sarıyer',
      'Silivri',
      'Sultangazi',
      'Şişli',
      'Zeytinburnu',
    ],
    'İstanbul Anadolu': [
      'Adalar',
      'Ataşehir',
      'Beykoz',
      'Çekmeköy',
      'Kadıköy',
      'Kartal',
      'Maltepe',
      'Pendik',
      'Sancaktepe',
      'Sultanbeyli',
      'Şile',
      'Tuzla',
      'Ümraniye',
      'Üsküdar',
    ],
    'Ankara': [
      'Akyurt',
      'Altındağ',
      'Ayaş',
      'Bala',
      'Beypazarı',
      'Çamlıdere',
      'Çankaya',
      'Çubuk',
      'Elmadağ',
      'Etimesgut',
      'Evren',
      'Gölbaşı',
      'Güdül',
      'Haymana',
      'Kahramankazan',
      'Kalecik',
      'Keçiören',
      'Kızılcahamam',
      'Mamak',
      'Nallıhan',
      'Polatlı',
      'Pursaklar',
      'Sincan',
      'Şereflikoçhisar',
      'Yenimahalle',
    ],
    'İzmir': [
      'Aliağa',
      'Balçova',
      'Bayındır',
      'Bayraklı',
      'Bergama',
      'Beydağ',
      'Bornova',
      'Buca',
      'Çeşme',
      'Çiğli',
      'Dikili',
      'Foça',
      'Gaziemir',
      'Güzelbahçe',
      'Karabağlar',
      'Karaburun',
      'Karşıyaka',
      'Kemalpaşa',
      'Kınık',
      'Kiraz',
      'Konak',
      'Menderes',
      'Menemen',
      'Narlıdere',
      'Ödemiş',
      'Seferihisar',
      'Selçuk',
      'Tire',
      'Torbalı',
      'Urla',
    ],
    'Adana': [
      'Aladağ',
      '',
      'Ceyhan',
      'Çukurova',
      'Feke',
      'İmamoğlu',
      'Karaisalı',
      'Karataş',
      'Kozan',
      'Pozantı',
      'Saimbeyli',
      'Sarıçam',
      'Seyhan',
      'Tufanbeyli',
      'Yumurtalık',
      'Yüreğir',
    ],
    'Adıyaman': [
      'Besni',
      'Çelikhan',
      'Gerger',
      'Gölbaşı',
      'Kahta',
      'Merkez',
      'Samsat',
      'Sincik',
      'Tut',
    ],
    'Afyonkarahisar': [
      'Basmakçı',
      'Bayat',
      'Bolvadin',
      'Çay',
      'Çobanlar',
      'Dazkırı',
      'Dinar',
      'Emirdağ',
      'Evciler',
      'Hocalar',
      'İhsaniye',
      'İscehisar',
      'Kızılören',
      'Merkez',
      'Sandıklı',
      'Sinanpaşa',
      'Sultandağlı',
      'Şuhut',
    ],
    'Ağrı': [
      'Diyadin',
      'Doğubeyazıt',
      'Eleşkirt',
      'Hamur',
      'Merkez',
      'Patnos',
      'Taşlıçay',
      'Tutak',
    ],
    'Aksaray': [
      'Ağaçören',
      'Eskil',
      'Gülağaç',
      'Güzelyurt',
      'Merkez',
      'Ortaköy',
      'Sarıyahşi',
      'Sultanhanı',
    ],
    'Amasya': [
      'Göynücek',
      'Gümüşhacıköy',
      'Hamamözü',
      'Merkez',
      'Merzifon',
      'Suluova',
      'Taşova',
    ],
    'Antalya': ['Kepez', 'Konyaaltı', 'Muratpaşa'],
    'Ardahan': ['Çıldır', 'Damal', 'Göle', 'Hanak', 'Merkez', 'Posof'],
    'Artvin': [
      'Ardanuç',
      'Arhavi',
      'Borçka',
      'Hopa',
      'Kemalpaşa',
      'Merkez',
      'Murgul',
      'Şavşat',
      'Yusufeli',
    ],
    'Aydın': [
      'Bozdoğan',
      'Buharkent',
      'Çine',
      'Didim',
      'Efeler',
      'Germencik',
      'İncirliova',
      'Karacasu',
      'Karpuzlu',
      'Koçarlı',
      'Köşk',
      'Kuşadası',
      'Kuyucak',
      'Nazilli',
      'Söke',
      'Sultanhisar',
      'Yenipazar',
    ],
    'Balıkesir': [
      'Altıeylül',
      'Ayvalık',
      'Balya',
      'Bandırma',
      'Bigadiç',
      'Burhaniye',
      'Dursunbey',
      'Edremit',
      'Erdek',
      'Gömeç',
      'Gönen',
      'Havran',
      'İvrindi',
      'Karesi',
      'Kepsut',
      'Manyas',
      'Marmara',
      'Savaştepe',
      'Sındırgı',
      'Susurluk',
    ],
    'Bartın': ['Amasra', 'Kuruçaşile', 'Merkez', 'Ulus'],
    'Batman': ['Beşiri', 'Gerçüş', 'Hasankeyf', 'Kozluk', 'Merkez', 'Sason'],
    'Bayburt': ['Aydıntepe', 'Demirözü', 'Merkez'],
    'Bilecik': [
      'Bozüyük',
      'Gölpazarı',
      'İnhisar',
      'Merkez',
      'Osmaneli',
      'Pazaryeri',
      'Söğüt',
      'Yenipazar',
    ],
    'Bingöl': [
      'Adaklı',
      'Genç',
      'Karlıova',
      'Kiğı',
      'Merkez',
      'Solhan',
      'Yayladere',
      'Yedisu',
    ],
    'Bitlis': [
      'Adilcevaz',
      'Ahlat',
      'Güroymak',
      'Hizan',
      'Merkez',
      'Mutki',
      'Tatvan',
    ],
    'Bolu': [
      'Dörtdivan',
      'Gerede',
      'Göynük',
      'Kıbrıscık',
      'Mengen',
      'Merkez',
      'Mudurnu',
      'Seben',
      'Yeniçağa',
    ],
    'Burdur': [
      'Ağlasun',
      'Altınyayla',
      'Bucak',
      'Çavdır',
      'Çeltikçi',
      'Çölhisar',
      'Karamanlı',
      'Kemer',
      'Merkez',
      'Tefenni',
      'Yeşilova',
    ],
    'Bursa': [
      'Büyükorhan',
      'Gemlik',
      'Gürsu',
      'Harmancık',
      'İnegöl',
      'İznik',
      'Karacabey',
      'Keles',
      'Kestel',
      'Mudanya',
      'Mustafakemalpaşa',
      'Nilüfer',
      'Orhaneli',
      'Orhangazi',
      'Osmangazi',
      'Yenişehir',
      'Yıldırım',
    ],
    'Çanakkale': [
      'Ayvacık',
      'Bayramiç',
      'Biga',
      'Bozcaada',
      'Çan',
      'Eceabat',
      'Ezine',
      'Gelibolu',
      'Gökçeada',
      'Lapseki',
      'Merkez',
      'Yenice',
    ],
    'Çankırı': [
      'Atkaracalar',
      'Bayramören',
      'Çerkeş',
      'Eldivan',
      'Ilgaz',
      'Kızılırmak',
      'Korgun',
      'Kurşunlu',
      'Merkez',
      'Orta',
      'Şabanözü',
      'Yapraklı',
    ],
    'Çorum': [
      'Alaca',
      'Bayat',
      'Boğazkale',
      'Dodurga',
      'İskilip',
      'Kargı',
      'Laçin',
      'Mecitözü',
      'Merkez',
      'Oğuzlar',
      'Ortaköy',
      'Osmancık',
      'Sungurlu',
      'Uğurludağ',
    ],
    'Denizli': [
      'Acıpayam',
      'Babadağ',
      'Baklan',
      'Bekilli',
      'Beyağaç',
      'Bozkurt',
      'Buldan',
      'Çal',
      'Çameli',
      'Çardak',
      'Çivril',
      'Güney',
      'Honaz',
      'Kale',
      'Merkezefendi',
      'Pamukkale',
      'Sarayköy',
      'Serinhisar',
      'Tavas',
    ],
    'Diyarbakır': [
      'Bağlar',
      'Bismil',
      'Çermik',
      'Çınar',
      'Çüngüş',
      'Dicle',
      'Eğil',
      'Ergani',
      'Hani',
      'Hazro',
      'Kayapınar',
      'Kocaköy',
      'Kulp',
      'Lice',
      'Silvan',
      'Sur',
      'Yenişehir',
    ],
    'Düzce': [
      'Akçakoca',
      'Cumayeri',
      'Çilimli',
      'Gölyaka',
      'Gümüşova',
      'Kaynaşlı',
      'Merkez',
      'Yığılca',
    ],
    'Edirne': [
      'Enez',
      'Havsa',
      'İpsala',
      'Keşan',
      'Lalapaşa',
      'Meriç',
      'Merkez',
      'Süloğlu',
      'Uzunköprü',
    ],
    'Elazığ': [
      'Ağın',
      'Alacakaya',
      'Arıcak',
      'Baskil',
      'Karakoçan',
      'Keban',
      'Kovancılar',
      'Maden',
      'Merkez',
      'Palu',
      'Sivrice',
    ],
    'Erzincan': [
      'Çayırlı',
      'İliç',
      'Kemah',
      'Kemaliye',
      'Merkez',
      'Otlukbeli',
      'Refahiye',
      'Tercan',
      'Üzümlü',
    ],
    'Erzurum': [
      'Aşkale',
      'Aziziye',
      'Çat',
      'Hınıs',
      'Horasan',
      'İspir',
      'Karaçoban',
      'Karayazı',
      'Köprüköy',
      'Narman',
      'Oltu',
      'Olur',
      'Palandöken',
      'Pasinler',
      'Pazaryolu',
      'Şenkaya',
      'Tekman',
      'Tortum',
      'Uzundere',
      'Yakutiye',
    ],
    'Eskişehir': [
      'Alpu',
      'Beylikova',
      'Çifteler',
      'Günyüzü',
      'Han',
      'İnönü',
      'Mahmudiye',
      'Mihalgazi',
      'Mihalıççık',
      'Odunpazarı',
      'Sarıcakaya',
      'Seyitgazi',
      'Sivrihisar',
      'Tepebaşı',
    ],
    'Gaziantep': [
      'Araban',
      'İslahiye',
      'Karkamış',
      'Nizip',
      'Nurdağı',
      'Oğuzeli',
      'Şahinbey',
      'Şehitkamil',
      'Yavuzeli',
    ],
    'Giresun': [
      'Alucra',
      'Bulancak',
      'Çamoluk',
      'Çanakçı',
      'Dereli',
      'Doğankent',
      'Espiye',
      'Eynesil',
      'Görele',
      'Güce',
      'Keşap',
      'Merkez',
      'Piraziz',
      'Şebinkarahisar',
      'Tirebolu',
      'Yağlıdere',
    ],
    'Gümüşhane': ['Kelkit', 'Köse', 'Kürtün', 'Merkez', 'Şiran', 'Torul'],
    'Hakkari': ['Çukurca', 'Derecik', 'Merkez', 'Şemdinli', 'Yüksekova'],
    'Hatay': [
      'Altınözü',
      'Antakya',
      'Arsuz',
      'Belen',
      'Defne',
      'Dörtyol',
      'Erzin',
      'Hassa',
      'İskenderun',
      'Kırıkhan',
      'Kumlu',
      'Payas',
      'Reyhanlı',
      'Samandağ',
      'Yayladağı',
    ],
    'Iğdır': ['Aralık', 'Karakoyunlu', 'Merkez', 'Tuzluca'],
    'Isparta': [
      'Aksu',
      'Atabey',
      'Eğirdir',
      'Gelendost',
      'Gönen',
      'Keçiborlu',
      'Merkez',
      'Senirkent',
      'Sütçüler',
      'Şarkikaraağaç',
      'Uluborlu',
      'Yalvaç',
      'Yenişarbademli',
    ],
    'Kahramanmaraş': [
      'Afşin',
      'Andırın',
      'Çağlayancerit',
      'Dulkadiroğlu',
      'Ekinözü',
      'Elbistan',
      'Göksun',
      'Nurhak',
      'Onikişubat',
      'Pazarcık',
      'Türkoğlu',
    ],
    'Karabük': [
      'Eflani',
      'Eskipazar',
      'Merkez',
      'Ovacık',
      'Safranbolu',
      'Yenice',
    ],
    'Karaman': [
      'Ayrancı',
      'Başyayla',
      'Ermenek',
      'Kazımkarabekir',
      'Merkez',
      'Sarıveliler',
    ],
    'Kars': [
      'Akyaka',
      'Arpaçay',
      'Digor',
      'Kağızman',
      'Merkez',
      'Sarıkamış',
      'Selim',
      'Susuz',
    ],
    'Kastamonu': [
      'Abana',
      'Ağlı',
      'Araç',
      'Azdavay',
      'Bozkurt',
      'Cide',
      'Çatalzeytin',
      'Daday',
      'Devrekani',
      'Doğanyurt',
      'Hanönü',
      'İhsangazi',
      'İnebolu',
      'Küre',
      'Merkez',
      'Pınarbaşı',
      'Seydiler',
      'Şenpazar',
      'Taşköprü',
      'Tosya',
    ],
    'Kayseri': [
      'Akkışla',
      'Bünyan',
      'Develi',
      'Felahiye',
      'Hacılar',
      'İncesu',
      'Kocasinan',
      'Melikgazi',
      'Özvatan',
      'Pınarbaşı',
      'Sarıoğlan',
      'Sarız',
      'Talas',
      'Tomarza',
      'Yahyalı',
      'Yeşilhisar',
    ],
    'Kırıkkale': [
      'Bahşılı',
      'Balışeyh',
      'Çelebi',
      'Delice',
      'Karakeçili',
      'Keskin',
      'Merkez',
      'Sulakyurt',
      'Yahşihan',
    ],
    'Kırklareli': [
      'Babaeski',
      'Demirköy',
      'Kofçaz',
      'Lüleburgaz',
      'Merkez',
      'Pehlivanköy',
      'Pınarhisar',
      'Vize',
    ],
    'Kırşehir': [
      'Akçakent',
      'Akpınar',
      'Boztepe',
      'Çiçekdağı',
      'Kaman',
      'Merkez',
      'Mucur',
    ],
    'Kilis': ['Elbeyli', 'Merkez', 'Musabeyli', 'Polateli'],
    'Kocaeli': [
      'Başiskele',
      'Çayırova',
      'Darıca',
      'Derince',
      'Dilovası',
      'Gebze',
      'Gölcük',
      'İzmit',
      'Kandıra',
      'Karamürsel',
      'Kartepe',
      'Körfez',
    ],
    'Konya': [
      'Ahırlı',
      'Akören',
      'Akşehir',
      'Altınekin',
      'Beyşehir',
      'Bozkır',
      'Cihanbeyli',
      'Çeltik',
      'Çumra',
      'Derbent',
      'Derebucak',
      'Doğanhisar',
      'Emirgazi',
      'Ereğli',
      'Güneysınır',
      'Hadim',
      'Halkapınar',
      'Hüyük',
      'Ilgın',
      'Kadınhanı',
      'Karapınar',
      'Karatay',
      'Kulu',
      'Meram',
      'Sarayönü',
      'Selçuklu',
      'Seydişehir',
      'Taşkent',
      'Tuzlukçu',
      'Yalıhüyük',
      'Yunak',
    ],
    'Kütahya': [
      'Altıntaş',
      'Aslanapa',
      'Çavdarhisar',
      'Domaniç',
      'Dumlupınar',
      'Emet',
      'Gediz',
      'Hisarcık',
      'Merkez',
      'Pazarlar',
      'Simav',
      'Şaphane',
      'Tavşanlı',
    ],
    'Malatya': [
      'Akçadağ',
      'Arapgir',
      'Arguvan',
      'Battalgazi',
      'Darende',
      'Doğanşehir',
      'Doğanyol',
      'Hekimhan',
      'Kale',
      'Kuluncak',
      'Pütürge',
      'Yazıhan',
      'Yeşilyurt',
    ],
    'Manisa': [
      'Ahmetli',
      'Akhisar',
      'Alaşehir',
      'Demirci',
      'Gölmarmara',
      'Gördes',
      'Kırkağaç',
      'Köprübaşı',
      'Kula',
      'Salihli',
      'Sarıgöl',
      'Saruhanlı',
      'Selendi',
      'Soma',
      'Şehzadeler',
      'Turgutlu',
      'Yunusemre',
    ],
    'Mardin': [
      'Artuklu',
      'Dargeçit',
      'Derik',
      'Kızıltepe',
      'Mazıdağı',
      'Midyat',
      'Nusaybin',
      'Ömerli',
      'Savur',
      'Yeşilli',
    ],
    'Mersin': [
      'Akdeniz',
      'Anamur',
      'Aydıncık',
      'Bozyazı',
      'Çamlıyayla',
      'Erdemli',
      'Gülnar',
      'Mezitli',
      'Mut',
      'Silifke',
      'Tarsus',
      'Toroslar',
      'Yenişehir',
    ],
    'Muğla': [
      'Bodrum',
      'Dalaman',
      'Datça',
      'Fethiye',
      'Kavaklıdere',
      'Köyceğiz',
      'Marmaris',
      'Menteşe',
      'Milas',
      'Ortaca',
      'Seydikemer',
      'Ula',
      'Yatağan',
    ],
    'Muş': ['Bulanık', 'Hasköy', 'Korkut', 'Malazgirt', 'Merkez', 'Varto'],
    'Nevşehir': [
      'Acıgöl',
      'Avanos',
      'Derinkuyu',
      'Gülşehir',
      'Hacıbektaş',
      'Kozaklı',
      'Merkez',
      'Ürgüp',
    ],
    'Niğde': ['Altunhisar', 'Bor', 'Çamardı', 'Çiftlik', 'Merkez', 'Ulukışla'],
    'Ordu': [
      'Akkuş',
      'Altınordu',
      'Aybastı',
      'Çamaş',
      'Çatalpınar',
      'Çaybaşı',
      'Fatsa',
      'Gölköy',
      'Gülyalı',
      'Gürgentepe',
      'İkizce',
      'Kabadüz',
      'Kabataş',
      'Korgan',
      'Kumru',
      'Mesudiye',
      'Perşembe',
      'Ulubey',
      'Ünye',
    ],
    'Osmaniye': [
      'Bahçe',
      'Düziçi',
      'Hasanbeyli',
      'Kadirli',
      'Merkez',
      'Sumbas',
      'Toprakkale',
    ],
    'Rize': [
      'Ardeşen',
      'Çamlıhemşin',
      'Çayeli',
      'Derepazarı',
      'Fındıklı',
      'Güneysu',
      'Hemşin',
      'İkizdere',
      'İyidere',
      'Kalkandere',
      'Merkez',
      'Pazar',
    ],
    'Sakarya': [
      'Adapazarı',
      'Akyazı',
      'Arifiye',
      'Erenler',
      'Ferizli',
      'Geyve',
      'Hendek',
      'Karapürçek',
      'Karasu',
      'Kaynarca',
      'Kocaali',
      'Pamukova',
      'Sapanca',
      'Serdivan',
      'Söğütlü',
      'Taraklı',
    ],
    'Samsun': [
      '19 mayıs',
      'Alaçam',
      'Asarcık',
      'Atakum',
      'Ayvacık',
      'Bafra',
      'Canik',
      'Çarşamba',
      'Havza',
      'İlkadım',
      'Kavak',
      'Ladik',
      'Salıpazarı',
      'Tekkeköy',
      'Terme',
      'Vezirköprü',
      'Yakakent',
    ],
    'Siirt': [
      'Baykan',
      'Eruh',
      'Kurtalan',
      'Merkez',
      'Pervari',
      'Şirvan',
      'Tillo',
    ],
    'Sinop': [
      'Ayancık',
      'Boyabat',
      'Dikmen',
      'Durağan',
      'Erfelek',
      'Gerze',
      'Merkez',
      'Saraydüzü',
      'Türkeli',
    ],
    'Sivas': [
      'Akıncılar',
      'Altınyayla',
      'Divriği',
      'Doğanşar',
      'Gemerek',
      'Gölova',
      'Gürün',
      'Hafik',
      'İmranlı',
      'Kangal',
      'Koyulhisar',
      'Merkez',
      'Suşehri',
      'Sarkışla',
      'Ulaş',
      'Yıldızeli',
      'Zara',
    ],
    'Şanlıurfa': [
      'Akçakale',
      'Birecik',
      'Bozova',
      'Ceylanpınar',
      'Eyyübiye',
      'Halfeti',
      'Haliliye',
      'Harran',
      'Hilvan',
      'Karaköprü',
      'Siverek',
      'Suruç',
      'Viranşehir',
    ],
    'Şırnak': [
      'Beytüşşebap',
      'Cizre',
      'Güçlükonak',
      'İdil',
      'Merkez',
      'Silopi',
      'Uludere',
    ],
    'Tekirdağ': [
      'Çerkezköy',
      'Çorlu',
      'Ergene',
      'Hayrabolu',
      'Kapaklı',
      'Malkara',
      'Marmaraereğlisi',
      'Muratlı',
      'Saray',
      'Süleymanpaşa',
      'Şarköy',
    ],
    'Tokat': [
      'Almus',
      'Artova',
      'Başçiftlik',
      'Erbaa',
      'Merkez',
      'Niksar',
      'Pazar',
      'Reşadiye',
      'Sulusaray',
      'Turhal',
      'Yeşilyurt',
      'Zile',
    ],
    'Trabzon': [
      'Akçaabat',
      'Araklı',
      'Arsin',
      'Beşikdüzü',
      'Çarşıbaşı',
      'Çaykara',
      'Dernekpazarı',
      'Düzköy',
      'Hayrat',
      'Köprübaşı',
      'Maçka',
      'Of',
      'Ortahisar',
      'Sürmene',
      'Şalpazarı',
      'Tonya',
      'Vakfıkebir',
      'Yomra',
    ],
    'Tunceli': [
      'Çemişgezek',
      'Hozat',
      'Mazgirt',
      'Merkez',
      'Nazımiye',
      'Ovacık',
      'Pertek',
      'Pülümür',
    ],
    'Uşak': ['Banaz', 'Eşme', 'Karahallı', 'Merkez', 'Sivaslı', 'Ulubey'],
    'Van': [
      'Bahçesaray',
      'Başkale',
      'Çaldıran',
      'Çatak',
      'Edremit',
      'Erciş',
      'Gevaş',
      'Gürpınar',
      'İpekyolu',
      'Muradiye',
      'Özalp',
      'Saray',
      'Tuşba',
    ],
    'Yalova': [
      'Altınova',
      'Armutlu',
      'Çınarcık',
      'Çiftlikköy',
      'Merkez',
      'Termal',
    ],
    'Yozgat': [
      'Akdağmadeni',
      'Aydıncık',
      'Boğazlıyan',
      'Çandır',
      'Çayıralan',
      'Çekerek',
      'Kadışehri',
      'Merkez',
      'Saraykent',
      'Sarıkaya',
      'Sorgun',
      'Şefaatli',
      'Yenifakılı',
      'Yerköy',
    ],
    'Zonguldak': [
      'Alaplı',
      'Çaycuma',
      'Devrek',
      'Ereğli',
      'Gökçebey',
      'Kilimli',
      'Kozlu',
      'Merkez',
    ],
  };

  String todaysDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  List<News> newsList = News.newsList;
  List<News> fuelNews =
      News.newsList.where((news) => news.category == 'Emtia').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 25),
            const Text(
              'Akaryakıt',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildCategoryMenu(),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                itemCount: categories.length,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  scrollToCategory(index);
                },
                itemBuilder: (context, index) {
                  return buildFuelGraphic(index);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildCityAndDistrictComboBoxes(),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    'Dağıtıcı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      fuelSellerList[index].fuelSellerImage,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    fuelSellerList[index].fuelSellerName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    todaysDate,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    2.45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF213432),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF3ff5d6),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Benzin',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].gasolinePrice}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    2.45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2c222a),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFaf4780), // Mor renk
                                            Color(0xFF405db0), // Mavi renk
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Motorin',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].dieselPrice}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    3.5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF333327),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFf6ed78),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'LPG (Otogaz)',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                          maxLines: 2,
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].lpgPrice}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: fuelSellerList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllFuelNews(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      'Akaryakıt Fiyatları Haberleri',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                newsList: fuelNews, // Pass all news
                                initialIndex: index, // Pass the selected index
                                selectedCategory:
                                    'Emtia', // Pass the category of the selected news
                              ),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 10 * 3.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  fuelNews[index].imageUrl,
                                  width: 120,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fuelNews[index].category.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFF86909b),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      10 *
                                      5.5,
                                  child: Text(
                                    fuelNews[index].title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${fuelNews[index].date} ${fuelNews[index].time}',
                                  style: const TextStyle(
                                    color: Color(0xFFcaccd1),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryMenu() {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(selectedIndex);
              });
              scrollToCategory(index);
            },
            child: Column(
              children: [
                Padding(
                  key: selectedIndex == index ? _categoryKey : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.grey,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (selectedIndex == index)
                  Container(
                    height: 2,
                    width: 110,
                    color: Colors.white,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void scrollToCategory(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categoryBox =
          _categoryKey.currentContext?.findRenderObject() as RenderBox?;
      if (categoryBox != null) {
        final categoryPosition = categoryBox.localToGlobal(Offset.zero).dx;
        final screenWidth = MediaQuery.of(context).size.width;

        final scrollPosition =
            categoryPosition - (screenWidth / 2) + (categoryBox.size.width / 2);
        _scrollController.animateTo(
          scrollPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget buildFuelGraphic(int categoryIndex) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['1H', '1A', '3A', '6A', '1Y', '5Y', 'Tümü'].map((range) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRange = range;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: selectedRange == range
                        ? const Color(0xFF0c66c6)
                        : Colors.black,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    range,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              axisLine: AxisLine(width: 0),
              labelStyle: TextStyle(color: Color(0xFF3a3a3a)),
            ),
            primaryYAxis: const NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              axisLine: AxisLine(width: 0),
              labelStyle: TextStyle(color: Color(0xFF3a3a3a)),
            ),
            plotAreaBorderWidth: 0,
            tooltipBehavior: TooltipBehavior(enable: true),
            trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              markerSettings: const TrackballMarkerSettings(
                markerVisibility: TrackballVisibilityMode.visible,
                width: 10,
                height: 10,
                borderWidth: 3,
                borderColor: Colors.red,
                color: Colors.white,
              ),
              tooltipSettings: const InteractiveTooltip(
                format: 'point.y',
                borderColor: Colors.red,
                borderWidth: 2,
                textStyle: TextStyle(color: Colors.white),
                color: Colors.red,
              ),
            ),
            series: <CartesianSeries<_FuelValueGraphicData, String>>[
              AreaSeries<_FuelValueGraphicData, String>(
                dataSource: data,
                xValueMapper: (_FuelValueGraphicData sales, _) => sales.day,
                yValueMapper: (_FuelValueGraphicData sales, _) =>
                    sales.cryptoValue,
                name: 'Value',
                color: const Color(0xFF1e0e11),
                borderColor: Colors.red,
                borderWidth: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCityAndDistrictComboBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildCityComboBox(),
        const SizedBox(height: 10),
        buildDistrictComboBox(),
      ],
    );
  }

  Widget buildCityComboBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButton<String>(
        value: selectedCity,
        dropdownColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(color: Colors.white),
        isExpanded: true,
        underline: const SizedBox(),
        items: citiesAndDistricts.keys
            .map<DropdownMenuItem<String>>((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCity = newValue!;
            selectedDistrict = citiesAndDistricts[selectedCity]!.first;
          });
        },
      ),
    );
  }

  Widget buildDistrictComboBox() {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButton<String>(
        value: selectedDistrict,
        dropdownColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(color: Colors.white),
        isExpanded: true,
        underline: const SizedBox(),
        items: citiesAndDistricts[selectedCity]!
            .map<DropdownMenuItem<String>>((String district) {
          return DropdownMenuItem<String>(
            value: district,
            child: Text(district),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedDistrict = newValue!;
          });
        },
      ),
    );
  }
}

class _FuelValueGraphicData {

  _FuelValueGraphicData(this.day, this.cryptoValue);
  final String day;
  final double cryptoValue;
}
