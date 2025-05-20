import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Store contacts as a list of maps
  List<Map<String, String>> _contacts = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void addContact() {
    String contactName = nameController.text.trim();
    String contactNumber = numberController.text.trim();

    if (contactName.isNotEmpty && contactNumber.isNotEmpty) {
      setState(() {
        _contacts.add({
          'name': contactName,
          'number': contactNumber,
        });
        nameController.clear();
        numberController.clear();
      });
    } else {
      // Optional: show a message if either field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both name and number')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text(
          'Contact List',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: 'Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: addContact,
                child: Text('Add'),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(_contacts[index]['name']!),
                      subtitle: Text(_contacts[index]['number']!),
                      trailing: IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {
                          // Implement call functionality if needed
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
