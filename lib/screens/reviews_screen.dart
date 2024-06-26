import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_and_reviews_finalproject/rating_bottom_sheet.dart';


class ReviewsScreens extends StatefulWidget {
  const ReviewsScreens({super.key});

  @override
  State<ReviewsScreens> createState() => _ReviewsScreensState();
}

class _ReviewsScreensState extends State<ReviewsScreens> {
  final double rating = 4.3;
  bool isHelpFull = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFD5354C),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Rating & Reviews",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "$rating",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                    const Text(
                      "30 ratings",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 40.0,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "15 reviews",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Card(
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            " Abdelrahman Ahmed Zarea",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBarIndicator(
                                rating: 3,
                                itemBuilder: (context, index) =>
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 15.0,
                              ),
                              const Text(
                                "Nov 5,2024",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),

                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Sleek design adds elegance to any room while smart features ensure seamless access to favorite content. Immersive sound enhances the overall entertainment experience, making it a top choice for home viewing."),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: (){
                                setState(() {
                                  isHelpFull = !isHelpFull;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(isHelpFull ? Icons.thumb_up: Icons.thumb_up_outlined,color: isHelpFull ? Colors.blue : Colors.black87,),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text("Helpful",style: TextStyle(color: isHelpFull ? Colors.blue : Colors.black87),),
                                ],),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 14,
                  ),
                  itemCount: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    _showRatingBottomSheet(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFFD5354C))),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    child: const Row(
                      children: [
                        Icon(Icons.edit,color: Colors.white,),
                        SizedBox(width: 6,),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Write a review",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showRatingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      constraints:
      BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.80),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const RatingBusinessBottomSheet(),
        );
      },
    );
  }
}