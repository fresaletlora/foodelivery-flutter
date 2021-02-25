part of 'shared.dart';

Color mainColor = "2C6D6A".toColor();
Color greyColor = "8D92A3".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w300);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);
TextStyle whiteFontStyle1 = GoogleFonts.poppins().copyWith(
  color: Colors.white,
);

const double defaultMargin = 24;
