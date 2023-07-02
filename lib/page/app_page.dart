import 'package:flutter/material.dart';

class AppsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: constraints.maxHeight,
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Streamer ID',
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed:(){},
                            child: Text('Search')
                          )
                        ],
                      )

                    ]
                  ),
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Container(
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                    ]
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
