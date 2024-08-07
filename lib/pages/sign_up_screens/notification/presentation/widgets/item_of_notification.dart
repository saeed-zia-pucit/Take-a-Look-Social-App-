part of 'widgets.dart';

class ItemOfNotification extends StatelessWidget {
  const ItemOfNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // final read = context.read<NotificationViewModel>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: .1,
          motion: ScrollMotion(),
          children: [
            SlidableDeleteButton(
              id: "",
              onDeleteSuccess: () {
                //remove the specific record from the list
              },
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.2),
                      shape: BoxShape.circle),
                  child: Text(
                    'TL',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ticket ID KD 89780 was successfully submitted. The admin team will begin resolving it.',
                          style: TextStyle(fontSize: 12),
                        ),
                        const Gap(10),
                        Text(
                          '1 day ago',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
