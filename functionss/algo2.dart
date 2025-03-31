import 'package:flutter/material.dart';

class Algo2 extends StatelessWidget {
  const Algo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'int binarySearch(int[] arr, int target) {\n'
                  '    int low = 0;\n'
                  '    int high = arr.length - 1;\n\n'
                  '    while (low <= high) {\n'
                  '        int mid = low + (high - low) / 2;\n\n'
                  '        if (arr[mid] == target) {\n'
                  '            return mid; // Target found\n'
                  '        } else if (arr[mid] < target) {\n'
                  '            low = mid + 1;\n'
                  '        } else {\n'
                  '            high = mid - 1;\n'
                  '        }\n'
                  '    }\n\n'
                  '    return -1; // Target not found\n'
                  '}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'monospace',
                  ),
                ),
              );
  }
}