import 'package:flutter/material.dart';

class SingerButton extends StatelessWidget {
  const SingerButton({super.key, required this.folderName});
  final String folderName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 500,

              // Your bottom sheet content here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Tieu hai lua'),
                    tileColor: Color.fromARGB(255, 174, 175, 175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    onTap: () {
                      // Handle uploading p shoto
                      Navigator.pop(context);
                    },
                  ),
                   SizedBox(height: 10),
                  ListTile(
                    title: Text('bui tin'),
                    tileColor: Color.fromARGB(255, 174, 175, 175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    onTap: () {
                      // Handle taking a photo
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('bui tin'),
                    tileColor: Color.fromARGB(255, 174, 175, 175),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    onTap: () {
                      // Handle taking a photo
                      Navigator.pop(context);
                    },
                  ),
                  
                  ElevatedButton(
                    child: const Text('Close'),
                    // style: style,
                    onPressed: () => Navigator.pop(context),
                  ),
                  // Add more options as needed
                ],
              ),
            );
          },
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 238, 239, 239)),
        side: MaterialStateProperty.all<BorderSide>(
          // Đường viền của button
          BorderSide(
            color: const Color.fromARGB(255, 216, 214, 214),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 235, 235),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                folderName,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 236, 82, 5)),
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          )
        ]),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
