import 'package:flutter/material.dart';

import 'detailpage_shippingitem.dart';

class ListShippingItems extends StatelessWidget {
  const ListShippingItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shipping Orders',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: ShippingListView(),
      ),
    );
  }
}

class ShippingListView extends StatelessWidget {
  ShippingListView({Key? key}) : super(key: key);

  List<String> images = [
    "assets/happenstance.png",
    "assets/happenstance.png",
    "assets/happenstance.png",
    "assets/happenstance.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const DetailShippingPage()));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // color: Colors.grey,
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "22 Nov 9:00 am",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    
                    const Text("#ORD0987",style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.bold),),
                   
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        text: 'Shipper: ',
                        style: const TextStyle(fontSize: 18.0,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'BlueDart',
                              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 18.0,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: images.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
