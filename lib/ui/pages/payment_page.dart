part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          ///Bagian Atas
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 177,
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        symbol: 'IDR',
                                        decimalDigits: 0)
                                    .format(widget.transaction.food.price),
                                style: greyFontStyle.copyWith(fontSize: 13)),
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${widget.transaction.quantity} item(s)',
                      style: greyFontStyle.copyWith(fontSize: 13),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Details Transaction',
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.food.name,
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'IDR',
                            decimalDigits: 0,
                          ).format(widget.transaction.quantity *
                              widget.transaction.food.price),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Ongkir',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'IDR',
                            decimalDigits: 0,
                          ).format(50000),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'PPN 10%',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'IDR',
                            decimalDigits: 0,
                          ).format(widget.transaction.total),
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Total',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                            locale: 'id-ID',
                            symbol: 'IDR',
                            decimalDigits: 0,
                          ).format(widget.transaction.total * 1.1 + 50000),
                          style: blackFontStyle3.copyWith(
                              fontWeight: FontWeight.w500,
                              color: '1ABC9C'.toColor()),
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
              ],
            ),
          ),

          ///Bagian Bawah
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 6),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Nama Pemesan',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(widget.transaction.user.name,
                          style: blackFontStyle3, textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'No. Telp',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(widget.transaction.user.phoneNumber,
                          style: blackFontStyle3, textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Address',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(widget.transaction.user.address,
                          style: blackFontStyle3, textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'No. Rumah',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(widget.transaction.user.houseNumber,
                          style: blackFontStyle3, textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Kota',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(widget.transaction.user.city,
                          style: blackFontStyle3, textAlign: TextAlign.right),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //// Checkout Button
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String paymentURL = await BlocProvider.of<TransactionCubit>(context)
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  50000));

                      if (paymentURL != null) {
                        Get.to(PaymentMethodPage(paymentURL));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Transaction Failed',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              'Please try again later.',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                      }
                    },
                    elevation: 0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Checkout Now",
                      style:
                          whiteFontStyle1.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
