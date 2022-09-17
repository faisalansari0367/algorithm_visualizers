import 'package:algorithm_visualizers/providers/sort_provider.dart';

class SelectionSortProvider extends SortProvider {
  SelectionSortProvider() {
    shuffleArray();
  }

  void changeSmallestElement(int smallestItemIndex, int currentItemIndex) async {
    final temp = array[smallestItemIndex];
    array[smallestItemIndex] = array[currentItemIndex];
    array[currentItemIndex] = temp;
    await wait();
    notifyListeners();
  }

  void setCurrentStatus(int smallest, int current) {
    if (smallest > current) {
      status = '$smallest is greater than $current so swap them';
    } else {
      status = '$smallest is less than $current so no swap';
    }
  }

  @override
  Future<void> sortMethod() async {
    setIterations(0);
    setStatus('Sorting started');
    notifyListeners();
    for (var i = 0; i < array.length; i++) {
      for (var j = i + 1; j < array.length; j++) {
        final smallestElement = array[i];
        final currentElement = array[j];
        setSelectedIndex(i);
        setNextIndex(j);
        setIterations(iterations + 1);
        setCurrentStatus(smallestElement, currentElement);
        notifyListeners();
        await wait();
        if (currentElement < smallestElement) {
          changeSmallestElement(j, i);
        }
      }
    }
  }
}
