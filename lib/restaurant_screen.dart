import 'package:flutter/material.dart';
import 'models/restaurants.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName = "resto_list";
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                final List<Restaurants> restaurantList =
                    parseData(snapshot.data);
                return ListView.builder(
                  itemCount: restaurantList.length,
                  itemBuilder: (context, index) {
                    if (restaurantList.isNotEmpty) {
                      final Restaurants restaurant = restaurantList[index];
                      String image = restaurant.pictureId;
                      debugPrint('image: $image');
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        leading:
                            Image.network(restaurant.pictureId, width: 100),
                        title: Text(restaurant.name),
                        subtitle: Text(restaurant.description),
                        onTap: () {},
                      );
                    }
                    return null;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
