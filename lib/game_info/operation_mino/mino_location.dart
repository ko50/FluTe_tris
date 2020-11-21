import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';

class MinoLocation {
  List<Cordinate> currentLocation;

  MinoLocation({required this.currentLocation});

  void _toRight() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    tmp.forEach((c) => c.toRight());

    if (PlacedBlocks.doseOverlapWith(tmp)) currentLocation = tmp;
  }

  void _toLeft() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    tmp.forEach((c) => c.toLeft());

    if (PlacedBlocks.doseOverlapWith(tmp)) currentLocation = tmp;
  }

  void _down() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    tmp.forEach((c) => c.down());

    if (PlacedBlocks.doseOverlapWith(tmp)) currentLocation = tmp;
  }

  void _hardDrop() {
    final List<Cordinate> fin = List<Cordinate>.from(currentLocation),
        tmp = List<Cordinate>.from(currentLocation);

    while (true) {
      tmp.forEach((c) => c.down());
      if (PlacedBlocks.doseOverlapWith(tmp)) break;
      fin.forEach((c) => c.down());
    }

    currentLocation = fin;

    // 設置
  }
}
