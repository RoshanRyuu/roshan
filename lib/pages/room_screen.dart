import 'package:flutter/material.dart';
import '../widgets/eleveted_button.dart';
import "../widgets/text_field.dart";
import 'details_page.dart';

class RoomNumberScreen extends StatefulWidget {
  const RoomNumberScreen({super.key});
  @override
  State<RoomNumberScreen> createState() => _RoomNumberScreenState();
}

class _RoomNumberScreenState extends State<RoomNumberScreen> {
  int selectedRoomNumber = 0;
  var num = 0;
  var adultsCount = 0;
  var childrenCount = 0;
  List<Widget> roomCardWidget = [];
  List<TextEditingController>? adultNameControllers = [];
  List<TextEditingController>? adultAgeControllers = [];
  List<TextEditingController>? childNameControllers = [];
  List<TextEditingController>? childAgeControllers = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Number'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Selected Room Number:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                DropdownButton<int>(
                  value: selectedRoomNumber,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedRoomNumber = newValue!;
                      num = newValue;
                      print(selectedRoomNumber);
                    });
                  },
                  items: const <DropdownMenuItem<int>>[
                    DropdownMenuItem<int>(
                      value: 0,
                      child: Text('Select Room'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('Room 1'),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text('Room 2'),
                    ),
                    DropdownMenuItem<int>(
                      value: 3,
                      child: Text('Room 3'),
                    ),
                    DropdownMenuItem<int>(
                      value: 4,
                      child: Text('Room 4'),
                    ),
                    DropdownMenuItem<int>(
                      value: 5,
                      child: Text('Room 5'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Column(
                //   children: roomCard(size),
                // ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Room Number: ${selectedRoomNumber.toString()}"),
                        Row(
                          children: [
                            TextFieldWidget(
                              width: size.width / 3,
                              keyboardType: TextInputType.number,
                              hintName: "Enter Adult's",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the number of adults';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                adultsCount = int.parse(value);
                              },
                            ),
                            TextFieldWidget(
                              width: size.width / 3,
                              keyboardType: TextInputType.number,
                              hintName: "Enter children",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the number of adults';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                // setState(() {
                                childrenCount = int.parse(value);
                                //updateChildControllers();
                                // });
                              },
                            ),
                            ElevetedButtonWidget(
                              buttonName: "ADD",
                              width: size.width * 0.2,
                              height: 40,
                              onTap: () {
                                handleAddButtonTap();
                              },
                              buttonColor:
                                  const Color.fromARGB(255, 31, 127, 35),
                            ),
                          ],
                        ),
                        Column(children: buildAdultTextFields(size)),
                        Column(children: buildChildTextFields(size)),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                // Text(
                //   'Number of Children:',
                //   style: TextStyle(fontSize: 20),
                // ),
                // SizedBox(height: 10),
                // Column(children: buildAdultTextFields(size)),
                // SizedBox(height: 20),
                // Text(
                //   'Children:',
                //   style: TextStyle(fontSize: 20),
                // ),
                // Column(children: buildChildTextFields(size)),
                // SizedBox(height: 20),
                  ElevetedButtonWidget(
                    buttonName: "Submit",
                    width: size.width - 50,
                    height: 40,
                    onTap: () {
                       if (_formKey.currentState!.validate()) {
                        // Navigate to the details page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              roomNumber: selectedRoomNumber,
                              adultsCount: adultsCount,
                              childrenCount: childrenCount,
                              adultNames: getAdultNames(),
                              adultAges: getAdultAges(),
                              childNames: getChildNames(),
                              childAges: getChildAges(),
                            ),
                          ),
                        );
                      }
                    },
                    buttonColor: Colors.pinkAccent,
                  ),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                     
                //     },
                //     child: const Text('Submit'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> roomCard(size) {
  //   if (roomCardWidget.length < 5) {
  //     for (int i = 1; i <= num; i++) {
  //       roomCardWidget.add(
  //         Card(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Room Number: $i"),
  //                 Row(
  //                   children: [
  //                     TextFieldWidget(
  //                       width: size.width / 3,
  //                       keyboardType: TextInputType.number,
  //                       hintName: "Enter Adult's",
  //                       validator: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please enter the number of adults';
  //                         }
  //                         return null;
  //                       },
  //                       onChanged: (value) {
  //                         adultsCount = int.parse(value);
  //                       },
  //                     ),
  //                     TextFieldWidget(
  //                       width: size.width / 3,
  //                       keyboardType: TextInputType.number,
  //                       hintName: "Enter children",
  //                       validator: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please enter the number of adults';
  //                         }
  //                         return null;
  //                       },
  //                       onChanged: (value) {
  //                         // setState(() {
  //                         childrenCount = int.parse(value);
  //                         //updateChildControllers();
  //                         // });
  //                       },
  //                     ),
  //                     ElevetedButtonWidget(
  //                       buttonName: "ADD",
  //                       width: size.width * 0.2,
  //                       height: 40,
  //                       onTap: () {
  //                         handleAddButtonTap();
  //                       },
  //                       buttonColor: const Color.fromARGB(255, 31, 127, 35),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(children: buildAdultTextFields(size)),
  //                 Column(children: buildChildTextFields(size)),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   } else {
  //     print("You Can not Add Mode room");
  //   }
  //   return roomCardWidget;
  // }

  handleAddButtonTap() {
    setState(() {
      updateAdultControllers();
      updateChildControllers();
    });
  }

  List<Widget> buildAdultTextFields(size) {
    List<Widget> textFields = [];
    for (int i = 0; i < adultsCount; i++) {
      textFields.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adults:',
                ),
                Row(
                  children: [
                    TextFieldWidget(
                      controller: adultNameControllers?[i],
                      hintName: 'Name of Adult ${i + 1}',
                      // width: size.width / 3,
                      // height: 40,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name of adult';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hintName: 'Age of Adult ${i + 1}',
                      controller: adultAgeControllers?[i],
                      // width: size.width / 3,
                      // height: 40,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the age of adult';
                        }
                        int age = int.parse(value);
                        if (age <= 18) {
                          return 'Adults age should be greater than 18';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      
    }
    return textFields;
  }

  List<Widget> buildChildTextFields(size) {
    List<Widget> textFields = [];
    for (int i = 0; i < childrenCount; i++) {
      textFields.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Children:',
                ),
                Row(
                  children: [
                    TextFieldWidget(
                      hintName: 'Name of Child ${i + 1}',
                      controller: childNameControllers?[i],
                      // width: size.width / 3,
                      // height: 40,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name of child';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      hintName: 'Age of Child ${i + 1}',
                      controller: childAgeControllers?[i],
                      // width: size.width / 3,
                      // height: 40,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the age of child';
                        }
                        int age = int.parse(value);
                        if (age >= 18) {
                          return 'Children age should be less than 18';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return textFields;
  }

  void updateAdultControllers() {
    adultNameControllers?.clear();
    adultAgeControllers?.clear();
    for (int i = 0; i < adultsCount; i++) {
      adultNameControllers?.add(TextEditingController());
      adultAgeControllers?.add(TextEditingController());
    }
  }

  void updateChildControllers() {
    childNameControllers?.clear();
    childAgeControllers?.clear();
    for (int i = 0; i < childrenCount; i++) {
      childNameControllers?.add(TextEditingController());
      childAgeControllers?.add(TextEditingController());
    }
  }

  List<String> getAdultNames() {
    List<String> names = [];
    for (int i = 0; i < adultNameControllers!.length; i++) {
      names.add(adultNameControllers![i].text);
    }
    return names;
  }

  List<int> getAdultAges() {
    List<int> ages = [];
    for (int i = 0; i < adultAgeControllers!.length; i++) {
      ages.add(int.parse(adultAgeControllers![i].text));
    }
    return ages;
  }

  List<String> getChildNames() {
    List<String> names = [];
    for (int i = 0; i < childNameControllers!.length; i++) {
      names.add(childNameControllers![i].text);
    }
    return names;
  }

  List<int> getChildAges() {
    List<int> ages = [];
    for (int i = 0; i < childAgeControllers!.length; i++) {
      ages.add(int.parse(childAgeControllers![i].text));
    }
    return ages;
  }
}
