import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/corewidgets/app_bar_back_button.dart';
import 'package:well_path/corewidgets/well_path_app_bar.dart';
import 'package:well_path/features/notification/cubit/notification_cubit.dart';
import 'package:well_path/features/notification/models/notification_state.dart';
import 'package:well_path/features/notification/network/response/notification_list_response.dart';
import 'package:well_path/helper/mixins/loading_mixin.dart';
import 'package:well_path/helper/mixins/show_message_mixin.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const route = 'noti';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with Loading, Message {
  late final _cubit = context.read<NotificationCubit>();
  @override
  void initState() {
    super.initState();

    initLoadingListener(_cubit.loader, context);
    initMessageListener(_cubit.message, context);
    _cubit.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: WellPathAppBar(
            leading: AppBarBackButton(
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Notifications",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.notificationList.length,
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        element: state.notificationList[index],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({required this.element, super.key});

  final NotificationListItem element;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 7), // Margin around the Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corner radius
      ),
      elevation: 5.0, // Elevation
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CircleAvatar(
                backgroundColor:
                    Colors.blue, // Background color of the CircleAvatar
                radius: 22, // Adjust the size of the CircleAvatar
                child: Icon(Icons.person,
                    color: Colors
                        .white), // You can replace this with your own image or content
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.element.title.toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16, color: const Color(0xFF1A1F36)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.element.description.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14, color: const Color(0xFF1A1F36)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.element.formattedDate(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14, color: const Color(0xFF1A1F36)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // child: ListTile(
      //   leading: CircleAvatar(
      //     backgroundColor: Colors.blue, // Background color of the CircleAvatar
      //     radius: 30, // Adjust the size of the CircleAvatar
      //     child: Icon(Icons.person,
      //         color: Colors
      //             .white), // You can replace this with your own image or content
      //   ),
      //   title: Text('Heading'),
      //   subtitle: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('Description'),
      //       Text('Timestamp'),
      //     ],
      //   ),
      // ),
    );
  }
}
