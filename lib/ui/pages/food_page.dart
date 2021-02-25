part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 + defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tokomoba",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Mau makan apa hari ini?",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                (BlocProvider.of<UserCubit>(context).state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),

            /// List Of Food
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.foods
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == state.foods.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(FoodDetailsPage(
                                              transaction: Transaction(
                                                  food: e,
                                                  user: (BlocProvider.of<UserCubit>(context)
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FoodCard(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),

            /// List of Food Tabs
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ["Menu Baru", "Terpopuler", "Disarankan"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (_, state) {
                      if (state is FoodLoaded) {
                        List<Food> foods = state.foods.where((element) => element.types.contains((selectedIndex == 0)
                            ? FoodType.new_food
                            : (selectedIndex == 1)
                                ? FoodType.popular
                                : FoodType.recommended)).toList();
                        return Column(
                            children: foods
                                .map((e) => Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          defaultMargin, 0, defaultMargin, 16),
                                      child: FoodListItem(
                                          food: e, itemWidth: listItemWidth),
                                    ))
                                .toList());
                      } else {
                        return Center(
                          child: loadingIndicator,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
