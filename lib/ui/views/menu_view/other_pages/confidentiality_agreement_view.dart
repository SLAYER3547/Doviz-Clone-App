import 'package:doviz_clone_app/core/bloc/currency_list_bloc/confidentiality_agreement_bloc/agreement_bloc.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/components/build_agreement_paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfidentialityAgreementView extends StatelessWidget {
  const ConfidentialityAgreementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: iconColor,
          ),
        ),
        title: const Text(
          'Gizlilik Ayarları',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildAgreementParagraph(
              paragraphTitle: 'Aydınlatma Metni',
              paragraphContent:
                  'Bu aydınlatma metni, 6698 sayılı Kişisel Verilerin Korunması Kanununun 10. maddesi ile Aydınlatma Yükümlülüğünün Yerine Getirilmesinde Uyulacak Usul ve Esaslar Hakkında Tebliğ kapsamında hazırlanmıştır.',
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'VERİ SORUMLUSU',
              paragraphContent:
                  'Kişisel verileriniz yönünden veri sorumlusu, Noktacom Medya İnternet Hizmetleri Sanayi ve Ticaret A.Ş. tüzel kişiliğidir.',
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'KİŞİSEL VERİLERİNİZİN İŞLENME AMACI',
              paragraphContent:
                  'Mobil uygulamamızı cihazlarınıza yüklemeniz halinde, IP bilginiz, Device ID bilginiz, ve trafik bilgilerinizden ibaret kişisel verileriniz, trafik bilgilerinin saklanması yükümlülüğümüzün yerine getirilmesi ve size özel reklam sunulması amaçlarıyla sınırlı olarak işlenmektedir.',
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'KİŞİSEL VERİLERİNİZİN AKTARILMASI',
              paragraphContent:
                  'Kişisel verileriniz, şirketimiz tarafından, gerekli olduğu ölçüde;\n •  Hukuki uyuşmazlıklarda kullanılmak üzere hukuk müşavirlerimize\n • Adli veya idari makamlarca ve kolluk kuvvetlerince talep edilmesi halinde ilgili makamlara,\n • IP ve Device ID bilgileriniz, size özel reklam sağlayıcılarına bu bilgilere erişim sağlanması yoluyla ve açık rıza vermeniz halinde aktarılmaktadır.',
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'VERİ TOPLAMA YÖNTEMİ VE HUKUKİ SEBEBİ',
              paragraphContent:
                  "Kişisel verileriniz, sitemizi ziyaret ettiğinizde IP ve/veya Device ID bilginizin kaydedilmesi ve cihazınıza yerleştirilen çerezler veya veriler aracılığıyla elde edilmektedir. Elde ettiğimiz kişisel verileriniz, 6698 sayılı Kişisel Verilerin Korunması Kanunu'nun 5. maddesi kapsamında;\n • Kanunlarda açıkça öngörülme,\n • İlgili kişinin temelk hak ve özgürlüklerine zarar vermemek kaydıylaveri sorumlusunun meşru menfaatleri için veri işlenmesinin zorunlu olması hukuki sebeplerine dayanılarak işlenmektedir.",
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'HAKLARINIZ',
              paragraphContent:
                  '6698 sayılı Kişisel Verileri Koruma Kanunu\'nun, "ilgili kişinin hakları" başlıklı 11. Maddesi kapsamındaki taleplerinizi, "Veri Sorumlusuna Başvuru Usul ve Esasları Hakkında Tebliğ" uyarınca Noktacom Medya İnternet Hizmetleri Sanayi ve Ticaret Anonim Şirketi\'nin Gökırmak Sokak No:2 Beysukent Ankara adresine yazılı olarak, ik@nokta.com adresine e-posta yoluyla, 03122361669 numaralı telefonu arayarak veya sözlü olarak iletebilirsiniz. Taleplerinize sağlıklı yanıt verilebilmesi açısından, talep içeriğinin açık, anlaşılır ve mümkünse tarih yönünden belirli olarak iletilmesi önerilmektedir.',
            ),
            const BuildAgreementParagraph(
              paragraphTitle: 'Kişisel Verilerin Korunması',
              paragraphContent:
                  "Veri sorumlusu, Noktacom Medya İnternet Hizmetleri Sanayi ve Ticaret A:Ş: tarafından, IP ve Device ID (mobil cihaz kimliği) bilgilerimin, tarafıma özel reklamların sunulabilmesi için, yurt içi ve yurtdışında bulunan reklam sağlayıcılarının erişimine açılması suretiyle yurtiçi ve yurtdışına aktarılabileceği hususunda tarafıma açık ve anlaşılır bilgilendirme yapılmıştır. Bu reklam sağlayıcılar arasında bulunan IronSource'un gizlilik sözleşmesine buradan ulaşabilirsiniz. Açık rızanız, internet sitemiz veya mobil uygulamamızda yer alan Çerez ve KVKK Politikası içerisinde bulunan onay seçeneğinin değiştirilmesi suretiyle her zaman geri alınabilmektedir.",
            ),
            const BuildAgreementParagraph(
              paragraphTitle: '',
              paragraphContent:
                  '18 yaşından küçük iseniz, açık rıza vermenizin mümkün olmaması nedeniyle, kişisel verileriniz, bu maddede belirtilen kapsamda herhangi bir kişiye aktarılmamaktadır.',
            ),
            BlocBuilder<AgeConsentBloc, AgeConsentState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Yaş Seçimi
                    Row(
                      children: [
                        Checkbox(
                          activeColor: systemBlueColor,
                          value: state.isOver18,
                          onChanged: (_) {
                            BlocProvider.of<AgeConsentBloc>(context)
                                .add(SelectAgeOver18());
                          },
                        ),
                        const Text('18 Yaşından Büyüğüm',
                            style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: systemBlueColor,
                          value: !state.isOver18,
                          onChanged: (_) {
                            BlocProvider.of<AgeConsentBloc>(context)
                                .add(SelectAgeUnder18());
                          },
                        ),
                        const Text('18 Yaşından Küçüğüm',
                            style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Bu bilgilendirme dahilinde, bahsi geçen kişisel verilerimin yurtiçi ve yurtdışındaki üçüncü kişilere aktarılmasına özgür irademle rıza göstermekteyim.',
                        style: TextStyle(
                          color: state.isAgreementEnabled
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                    // Onay Seçimi
                    Row(
                      children: [
                        Checkbox(
                          activeColor: systemBlueColor,
                          value: state.isAgreementChecked,
                          onChanged: state.isAgreementEnabled
                              ? (isChecked) {
                                  BlocProvider.of<AgeConsentBloc>(context)
                                      .add(ToggleAgreement(isChecked!));
                                }
                              : null,
                        ),
                        Text(
                          'Onaylıyorum',
                          style: TextStyle(
                            color: state.isAgreementEnabled
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: systemBlueColor,
                          value: !state.isAgreementChecked,
                          onChanged: state.isAgreementEnabled
                              ? (isChecked) {
                                  BlocProvider.of<AgeConsentBloc>(context)
                                      .add(ToggleAgreement(!isChecked!));
                                }
                              : null,
                        ),
                        Text(
                          'Onaylamıyorum',
                          style: TextStyle(
                            color: state.isAgreementEnabled
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
