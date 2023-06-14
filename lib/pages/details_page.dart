import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final int roomNumber;
  final int adultsCount;
  final int childrenCount;
  final List<String> adultNames;
  final List<int> adultAges;
  final List<String> childNames;
  final List<int> childAges;

  const DetailsPage(
      {required this.roomNumber,
      required this.adultsCount,
      required this.childrenCount,
      required this.adultNames,
      required this.adultAges,
      required this.childNames,
      required this.childAges,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Room Number: $roomNumber',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Card(
                          child: SizedBox(
                            width: size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Adults:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(adultsCount, (index) {
                                    return Card(
                                      child: SizedBox(
                                        width: size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name: ${adultNames[index]}',
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                'Age: ${adultAges[index]}',
                                                style:
                                                    const TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Children:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Card(
                                  child: SizedBox(
                                    width: size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        childrenCount,
                                        (index) {
                                          return Card(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: SizedBox(
                                                width: size.width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Name: ${childNames[index]}',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Age: ${childAges[index]}',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
