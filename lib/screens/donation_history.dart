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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        fild2.text = "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_today, color: Colors.grey),
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
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 70,
              child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.grey.shade200,
                        leading: CircleAvatar(
                          child: Text('${index+1}',style: TextStyle(fontWeight: FontWeight.bold)),
                          backgroundColor: Colors.red,
                        ),
                        title: Text(todo[index].name),
                        subtitle: Text('Date: ${todo[index].description}'),
                        trailing: Icon(Icons.delete_outline_sharp,),
                        onTap: () {},
                      ),
                    );
                  }),
            ),
          ],
        ),
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
