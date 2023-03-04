import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  int? hasil = 0, angka1, angka2;
  tambah() {
    setState(() {
      angka1 = int.parse(controller1.text);
      angka2 = int.parse(controller2.text);
      hasil = angka1! + angka2!;
    });
  }

  kurang() {
    setState(() {
      angka1 = int.parse(controller1.text);
      angka2 = int.parse(controller2.text);
      hasil = angka1! - angka2!;
    });
  }

  List<String> nama = ["Agung Prayogi", "Ilham Kurniawan"];
  List<String> nim = ["123200085", "123200067"];
  List<String> jurusan = ["Teknik Informatika", "Teknik Informatika"];
  List<String> angkatan = ["2020", "2020"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            tabs: [
              GButton(
                icon: Icons.favorite,
                text: 'Simple Calculator',
              ),
              GButton(
                icon: Icons.person,
                text: 'Biodata',
              ),
            ],
            selectedIndex: currentPageIndex,
            onTabChange: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
      ),
      body: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(children: [
              Text('Hasil : ${myFormat.format(hasil)}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  hintText: 'Masukkan Angka Pertama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  hintText: 'Masukkan Angka Kedua',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        tambah();
                        controller1.clear();
                        controller2.clear();
                      },
                      child: Text('Tambah')),
                  ElevatedButton(
                      onPressed: () {
                        kurang();
                        controller1.clear();
                        controller2.clear();
                      },
                      child: Text('Kurang')),
                ],
              )
            ]),
          ),
        ),
        //------------------------TAB BIODATA---------------------
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: nama.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(nama[i]),
                          subtitle: Text(nim[i]),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(jurusan[i]),
                          subtitle: Text(angkatan[i]),
                        ),
                      ),
                    ],
                  ));
                }),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
