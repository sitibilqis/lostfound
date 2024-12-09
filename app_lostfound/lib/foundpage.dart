import 'dart:convert';
import 'package:app_lostfound/bottom_navbar.dart';
import 'package:app_lostfound/found/detailitems.dart';
import 'package:app_lostfound/found/edititems.dart';
import 'package:app_lostfound/homepage.dart';
import 'package:app_lostfound/ip.dart';
import 'package:app_lostfound/lostpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoundPage extends StatefulWidget {
  const FoundPage({Key? key}) : super(key: key);

  @override
  State<FoundPage> createState() => _FoundPageState();
}

class _FoundPageState extends State<FoundPage> {
  List _listdata = [];
  bool _loading = true;
  int _currentIndex = 2;

  Future<void> _getdata() async {
    try {
      final response =
          await http.get(Uri.parse('http://$ipv4/api_lostfound/found/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
          _loading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<bool> _hapus(String id) async {
    try {
      final response = await http.post(
        Uri.parse('http://$ipv4/api_lostfound/found/delete.php'),
        body: {
          "found_id": id,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LostPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoundPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 15, 15, 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(58, 87, 232, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Found Item",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.person, size: 30, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cari",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: Icon(
                          Icons.search,
                          size: 20,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Icon(
                          Icons.filter_list,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    key: UniqueKey(), // Menambahkan UniqueKey untuk ListView.builder
                    itemCount: _listdata.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailItems(
                                ListData: {
                                  'found_id': _listdata[index]['found_id'],
                                  'itempic': _listdata[index]['itempic'],
                                  'name': _listdata[index]['name'],
                                  'datefound': _listdata[index]['datefound'],
                                  'itemdesc': _listdata[index]['itemdesc'],
                                  'itemcat': _listdata[index]['itemcat'],
                                  'contact': _listdata[index]['contact'],
                                  'itemloc': _listdata[index]['itemloc'],
                                },
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    _listdata[index]['itempic'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _listdata[index]['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color.fromRGBO(58, 87, 232, 1),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        _listdata[index]['itemdesc'],
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditItems(
                                          ListData: {
                                            'found_id': _listdata[index]['found_id'],
                                            'itempic': _listdata[index]['itempic'],
                                            'name': _listdata[index]['name'],
                                            'datefound': _listdata[index]['datefound'],
                                            'itemdesc': _listdata[index]['itemdesc'],
                                            'itemcat': _listdata[index]['itemcat'],
                                            'contact': _listdata[index]['contact'],
                                            'itemloc': _listdata[index]['itemloc'],
                                          },
                                        ),
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        setState(() {
                                          _loading = true;
                                        });
                                        _getdata();
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Hapus Data'),
                                        content: Text('Apakah Anda yakin ingin menghapus item ini?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _hapus(_listdata[index]['found_id']).then((value) {
                                                if (value) {
                                                  setState(() {
                                                    _loading = true;
                                                  });
                                                  _getdata();
                                                }
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: Text('Hapus'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
