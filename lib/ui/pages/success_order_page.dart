part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: "Pesanan kamu berhasil dibuat",
          subtitle: "Tunggu dirumah dan tunggu pesananmu sampai ya",
          picturePath: "assets/bike.png",
          buttonTap1: () {
            Get.offAll(MainPage());
          },
          buttonTitle1: "Pesan Makanan Lain",
          buttonTap2: () {
            Get.offAll(MainPage(initialPage: 1));
          },
          buttonTitle2: "Lihat Pesanan Saya",
        ));
  }
}
