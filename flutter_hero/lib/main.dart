import 'package:flutter/material.dart';
import 'package:flutter_hero/trips.dart';
import 'package:flutter_hero/ui/item_preview.dart';
import 'package:flutter_hero/widgets/photo.dart';

import 'utils/white_transitions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Hero Animations Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var trips = [
    Trips(
        'https://imgproxy.natucate.com/jOqdUivhtzDON3kHAr2UXV-NPmCr3glnGWpdOwh8ymw/rs:fill/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlbi8wOGRhYjU5Zi1kMDY0LTRmMmUtODJkZC0xMGIxM2I5OGZmZDcvOTU3ODc1MTUwLTE2MTAxMDA2NTAvbmF0dXJyZWlzZS1pdGFsaWVuLWFwZW5uaW4tc2VlLXN0YWR0LW5hdHVjYXRlLmpwZw',
        "Nature Travel Italy",
        " Apennines Hiking TourNature Travel Italy: Apennines Hiking TourEnquire nowTake part in this five-day hiking tour in Italy and immerse yourself into the magnificent landscapes of the Apennines!This exclusive nature trip offers the opportunity to understand the relevance and importance of species conservation from both an ecological and economic perspective.While you become familiar with the flora and fauna of the Central Apennines with its bears, wolves, foxes and eagles, you will also expand your knowledge of the prevailing human-wildlife conflict and the measures developed to mitigate it.You will listen to lectures on species conservation, visit bear corridors and interact with local people. Every day, you will enjoy magnificent landscapes and culinary delights.Your personal guide is always with you, providing you with exciting background information on conservation issues on site.",
        "price"),
    Trips(
        'https://imgproxy.natucate.com/dQfD-1NHz8OWdV0ztl18LVYcxMDFIXfu2FWhIlqUxic/rs:fill/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlbi8wYWY5NGM1Ni02YzkyLTRjYTUtYmFmZC01Yzc1ZjMwNWYyOTgvNzc2OTc0NjA5LTE1NTc5MjA2ODEvbmF0dXItdW5kLWVybGVibmlzcmVpc2Uta2VuaWEtYWZyaWthLWVjb3F1ZXN0LXNhZmFyaS16ZWJyYXMtbmF0dWNhdGUuanBn',
        "Nature Travel Kenya",
        "So far you have had little to do with nature, but would now like to embark on that journey? Then our introductory EcoQuest course in awe-inspiring Kenya is just right for you. This course is especially designed for newcomers, who can gather valuable insights which they will never forget, during a 7 or 14-day stay in awesome surroundings. Kenya's spectacular Masai Mara is the perfect region for an adventure which will make your daily routine fade into the background. Discover the exciting world of animals and plants and embark on your first steps in the wild with the EcoQuest course.",
        "0"),
    Trips(
        'https://imgproxy.natucate.com/LPye_6n4p9bWKjZCid07JlYPZyZEcEuw_jq9LhVOgcc/rs:fill/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlbi8zYjE3OTRjMy03ZWIwLTQ2MmMtOTQ5NS1hNWI3ODZlZDNlMDMvMTEwOTgxMjY5Ni0xNTU3OTIwNjgxL25hdHVyLXVuZC1lcmxlYm5pc3JlaXNlLWFyZ2VudGluaWVuLXN1ZWRhbWVyaWthLXBhY2t0cmlwLXBmZXJkZS1yZWl0ZW4tYW5kZW4tbmF0dWNhdGUuanBn',
        "Nature Travel Argentina",
        'Become part of this fascinating trip and join a unique horse trekking excursion into this unparalleled landscape. Traveling on horseback is the best way to get an inside glimpse of this raw and wild land and the gaucho culture who spend summers tending their herds on the high ridges and valleys of the Andes. Besides exploring the magnificent landscape of the Patagonian Andes you’ll learn wilderness skills including backcountry horseback riding and the art of living confidently and respectfully in wild nature. Before and after your packtrip you will spend some time at a beautiful Patagonian horse ranch, nestled in the foothills of the Patagonian Andes and surrounded by nothing but pure nature.',
        "0"),
    Trips(
        'https://imgproxy.natucate.com/6w5RXQOjRh10Lnk1Ux9HQzGNSynb6VCVVBOSq28cHLM/rs:fill/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlbi85ZWNlY2Y4Ny05Mjc4LTQ1NmMtYjgxNC05YWQ3Y2JjNTlhZWEvMTE4Nzk1Nzc5Ny0xNTgyNzE4OTYzL25hdHVycmVpc2Utc3VlZGxpY2hlcy1hZnJpa2EtcmFuZ2VyLXNjaG51cHBlcmt1cnMtZWxlZmFudC1uYXR1Y2F0ZS5qcGc',
        "Nature Travel Southern Africa",
        'Explore the African wild! You are a true nature lover, eager to dive into the African wilderness and curious about living the life of a safari guide? Then join our introductory bush adventure and be more than a mere spectator in Southern Africa’s unspoilt nature!During your 7- to 14-day bush experience in either South Africa or Botswana, nature will turn into your classroom: An highly experienced guide will lead you and your team through the wild landscapes of KwaZulu-Natal or the awe-inspiring Okavango Delta, teaching you fundamental field guide knowledge about animal behaviour, wildlife tracking and intricate ecosystems. At least one night will be spent under Africa’s breathtaking night sky, under the stars in your sleeping bag and surrounded by the sounds of the bush.Take the chance to experience Southern Africa’s nature in an in-depth way, witness stunning Big Five encounters and enjoy an educational and unforgettable wilderness adventure.',
        "0"),
    Trips(
        'https://imgproxy.natucate.com/YDakafBN3phz1JDVkSKan4iUBeX2KGl2HxUvsPgrPi4/rs:fill/aHR0cHM6Ly93d3cubmF0dWNhdGUuY29tL21lZGlhL3BhZ2VzL3JlaXNlbi81MzJiMzMwYi05YmIwLTRiYzAtOWMzYi1kMjBkMWUxY2JkOGQvMjY2OTM5MTQxMi0xNjEwNDUxMzExL25hdHVycmVpc2Utc2Nod2VkZW4tc2Nod2VkaXNjaC1sYXBwbGFuZC1odXNreS1zY2hsaXR0ZW4tbmF0dWNhdGUuanBn',
        "Nature Travel Sweden",
        'Go on a winter safari in Swedish Lapland and experience the land of the Sámi in an unforgettable way For five days you will immerse yourself into Sweden\'s arctic natural landscapes and spend your days with a mix of exciting exploration tours, husky sleigh rides and Scandinavian sauna baths.You will witness the spectacular phenomenon of the northern lights, cross the border to the Arctic Circle and spend the night in traditional lavvu tents, surrounded by silence, wild animals and the untouched nature of Lapland.Your personal guide is always with you, teaching you tracking and bushcraft skills as well as interesting background information on conservation issues.',
        "0"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 30, left: 30, top: 20),
          child: ListView(
            children: List.generate(
                trips.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PhotoHero(
                        photo: trips[index].image,
                        onTap: () {
                          /// Default hero animations
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return ItemPreview(
                          //     trip: trips[index],
                          //   );
                          // }));
                          //
                          /// white page route hero animations
                          Navigator.push(
                            context,
                            WhitePageRoute(
                                enterPage: ItemPreview(
                              trip: trips[index],
                            )),
                          );
                        },
                      ),
                    )),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
