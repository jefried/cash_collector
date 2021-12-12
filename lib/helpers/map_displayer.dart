import 'dart:math';
import 'dart:typed_data';

import 'package:cash_collector/helpers/colors.dart';
import 'package:cash_collector/model/widget_pin_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/gestures.dart';
import 'package:here_sdk/mapview.dart';

class MapDisplayer {
  HereMapController _hereMapController;
  MapCamera _camera;
  MapImage? _poiMapImage;
  List<MapMarker> _mapMarkerList = [];
  List<WidgetPinClient> _mapWidgetMarkerList = [];
  WidgetPinClient? _selectedWidgetClient;
  List<Map<String, dynamic>> _clientsInfos;
  

  MapDisplayer(HereMapController hereMapController, List<Map<String, dynamic>> clientsInfos):
      _camera = hereMapController.camera,
      _clientsInfos = clientsInfos,
      _hereMapController = hereMapController {
    List<GeoCoordinates> geoCoordinateList = _clientsInfos.map(
      (clientInf) {
        GeoCoordinates geoCoordinate = GeoCoordinates(clientInf['latitude'], clientInf['longitude']);
        _addMapMarker(geoCoordinate, clientInf['id']);
        return geoCoordinate;
    }
    ).toList();

    print('***********------------io----------***********');

    GeoBox target = GeoBox.containingGeoCoordinates(geoCoordinateList)!;
    _camera.lookAtAreaWithGeoOrientation(target, GeoOrientationUpdate(20, 0));

  }



  Future<MapMarker> _addPoiMapMarker(GeoCoordinates geoCoordinates) async {
    // Reuse existing MapImage for new map markers.
    if (_poiMapImage == null) {
      Uint8List imagePixelData = await _loadFileAsUint8List('poi.png');
      _poiMapImage = MapImage.withPixelDataAndImageFormat(imagePixelData, ImageFormat.png);
    }

    MapMarker mapMarker = MapMarker(geoCoordinates, _poiMapImage!);
    _hereMapController.mapScene.addMapMarker(mapMarker);
    _mapMarkerList.add(mapMarker);

    return mapMarker;
  }

  int? getSelectedClientId(){
    return _selectedWidgetClient?.clientId;
  }

  setClientAsSelected(int clientId){
    if (_selectedWidgetClient != null){
      if (_selectedWidgetClient?.clientId == clientId){
        return null;
      }
      WidgetPinClient lastSelectedPinClient = _selectedWidgetClient!;
      lastSelectedPinClient.widgetPin.unpin();
      _mapWidgetMarkerList.remove(lastSelectedPinClient);
      _addMapMarker(lastSelectedPinClient.widgetPin.coordinates, lastSelectedPinClient.clientId);
    }
    WidgetPinClient widgetPinClient = _mapWidgetMarkerList.firstWhere(
      (WidgetPinClient element) => element.clientId == clientId
    );
    print(_mapWidgetMarkerList.map((e) => [e.clientId, e.widgetPin.coordinates.longitude, e.widgetPin.coordinates.latitude]));
    print(widgetPinClient.clientId);
    WidgetPin widgetPin = widgetPinClient.widgetPin;
    widgetPin.unpin();
    _mapWidgetMarkerList.remove(widgetPinClient);
    _addWidgetMapMarkerOnSelected(widgetPinClient.widgetPin.coordinates, clientId);
  }

  void _addMapMarker(GeoCoordinates? geoCoordinates, int idClient)  {
    WidgetPin widgetPin = _hereMapController.pinWidget(
      Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20),
        child: const Icon(
          Icons.location_on,
          size: 40,
          color: Color(0xFFA2A2A2),
        ),
      ),
      geoCoordinates!
    )!;
    _mapWidgetMarkerList.add(WidgetPinClient(widgetPin, idClient));
  }

  void _addWidgetMapMarkerOnSelected(GeoCoordinates? geoCoordinates, int idClient)  {
    WidgetPin widgetPin = _hereMapController.pinWidget(
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20),
          child: const Icon(
            Icons.location_on,
            size: 40,
            color: namePresentColor,
          ),
        ),
        geoCoordinates!
    )!;
    _selectedWidgetClient = WidgetPinClient(widgetPin, idClient);
    _mapWidgetMarkerList.add(_selectedWidgetClient!);
    print(geoCoordinates.latitude);
    print(geoCoordinates.longitude);
  }



  Future<Uint8List> _loadFileAsUint8List(String fileName) async {
    // The path refers to the assets directory as specified in pubspec.yaml.
    ByteData fileData = await rootBundle.load('assets/images/map/' + fileName);
    return Uint8List.view(fileData.buffer);
  }

}