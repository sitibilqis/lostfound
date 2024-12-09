import 'package:app_lostfound/ip.dart';
import 'package:app_lostfound/lostpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditLost extends StatefulWidget {
  final Map ListData;
  const EditLost({Key? key, required this.ListData}) : super(key: key);

  @override
  State<EditLost> createState() => _EditLostState();
}

class _EditLostState extends State<EditLost> {
  final formKey = GlobalKey<FormState>();
  TextEditingController itempic = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController datelost = TextEditingController();
  TextEditingController itemdesc = TextEditingController();
  TextEditingController itemcat = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController itemloc = TextEditingController();

  Future<bool> _ubah() async {
    final respon = await http.post(
      Uri.parse('http://$ipv4/api_lostfound/lost/edit.php'),
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
    itempic.text = widget.ListData['itempic'];
    name.text = widget.ListData['name'];
    datelost.text = widget.ListData['datelost'];
    itemdesc.text = widget.ListData['itemdesc'];
    itemcat.text = widget.ListData['itemcat'];
    contact.text = widget.ListData['contact'];
    itemloc.text = widget.ListData['itemloc'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(58, 87, 232, 1),
        title: Text(
          'Edit Items',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                  hintText: 'Insert picture link',
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
                    _ubah().then((value) {
                      if (value) {
                        final snackBar = SnackBar(
                          content: const Text('Data changed.'),
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
                          content: const Text('Failed to change data!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    });
                  }
                },
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
