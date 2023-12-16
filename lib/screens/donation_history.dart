import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  List<Todo> todo = [];
  TextEditingController fild1 = TextEditingController();
  TextEditingController fild2 = TextEditingController();
  TextEditingController todoTEController1 = TextEditingController();
  TextEditingController todoTEController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              children: [
                TextFormField(
                  controller: fild1,
                  decoration: const InputDecoration(
                    hintText: 'Place',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: fild2,
                  decoration: InputDecoration(
                    hintText: 'Date of Donation',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050),
                        );

                        if (pickedDate != null && pickedDate != fild2.text) {
                          setState(() {
                            fild2.text =
                                "${pickedDate.toLocal()}".split(' ')[0];
                          });
                        }
                      },
                      icon:
                          const Icon(Icons.calendar_today, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    String str1 = fild1.text.trim();
                    String str2 = fild2.text.trim();
                    Todo todoo = Todo(str1, str2);
                    todo.add(todoo);
                    fild1.text = '';
                    fild2.text = '';
                    setState(() {});
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            flex: 70,
            child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.zero,
                      ),
                      tileColor: Colors.grey.shade200,
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('${index + 1}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      title: Text(todo[index].name),
                      subtitle: Text('Date: ${todo[index].description}'),
                      trailing: const Icon(
                        Icons.delete_outline_sharp,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Alert!'),
                                content: const Text(
                                    'Are You Sure! Want to delete your donation history?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Okk',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              );
                            });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class Todo {
  String name;
  String description;

  Todo(
    this.name,
    this.description,
  );
}
