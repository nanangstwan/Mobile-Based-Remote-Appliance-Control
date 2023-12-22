import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:remote_lamp/widget/card.dart';
import 'package:remote_lamp/widget/dummy_data.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('LED');
  int _currentValue = 0;

  void updateData() {
    int newValue = _currentValue == 0 ? 1 : 0;
    _databaseReference.set(newValue);
    setState(() {
      _currentValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height * 0.3;
    final double itemWidth = size.width / 2;
    final User = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Container(
        color: Color(0XD3D3D3),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 11, 80, 136),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    offset: Offset(4.0, 1.0),
                  ),
                ],
              ),
              height: itemHeight * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Signed In as',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              User.email!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => FirebaseAuth.instance.signOut(),
                          child: Image.asset(
                            'image/logout.png',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'LIVING ROOM',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 3,
                        child: GridView.count(
                            crossAxisCount: 2,
                            // scrollDirection: Axis.vertical,
                            // childAspectRatio: (itemWidth / itemHeight),
                            shrinkWrap: true,
                            children: [
                              StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref()
                                      .child('Lamp')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final dataLamp =
                                          snapshot.data as DatabaseEvent?;
                                      final statusLamp =
                                          dataLamp?.snapshot.value?.toString();
                                      final device = DeviceHome(
                                          nama: 'Lampu Utama',
                                          image: 'image/lampu.png',
                                          status: statusLamp == '1'
                                              ? 'hidup'
                                              : 'mati',
                                          onswitch: (() {
                                            int targetStatus =
                                                statusLamp == '1' ? 0 : 1;
                                            FirebaseDatabase.instance
                                                .ref()
                                                .update({'Lamp': targetStatus});
                                          }));
                                      return MyCard(
                                          device: device, isLoading: true);
                                    }
                                    return MyCard(
                                        device: DeviceHome.empty(),
                                        isLoading: true);
                                  }),
                              StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref()
                                      .child('Lamp1')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final dataLamp =
                                          snapshot.data as DatabaseEvent?;
                                      final statusLamp =
                                          dataLamp?.snapshot.value?.toString();
                                      final device = DeviceHome(
                                          nama: 'Lamp Table',
                                          image: 'image/lampumeja.png',
                                          status: statusLamp == '1'
                                              ? 'hidup'
                                              : 'mati',
                                          onswitch: (() {
                                            int targetStatus =
                                                statusLamp == '1' ? 0 : 1;
                                            FirebaseDatabase.instance
                                                .ref()
                                                .update(
                                                    {'Lamp1': targetStatus});
                                          }));
                                      return MyCard(
                                          device: device, isLoading: true);
                                    }
                                    return MyCard(
                                        device: DeviceHome.empty(),
                                        isLoading: true);
                                  }),
                                  StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref()
                                      .child('Lamp1')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final dataLamp =
                                          snapshot.data as DatabaseEvent?;
                                      final statusLamp =
                                          dataLamp?.snapshot.value?.toString();
                                      final device = DeviceHome(
                                          nama: 'Lamp Belajar',
                                          image: 'image/lampubelajar.png',
                                          status: statusLamp == '1'
                                              ? 'hidup'
                                              : 'mati',
                                          onswitch: (() {
                                            int targetStatus =
                                                statusLamp == '1' ? 0 : 1;
                                            FirebaseDatabase.instance
                                                .ref()
                                                .update(
                                                    {'Lamp1': targetStatus});
                                          }));
                                      return MyCard(
                                          device: device, isLoading: true);
                                    }
                                    return MyCard(
                                        device: DeviceHome.empty(),
                                        isLoading: true);
                                  }),
                                  StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref()
                                      .child('TV')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final dataLamp =
                                          snapshot.data as DatabaseEvent?;
                                      final statusLamp =
                                          dataLamp?.snapshot.value?.toString();
                                      final device = DeviceHome(
                                          nama: 'Kipas Angin',
                                          image: 'image/kipas.png',
                                          status: statusLamp == '1'
                                              ? 'hidup'
                                              : 'mati',
                                          onswitch: (() {
                                            int targetStatus =
                                                statusLamp == '1' ? 0 : 1;
                                            FirebaseDatabase.instance
                                                .ref()
                                                .update(
                                                    {'Lamp1': targetStatus});
                                          }));
                                      return MyCard(
                                          device: device, isLoading: true);
                                    }
                                    return MyCard(
                                        device: DeviceHome.empty(),
                                        isLoading: true);
                                  }),
                                  StreamBuilder(
                                  stream: FirebaseDatabase.instance
                                      .ref()
                                      .child('Lamp')
                                      .onValue,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final dataLamp =
                                          snapshot.data as DatabaseEvent?;
                                      final statusLamp =
                                          dataLamp?.snapshot.value?.toString();
                                      final device = DeviceHome(
                                          nama: 'Televisi Ruang Tamu',
                                          image: 'image/tv.png',
                                          status: statusLamp == '1'
                                              ? 'hidup'
                                              : 'mati',
                                          onswitch: (() {
                                            int targetStatus =
                                                statusLamp == '1' ? 0 : 1;
                                            FirebaseDatabase.instance
                                                .ref()
                                                .update(
                                                    {'Lamp1': targetStatus});
                                          }));
                                      return MyCard(
                                          device: device, isLoading: true);
                                    }
                                    return MyCard(
                                        device: DeviceHome.empty(),
                                        isLoading: true);
                                  }),
                            ]),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     ElevatedButton(
    //       onPressed: updateData,
    //       child: Text(_currentValue == 0 ? 'OFF' : 'ON'),
    //     ),
    //     ElevatedButton(
    //       onPressed: () {
    //         FirebaseAuth.instance.signOut();
    //       },
    //       child: const Text('SignOut'),
    //     ),
    //   ],
    // );
  }
}
