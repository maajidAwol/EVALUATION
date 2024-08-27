// import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Details extends StatelessWidget {
//   const Details({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Expanded(
//               child: BlocConsumer<DetailsBloc, DetailsState>(
//             listener: (context, state) {
//               // TODO: implement listener
//             },
//             builder: (context, state) {
//               if(state is DetailsLoading){
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if(state is DetailsLoaded){
//                 final grocery = state.grocery;
//                 return ListTile(
//                 title: Text(grocery.title),
//                 subtitle: Text(grocery.description),
//                 trailing: Text('\$${grocery.price}'),
//               );
                
//               } else if(state is DetailsError){
//                 return Center(
//                   child: Text(state.message),
//                 );
//               }
//               return const SizedBox();
              
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
import 'package:assesment_app/features/grocery/presentation/blocs/details/bloc/details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body:  SingleChildScrollView(
          
          child: BlocConsumer<DetailsBloc, DetailsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if(state is DetailsLoading){
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Center(child: CircularProgressIndicator())],
                    );
                  } else if(state is DetailsLoaded){
                
                    final grocery = state.grocery;
                      List<Widget> options = [];
                      if(grocery.options != null){
                      options = grocery.options!.map((option) {
                        return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option.name),
                            Text('\$${option.price}'),
                          ],
                        ),
                        // subtitle: Text('\$${option.price}'),
                        trailing: Checkbox(
                          value: false,
                          onChanged: (value) {
                          },
                        ),
                        );
                      }).toList();
                      }
                   return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Container(
                        height: 300,
                        width: double.maxFinite,
                        // clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Image.network(
                          grocery.imageUrl,
                          // height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 5),
                
                          height: 40,
                          width: 40,
                          // padding: EdgeInsets.only(left: ),
                          // height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              )),
                          child: GoBack(),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        SizedBox(height: 10),
                
                        ///
                        ///
                        Row(
                          children: [
                            Text(
                              "${grocery.title}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          
                            
                          ],
                        ),
                  Row(children: [
                if (grocery.discount !=
                    0) 
                  Text(
                    '£${grocery.discount}',
                    style: TextStyle(
                      decoration:
                          TextDecoration.lineThrough, 
                      color: Color.fromRGBO(152, 157, 163,
                          1), 
                    ),
                  ),
                if (grocery.discount != 0)
                  SizedBox(width: 8), 
                Text(
                  '£${grocery.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                        255, 99, 71, 1), 
                  ),
                ),
              ]),
                                    Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 4),
                            Text(
                              grocery.rating.toString(), 
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '(123 reviews)', 
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                
                              },
                              child: Text(
                                'See All Reviews',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),            
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          grocery.description,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Additional Options",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                      
                          ...options,
                        AddToCart()
                    ],
                    ),
                  ),
          
          
          
                ],
              );
                
                
                    
                  } else if(state is DetailsError){
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const SizedBox();
                  
                },
              
          ),
        ),
      ),
    );
  }
}





