import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
part 'submit_controller.g.dart';

class SubmitController = _SubmitControllerBase with _$SubmitController;

abstract class _SubmitControllerBase with Store {
  @action
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @observable
  double? latitude;

  @observable
  double? longitude;

  @action
  getPosition() async {
    try {
      Position position = await _determinePosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
