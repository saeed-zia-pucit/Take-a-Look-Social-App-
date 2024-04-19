
part of 'widgets.dart';

class FormulaItem extends StatelessWidget {
  const FormulaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
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
                    const Text('Current Color'),
                    const Text(
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
                    const Text('Natural Level'),
                    const Text(
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
                    const Text('Desired Color'),
                    const Text(
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
