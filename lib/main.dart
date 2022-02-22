import 'package:assignment/product/constants/style/app_style.dart';
import 'package:assignment/product/view/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

/*
✓ ● Uygulamaya ilk girişte bir welcome sayfası olacaktır, bu sayfada aşağıda
linki verilmiş logo, bir hoşgeldiniz yazısı (metin konusunda geliştirici
serbesttir) ve ekranın altında Giriş butonu olacaktır.

✓ ● Giriş butonuna basılınca uygulama detayına geçilecektir.

✓ ● Uygulama detayında alt menü ile navigasyon olacak, alt menüde iki farklı
ekran linki bulunacaktır: Albümler ve Proﬁl


✓ ● Albümler ekranında, aşağıda linki verilmiş olan REST API çağrılarak
albümler listelenecektir.


✓ ● Albümlerden birine basınca albüm detay ekranı açılacaktır.
✓ ● Albüm detay ekranında iki segment olacaktır. Birinci segment’te liste
halinde albüm resimleri gösterilecektir. (REST API bilgisi aşağıda verilmiştir)
İkinci segment’te albüme ait yorumlar listelenecektir. (REST API bilgisi
aşağıda verilmiştir)


✓ ● Proﬁle basınca kullanıcı bilgileri görüntülenecek ve altında da sosyal medya
ikonları olacaktır. Proﬁl bilgisi için “dummy” bir kullanıcı bilgisi yeterlidir.
Sosyal medya ikonları ilgili sosyal medyaya yönlenebilir (uygulama dışına
linkleme yapılabilir)


!!! ● Nesneye dayalı geliştirmeye özellikle dikkat edilecektir.

*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppStyle.backgroundColor,
      ),
    );
  }
}
