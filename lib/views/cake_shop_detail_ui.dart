import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_app/models/cake_shop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  //สร่างตัวแปรเพื่อรับข้อมูลที่ส่งมาจากอีกหน้าหนึ่ง
  CakeShop? cakeShop;

  //เอาตัวแปรที่สร้างมารับข้อมูลมาจากอีกหน้าหนึ่ง
  CakeShopDetailUi({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  //Method สำหรับโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //Method สำหรับเปิดเว็บไซต์และแอพภายนอกผ่าน url
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ AppBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!
              .name!, //เรียกใช้ตัวแปรโชว์ชื่อร้านที่ส่งมาจากอีกหน้าหนึ่ง
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //กลับไปยังหน้าก่อนหน้า
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      //ส่วนของ Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 50,
            left: 35,
            right: 35,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนของรูปภาพ รูปที่ 1
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), //ทำให้รูปเป็นมุมโค้ง
                  child: Image.asset(
                    widget.cakeShop!
                        .image1!, //เรียกใช้ตัวแปรโชว์รูปภาพที่ส่งมาจากอีกหน้าหนึ่ง
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ส่วนของรูปภาพ รูปที่ 2
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8), //ทำให้รูปเป็นมุมโค้ง
                      child: Image.asset(
                        widget.cakeShop!
                            .image2!, //เรียกใช้ตัวแปรโชว์รูปภาพที่ส่งมาจากอีกหน้าหนึ่ง
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    // ส่วนของรูปภาพ รูปที่ 3
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8), //ทำให้รูปเป็นมุมโค้ง
                      child: Image.asset(
                        widget.cakeShop!
                            .image3!, //เรียกใช้ตัวแปรโชว์รูปภาพที่ส่งมาจากอีกหน้าหนึ่ง
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // ส่วนของชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    widget.cakeShop!
                        .name!, //เรียกใช้ตัวแปรโชว์ชื่อร้านที่ส่งมาจากอีกหน้าหนึ่ง
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเวลาเปิด-ปิดร้าน
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    'เวลาเปิด-ปิด 🕒',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    widget.cakeShop!
                        .openCloseTime!, //เรียกใช้ตัวแปรโชว์ชื่อร้านที่ส่งมาจากอีกหน้าหนึ่ง
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของรายละเอียดร้าน
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    'รายละเอียดร้าน 📝',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    widget.cakeShop!
                        .description!, //เรียกใช้ตัวแปรโชว์รายละเอียดร้านที่ส่งมาจากอีกหน้าหนึ่ง
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของที่อยู่ของร้าน
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    'ที่อยู่ของร้าน 📍',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft, //ชิดซ้าย
                  child: Text(
                    widget.cakeShop!
                        .address!, //เรียกใช้ตัวแปรโชว์ที่อยู่ของร้านที่ส่งมาจากอีกหน้าหนึ่ง
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเบอร์โทร โดยต้องกดโทรออกได้เลย
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(widget.cakeShop!
                        .phone!); //เรียกใช้ Method สำหรับโทรออก โดยส่งเบอร์โทรที่ได้จากตัวแปรที่ส่งมาจากอีกหน้าหนึ่ง
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    '📞 ${widget.cakeShop!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                //ส่วนของเว็บไซต์ โดยต้องกดแล้วเปิดไปยังเว็บไซต์ของร้านได้เลย
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'เปิดเว็บไซต์',
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShop!
                        .website!)); //เรียกใช้ Method สำหรับเปิดเว็บไซต์ โดยส่ง url ที่ได้จากตัวแปรที่ส่งมาจากอีกหน้าหนึ่ง
                  },
                ),
                SizedBox(height: 20),
                //ส่วนของ Facebook โดยต้องกดแล้วเปิดไปยัง Facebook ของร้านได้เลย
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'เปิด Facebook',
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShop!
                        .facebook!)); //เรียกใช้ Method สำหรับเปิดเว็บไซต์ โดยส่ง url ที่ได้จากตัวแปรที่ส่งมาจากอีกหน้าหนึ่ง
                  },
                ),
                SizedBox(height: 20),
                //ส่วนของแผนที่ โดยต้องกดแล้วเปิดไปยังแผนที่ของร้านได้เลย
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: FlutterMap(
                    //กำหนดตำแหน่งบนแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!
                            .latitude!), //เรียกใช้ตัวแปรโชว์ละติจูดที่ส่งมาจากอีกหน้าหนึ่ง
                        double.parse(widget.cakeShop!
                            .longitude!), //เรียกใช้ตัวแปรโชว์ลองจิจูดที่ส่งมาจากอีกหน้าหนึ่ง
                      ),
                      initialZoom: 16,
                    ),
                    //วาดแผนที่ (ไม่ต้องแก้ไข)
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                        subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      //ใส่ Marker แสดงตำแหน่งร้านเค้ก
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShop!
                                  .latitude!), //เรียกใช้ตัวแปรโชว์ละติจูดที่ส่งมาจากอีกหน้าหนึ่ง
                              double.parse(widget.cakeShop!
                                  .longitude!), //เรียกใช้ตัวแปรโชว์ลองจิจูดที่ส่งมาจากอีกหน้าหนึ่ง
                            ),
                            child: InkWell(
                              onTap: () {
                                // เปิดแอปแผนที่
                                _launchInBrowser(
                                  Uri.parse(
                                      'https://www.google.com/maps/search/?api=1&query=${widget.cakeShop!.latitude},${widget.cakeShop!.longitude}'),
                                ); //ส่ง url ที่ได้จากตัวแปรละติจูดและลองจิจูดที่ส่งมาจากอีกหน้าหนึ่ง
                              },
                              child: Icon(
                                Icons.cake,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
