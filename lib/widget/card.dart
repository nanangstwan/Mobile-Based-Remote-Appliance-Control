import 'package:flutter/material.dart';
import 'package:remote_lamp/widget/dummy_data.dart';

class MyCard extends StatelessWidget {
  final DeviceHome device;
  final bool isLoading;
  const MyCard({Key? key, required this.device, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: device.status == 'hidup'
          ? BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 11, 80, 136),
                  Color.fromARGB(255, 64, 123, 224),
                ],
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 5,  offset: Offset(1.0, 4.0),),
              ],
              borderRadius: BorderRadius.circular(40),
            )
          : BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 15),
              ],
              borderRadius: BorderRadius.circular(40),
            ),
      child: isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.nama,
                  style: device.status == 'hidup'
                      ? const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)
                      : const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                Image(
                  color: device.status == 'hidup' ? Colors.white : Colors.black,
                  image: AssetImage(device.image),
                  width: 35,
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      device.status == 'hidup' ? 'On' : 'Off',
                      style: device.status == 'hidup'
                          ? const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)
                          : const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Switch(
                      activeColor: Colors.white,
                      value: device.status == 'hidup',
                      onChanged: (value) => device.onswitch(),
                    ),
                  ],
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
