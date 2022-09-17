
import 'package:algorithm_visualizers/providers/sort_provider.dart';

class BubbleSortProvider extends SortProvider {
  BubbleSortProvider() {
    shuffleArray();
  }

  @override
  Future<void> sortMethod() async {
    iterations = 0;
    notifyListeners();
    for (var i = 0; i < array.length; i++) {
      for (var j = 0; j < array.length - i - 1; j++) {
        iterations++;
        final currentElement = array[j];
        selectedIndex = j;
        notifyListeners();
        await wait();
        final nextElement = array[j + 1];
        nextIndex = j + 1;
        if (currentElement > nextElement) {
          status = '$currentElement is greater than $nextElement so swap them';
        } else {
          status = '$currentElement is less than $nextElement so no swap';
        }
        notifyListeners();
        await wait();
        if (currentElement > nextElement) {
          final temp = currentElement;
          array[j] = nextElement;
          array[j + 1] = temp;
          notifyListeners();
          await wait();
        }
      }
    }
    isSorted = true;
    selectedIndex = -1;
    nextIndex = -1;
    // iterations = 0;
    status = 'Array is sorted';
    notifyListeners();
  }
}
