
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:take_a_look/constants/app_colors.dart';

class FormulaItem extends StatelessWidget {
  const FormulaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: .5,
          color: AppColors.greyColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 95,
                      color: Colors.red,
                    ),
                    Text('Current Color'),
                    Text(
                      'Blonde',
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 95,
                      color: Colors.blue,
                    ),
                    Text('Natural Level'),
                    Text(
                      'Lighter Blonde | 08',
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 95,
                      color: Colors.yellow,
                    ),
                    Text('Desired Color'),
                    Text(
                      'Ash',
                      style: TextStyle(
                        fontSize: 10
                      ),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '4 April | 12:00 PM',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.greyColor
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          TextButton(
            onPressed: (){},
            child: const Text(
              'View Formula'
            ),
          )
        ],
      ),
    );
  }
}
