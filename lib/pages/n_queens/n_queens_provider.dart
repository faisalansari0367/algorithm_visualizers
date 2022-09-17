import 'package:algorithm_visualizers/pages/n_queens/models/queen_model.dart';
import 'package:flutter/material.dart';

class NQueensProvider extends ChangeNotifier {
  List<List<QueenModel>> board = [];
  final size = 4;

  NQueensProvider() {
    generateBoard();
  }

  void generateBoard() {
    for (var i = 0; i < size; i++) {
      final row = List.generate(size, (index) => QueenModel("", UniqueKey()));
      board.add(row);
    }
  }

  void solveNqueens() {
    queenPlacer(0, board );
  }

  void queenPlacer(int column, List<List<QueenModel> board) {
    final row = board[column];
    for (var i = 0; i < row.length; i++) {
      if(canPlace(row, column, board )) {

      }
    }
  }

  bool canPlace(List<QueenModel> row, int column, board) {
    final hasInRow = hasQueenInRow(row);
    final hasInColumn = hasQueenInColumn(column);
    
    // upperLeft
    final hasInUpperLeft = hasQueenInUpperLeft(column, row);
    

  }

  bool hasQueenInUpperLeft( int columnIndex, List<QueenModel> row) {

    for (var i = 0; i < row.length; i++) {
      if(row[i].isQueen) {
        return true;
      }
    }
    return false;
  }

  bool hasQueenInRow(List<QueenModel> row) {
    for (var i = 0; i < row.length; i++) {
      if(row[i].data != '') {
        return true;

      }
    }
    return false;
  }

   bool hasQueenInColumn(int columnIndex) {
    for (var i = 0; i < board.length; i++) {
      final column = board[i][columnIndex];   
      final hasQueen = column.data == '';
      if(hasQueen) return true; 
    }
    return false;
  }
}
