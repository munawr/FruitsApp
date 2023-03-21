import 'package:flutter/material.dart';
import 'package:fruits_app/Model/ItemsModel.dart';
import 'package:fruits_app/Service/ItemsService.dart';

import 'Details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Fruits> futureFruits;

  @override
  void initState() {
    super.initState();
    futureFruits = fetchFruits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits List'),
      ),
      body: FutureBuilder<Fruits>(
        future: futureFruits,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error Occurred!'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.items!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                title: snapshot.data!.items![index].itemName!,
                                imageUrl:
                                    snapshot.data!.items![index].itemImage!,
                                description:
                                    snapshot.data!.items![index].itemDetails!,
                              )),
                    );
                    ;
                  },
                  child: Card(
                    child: ListTile(
                      subtitle: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data!.items![index].itemName!,
                              style: const TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          )),
                      title: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          snapshot.data!.items![index].itemImage!,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No Data Found!'));
          }
        },
      ),
    );
  }
}
