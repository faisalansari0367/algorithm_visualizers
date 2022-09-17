import 'package:algorithm_visualizers/providers/sort_provider.dart';

class InsetionSortProvider extends SortProvider {
  Future<void> updateStatus() async {
    selectedIndex > nextIndex
        ? setStatus('finding the right position of $selectedIndex')
        : setStatus('$selectedIndex is already at the right position');
    await wait();
  }

  @override
  Future<void> sortMethod() async {
    setIterations(0);
    notifyListeners();
    for (var i = 1; i < array.length; i++) {
      final current = array[i];
      setSelectedIndex(i);
      setIterations(iterations + 1);
      notifyListeners();
      await wait();

      int j = i - 1;
      sortedArrayIndex = j;

      notifyListeners();
      await wait();

      while (j >= 0 && current < array[j]) {
        setIterations(iterations + 1);
        array[j + 1] = array[j];
        j--;

        array[j + 1] = -1;
        setNextIndex(j);
        updateStatus();
        notifyListeners();
        await wait();
      }
      array[j + 1] = current;
      notifyListeners();
    }

    reset();
  }
}
