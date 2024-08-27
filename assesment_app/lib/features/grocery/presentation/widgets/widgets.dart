import 'package:flutter/material.dart';

class GoBack extends StatelessWidget {
  const GoBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 18,
        color: Color.fromARGB(255, 63, 81, 243),
      ),
    );
  }
}





class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}


class _AddToCartState extends State<AddToCart> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (itemCount > 1) itemCount--;
                          });
                        },
                      ),
                      Text(
                        '$itemCount',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            itemCount++;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/basket');
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            
         
    );
  }
}
class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}


class _PlaceOrderState extends State<PlaceOrder> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                     
                      Text(
                        '\$200',
                        style: TextStyle(fontSize: 18),
                      ),
                     
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/basket');
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            
         
    );
  }
}

// class BasketList extends StatefulWidget {
//   @override
//   _BasketListState createState() => _BasketListState();
// }

// class _BasketListState extends State<BasketList> {
//   int itemCount = 1;

//   @override
//   Widget build(BuildContext context) {
//     return  Expanded(
//       child: Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(children: [
      
//                   Row(
//                     children: [
//                       Container(
//                         height:50,
//                         width: 50,
//                         child: Image.asset('assets/splash.png'),
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text('Product Name'),
//                               Spacer(),
//                               IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
      
//                           Row(
//                             children: [
//                               Text('Price'),
//                               Spacer(),
//                               Text('Total Price'),
//                             ],
//                           ),
//                           Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () {
//                             setState(() {
//                               if (itemCount > 1) itemCount--;
//                             });
//                           },
//                         ),
//                         Text(
//                           '$itemCount',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.add),
//                           onPressed: () {
//                             setState(() {
//                               itemCount++;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
                   
//                   ],
//                 ),
//                         ],
      
//                       )
//                     ],
      
//                   ),
                  
//                 ],) 
                
                
                
                 
              
           
//       ),
//     );
//   }
// }

class BasketList extends StatefulWidget {
  @override
  _BasketListState createState() => _BasketListState();
}

class _BasketListState extends State<BasketList> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, 
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'assets/splash.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Product Name')),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text('Price')),
                          Text('Total Price'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (itemCount > 1) itemCount--;
                              });
                            },
                          ),
                          Text(
                            '$itemCount',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                itemCount++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
