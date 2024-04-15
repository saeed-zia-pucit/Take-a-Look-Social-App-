
part of 'widgets.dart';

class ItemOfCode extends StatelessWidget {
  const ItemOfCode({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final read = context.read<VerifyViewModel>();
    final watch = context.watch<VerifyViewModel>();
    return SizedBox(
      height: 48,
      width: 48,
      child: TextField(
        controller: read.textControllers[index],
        onChanged: (text) {
          read.moveFocus(context, text.isEmpty, index);
        },
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.whiteColor ,
        ),
        keyboardType: TextInputType.number,
        focusNode: watch.focusNodes[index],
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: (watch.textControllers[index].text.isNotEmpty)?
          AppColors.primaryColor : AppColors.whiteColor,
        ),
      ),
    );
  }
}
