import 'package:assesment_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home/bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                ),
                 Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                                       Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/splash.png', 
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Burger',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Search for groceries',
                  prefixIcon: Icon(Icons.search, size: 30),
                  suffixIcon: Icon(Icons.tune, size: 30),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeLoaded) {
                    final groceries = state.groceries;

                    List<Widget> allGrocery = groceries.map((food) {
                      return FoodCard(food: food, width: width);
                    }).toList();

                    return GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(0),
                        childAspectRatio: 8 / 9,
                        children: allGrocery);

                    // return ListView.builder(
                    
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatefulWidget {
  const FoodCard({
    super.key,
    required this.width,
    required this.food,
  });

  final double width;
  final GroceryEntity food;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    isFavorite = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<DetailsBloc>()
            .add(FetchGroceryDetails(id: widget.food.id));
        Navigator.pushNamed(context, '/details');
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 100,
                    width: widget.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      widget.food.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    icon: isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_outline),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(widget.food.title),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star),
                  Text(widget.food.rating.toString()),
                ],
              ),
              Row(children: [
                if (widget.food.discount !=
                    0) 
                  Text(
                    '£${widget.food.discount}',
                    style: TextStyle(
                      decoration:
                          TextDecoration.lineThrough, 
                      color: Color.fromRGBO(152, 157, 163,
                          1), 
                    ),
                  ),
                if (widget.food.discount != 0)
                  SizedBox(width: 8), 
                Text(
                  '£${widget.food.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                        255, 99, 71, 1), 
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}












// import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../blocs/home/bloc/home_bloc.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocConsumer<HomeBloc, HomeState>(
//               listener: (context, state) {
//                 // TODO: implement listener
//               },
//               builder: (context, state) {

//                 if (state is HomeLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is HomeLoaded) {
//                   return ListView.builder(
//                     itemCount: state.groceries.length,
//                     itemBuilder: (context, index) {
//                       final grocery = state.groceries[index];
//                       return ListTile(
//                         title: Text(grocery.title),
//                         subtitle: Text(grocery.description),
//                         trailing: Text('\$${grocery.price}'),
//                         onTap: () {
//                           context.read<DetailsBloc>().add(FetchGroceryDetails(id: grocery.id));
//                           Navigator.pushNamed(context, '/details');
//                         },
//                       );
//                     },
//                   );
//                 } else if (state is HomeError) {
//                   return Center(
//                     child: Text(state.message),
//                   );
//                 }
//                 return const SizedBox();
                
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
