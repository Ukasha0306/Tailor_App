import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/view/dashboard/customers/add_measurement.dart';

class SelectItemsScreen extends StatefulWidget {
  const SelectItemsScreen({Key? key}) : super(key: key);

  @override
  State<SelectItemsScreen> createState() => _SelectItemsScreenState();
}

class _SelectItemsScreenState extends State<SelectItemsScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Item'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search Item',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Suggested items',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 12),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            ReuseableRow(
                title: 'Pant',
                circleAvatar: const CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'P',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: MeasurementScreen(), withNavBar: false);
                    },
                    child: const Icon(Icons.arrow_forward_ios))),
            const Divider(
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Shirt',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Salwar Kameez',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('All Items',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12)),
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: Colors.black,
            ),
            const ReuseableRow(
                title: 'Pant',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'P',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Shirt',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Salwar Kameez',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Shorts',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'S',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            const ReuseableRow(
                title: 'Frock',
                circleAvatar: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.lightGrayColor,
                  child: Text(
                    'F',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                widget: Icon(Icons.arrow_forward_ios)),
            const Divider(
              height: 0,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title;
  final CircleAvatar circleAvatar;
  final Widget widget;

  const ReuseableRow({
    Key? key,
    required this.title,
    required this.circleAvatar,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(title: Text(title), leading: circleAvatar, trailing: widget),
        ],
      ),
    );
  }
}
