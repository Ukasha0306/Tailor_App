import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:tailor_app/resources/color.dart';

List tailors = [

  {'id': 0, 'name': 'Tailor ', 'price': 700},
  {'id': 1, 'name': 'Ukasha', 'price': 750},
  {'id': 2, 'name': 'Rajab Ali', 'price': 800},
  {'id': 3, 'name': 'Zain', 'price': 700},
  {'id': 4, 'name': 'Mehroo', 'price': 750},
];


class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  Uint8List? markerImage;

  static CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(30.20158508289532, 71.52465456932693),
      zoom: 15);

  List<String> images = ['assets/images/machine.png', 'assets/images/machine1.png', 'assets/images/suit.png', 'assets/images/tailor.png', 'assets/images/suit1.png'];

  final List<LatLng> _latlng = <LatLng>[
    LatLng(30.20158508289532, 71.52465456932693),LatLng(30.202660752917943, 71.51904210427473),
    LatLng(30.20240112504382, 71.5118108691141),LatLng(30.209892968576437, 71.51962146134039),
    LatLng(30.20340288412649, 71.52690808209002),
  ];

  List<Marker> _marker = <Marker> [];

  Future<Uint8List> getBytesFromAssets(String path, int width)async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  int selectedTailor = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    for(int i = 0; i< _latlng.length; i++){
      final Uint8List markerIcon = await getBytesFromAssets(images[4], 100);
      _marker.add(Marker(markerId: MarkerId(i.toString()),
          icon:BitmapDescriptor.fromBytes(markerIcon),
          position: _latlng[i],

          infoWindow: InfoWindow(title: 'Tailor '+ i.toString(),snippet: 'tailor')),);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            SafeArea(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints){
                    return SizedBox(
                      height: constraints.maxHeight / 2,
                      child: GoogleMap(initialCameraPosition: _kGooglePlex,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: Set<Marker>.of(_marker),
                        onMapCreated: (GoogleMapController controller){
                          _controller.complete(controller);
                        },
                      ),
                    );}
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.5,
                expand: true,
                minChildSize: 0,
                snapSizes: [0, 0.5],
                snap: false,
                builder: (BuildContext context, ScrollController scrollController){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15)
                      )
                    ),

                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: tailors.length,
                        controller: scrollController,
                        itemBuilder: (context, index){

                          final tailor = tailors[index];
                          if(index == 0){
                            return Padding(padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  SizedBox(width: 50,child: Divider(thickness: 5,),),
                                  Text('Select Tailor or Swipe for More',style: TextStyle(color: AppColors.primaryIconColor, fontWeight: FontWeight.w700),)],
                              ),);
                          }
                          return Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: InkWell(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10),
                                onTap: (){
                                  setState(()  {
                                    selectedTailor = tailor['id'];

                                  });
                                  void updateLocation() async{
                                    GoogleMapController controller = await _controller.future;
                                    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _latlng[index],zoom: 15)));
                                  }
                                  setState(() {
                                    updateLocation();

                                  });


                                },
                                leading: CircleAvatar(
                                  radius: 17,
                                    backgroundImage: AssetImage(
                                        'assets/images/tailor.png'),
                                    backgroundColor: Colors.grey,
                                    child: Container()),
                                title: Text(tailor['name'],),
                                trailing: Text(tailor['price'].toString()),
                                selected: selectedTailor == tailor['id'],
                                selectedTileColor: Colors.grey[200],
                                selectedColor: Colors.blue,
                              ),
                            ),
                          );
                        }),
                  );
                })
          ]
      ),
    );
  }
}
