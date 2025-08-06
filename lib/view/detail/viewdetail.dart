import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:three_dimensional_model/model/product_model.dart';

class ViewDetail extends StatefulWidget {
  final Product item;
  const ViewDetail({super.key, required this.item});

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {
  List<String> sizeList = ['40', '41', '42', '43', '44', '45', '46'];

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
                  ModelViewer(src: 'assets/${widget.item.glbUrl}', ar: false),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ],
              ),
            ),
            Text(widget.item.name),
            Text('Price : ${widget.item.price} USD'),
            Text(widget.item.description.toString()),
            SizedBox(
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizeList.length,
                itemBuilder: (context, index) {
                  final size = sizeList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20 : 10,
                      right: index == sizeList.length - 1 ? 20 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 65,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
