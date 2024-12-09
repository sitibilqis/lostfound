import 'package:app_lostfound/ip.dart';
import 'package:app_lostfound/lostpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddLost extends StatefulWidget {
  const AddLost({super.key});

  @override
  State<AddLost> createState() => _AddLostState();
}

class _AddLostState extends State<AddLost> {
  final formKey = GlobalKey<FormState>();

  TextEditingController itempic = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController datelost = TextEditingController();
  TextEditingController itemdesc = TextEditingController();
  TextEditingController itemcat = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController itemloc = TextEditingController();

  Future<bool> _simpan() async {
    final respon = await http.post(
      Uri.parse('http://$ipv4/api_lostfound/lost/create.php'),
      body: {
        'itempic': itempic.text,
        'name': name.text,
        'datelost': datelost.text,
        'itemdesc': itemdesc.text,
        'itemcat': itemcat.text,
        'contact': contact.text,
        'itemloc': itemloc.text,
      },
    );
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ), 
        backgroundColor: Color.fromRGBO(58, 87, 232, 1),
        title: Text('Add Lost Items', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: itempic,
                decoration: InputDecoration(
                  hintText: 'Picture Link',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Picture cannot be empty!";
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
                    return "Name cannot be empty!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: datelost,
                decoration: InputDecoration(
                  hintText: 'Date Lost',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Date lost cannot be empty!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemdesc,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Description cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemcat,
                decoration: InputDecoration(
                  hintText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Category cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: contact,
                decoration: InputDecoration(
                  hintText: 'Contact Person',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Contact person cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: itemloc,
                decoration: InputDecoration(
                  hintText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Location cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _simpan().then((value) {
                      if (value) {
                        final snackBar = SnackBar(
                          content: const Text('Data submitted.'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LostPage(),
                          ),
                          (route) => false,
                        );
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Failed to submit data!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
