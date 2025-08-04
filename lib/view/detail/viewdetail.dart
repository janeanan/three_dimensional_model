import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({super.key});

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.transparent,
              child: Stack(
                children: [
                  ModelViewer(
                    src: 'assets/air_jordan_1_low_og_travis_scott_fragment.glb',
                    ar: false,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ],
              ),
            ),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
