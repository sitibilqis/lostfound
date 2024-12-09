import 'package:app_lostfound/ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_lostfound/foundpage.dart';

class EditItems extends StatefulWidget {
  final Map ListData;
  const EditItems({Key? key, required this.ListData}) : super(key: key);

  @override
  State<EditItems> createState() => _EditItemsState();
}

class _EditItemsState extends State<EditItems> {
  final formKey = GlobalKey<FormState>();
  TextEditingController itempic = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController datefound = TextEditingController();
  TextEditingController itemdesc = TextEditingController();
  TextEditingController itemcat = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController itemloc = TextEditingController();

  Future<bool> _ubah() async {
    final response = await http.post(
      Uri.parse('http://$ipv4/api_lostfound/found/edit.php'),
      body: {
        'found_id': widget.ListData['found_id'],
        'itempic': itempic.text,
        'name': name.text,
        'datefound': datefound.text,
        'itemdesc': itemdesc.text,
        'itemcat': itemcat.text,
        'contact': contact.text,
        'itemloc': itemloc.text,
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    itempic.text = widget.ListData['itempic'];
    name.text = widget.ListData['name'];
    datefound.text = widget.ListData['datefound'];
    itemdesc.text = widget.ListData['itemdesc'];
    itemcat.text = widget.ListData['itemcat'];
    contact.text = widget.ListData['contact'];
    itemloc.text = widget.ListData['itemloc'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Items',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(58, 87, 232, 1),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: itempic,
                  decoration: InputDecoration(
                    hintText: 'Picture',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Picture cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: datefound,
                  decoration: InputDecoration(
                    hintText: 'Date Found',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: itemdesc,
                  decoration: InputDecoration(
                    hintText: 'Item Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: itemcat,
                  decoration: InputDecoration(
                    hintText: 'Item Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Category cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: contact,
                  decoration: InputDecoration(
                    hintText: 'Contact',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Contact cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: itemloc,
                  decoration: InputDecoration(
                    hintText: 'Item Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Location cannot be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _ubah().then((value) {
                        final snackBar = SnackBar(
                          content: Text(value
                              ? 'Data berhasil diubah'
                              : 'Data gagal diubah'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        if (value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoundPage()),
                            (route) => false,
                          );
                        }
                      });
                    }
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
