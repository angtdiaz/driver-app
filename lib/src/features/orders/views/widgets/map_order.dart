import 'package:driver_app/src/features/driver_selection/data/models/driver.dart';
import 'package:driver_app/src/features/orders/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

class MapOrder extends StatefulWidget {
  const MapOrder({Key? key, required this.order, required this.driver})
      : super(key: key);
  final Order order;
  final Driver driver;

  @override
  State<MapOrder> createState() => _MapOrderState();
}

class _MapOrderState extends State<MapOrder> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  final int _markerIdCounter = 1;
  LatLng? markerPosition;

  final Set<Polyline> _polylines = <Polyline>{};

  List<LatLng> polylineCoordinatesDriverStore = [];

  List<LatLng> polylineCoordinatesStoreOrderDestination = [];

  late PolylinePoints polylinePoints;
  // BitmapDescriptor mapMarker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polylinePoints = PolylinePoints();
  }

  void _onMarkerTapped(MarkerId markerId) {
    final Marker? tappedMarker = markers[markerId];
    if (tappedMarker != null) {
      setState(() {
        final MarkerId? previousMarkerId = selectedMarker;
        if (previousMarkerId != null && markers.containsKey(previousMarkerId)) {
          final Marker resetOld = markers[previousMarkerId]!
              .copyWith(iconParam: BitmapDescriptor.defaultMarker);
          markers[previousMarkerId] = resetOld;
        }
        selectedMarker = markerId;
        final Marker newMarker = tappedMarker.copyWith(
          iconParam: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        );
        markers[markerId] = newMarker;

        markerPosition = null;
      });
    }
  }

  void setLocationMarker() {}

  void setMarkers(BuildContext context) {
    const MarkerId markerId = MarkerId("current");
    const MarkerId markerIdS = MarkerId("store");
    const MarkerId markerIdO = MarkerId("order");

    final Marker markerCurrent = Marker(
        markerId: markerId,
        infoWindow: const InfoWindow(title: "Driver location"),
        position: LatLng(widget.driver.lat, widget.driver.lng));
    markers[markerId] = markerCurrent;

    final Marker markerStore = Marker(
        markerId: markerIdS,
        infoWindow: const InfoWindow(title: "Store location"),
        position: LatLng(widget.order.storeLat, widget.order.storeLng));
    markers[markerIdS] = markerStore;

    final Marker markerOrder = Marker(
        markerId: markerIdO,
        infoWindow: const InfoWindow(title: "Order Destination"),
        position: LatLng(widget.order.destLat, widget.order.destLng));
    markers[markerIdO] = markerOrder;
  }

  @override
  Widget build(BuildContext context) {
    setMarkers(context);
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(widget.driver.lat, widget.driver.lng),
      zoom: 14,
    );
    return GoogleMap(
      polylines: _polylines,
      mapType: MapType.normal,
      initialCameraPosition: kGooglePlex,
      markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController controller) {
        setPolylinesDriverStore();
        setPolylinesStoreOrderDestination();
        _controller.complete(controller);
      },
    );
  }

  Future<void> setPolylinesDriverStore() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCVXP1cfcYDquU7JT2XIn_P8we_okRIj_M",
      PointLatLng(widget.driver.lat, widget.driver.lng),
      PointLatLng(widget.order.storeLat, widget.order.storeLng),
    );
    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinatesDriverStore
            .add(LatLng(point.latitude, point.longitude));
      }
    }

    setState(() {
      _polylines.add(
        Polyline(
            polylineId: const PolylineId('polyline'),
            width: 5,
            color: Colors.red,
            points: polylineCoordinatesDriverStore),
      );
    });
  }

  Future<void> setPolylinesStoreOrderDestination() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCVXP1cfcYDquU7JT2XIn_P8we_okRIj_M",
      PointLatLng(widget.order.storeLat, widget.order.storeLng),
      PointLatLng(widget.order.destLat, widget.order.destLng),
    );
    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinatesStoreOrderDestination
            .add(LatLng(point.latitude, point.longitude));
      }
    }

    setState(() {
      _polylines.add(
        Polyline(
            polylineId: const PolylineId('polyline1'),
            width: 5,
            color: Colors.green,
            points: polylineCoordinatesStoreOrderDestination),
      );
    });
  }
}
