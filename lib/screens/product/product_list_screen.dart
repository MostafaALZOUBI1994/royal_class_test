import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:royal_class_test/screens/product/product_detail_screen.dart';
import '../../bloc/product/product_bloc.dart';
import '../../data/repositories/product_repository.dart';
import '../../widget/product_item.dart';

class ProductListScreen extends StatelessWidget {
  final ProductBloc productBloc = ProductBloc(productRepository: ProductRepository());

  @override
  Widget build(BuildContext context) {
    productBloc.add(LoadProducts());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset("assets/bg-optimized.svg", fit: BoxFit.cover,),
          ),
          Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Choose Your Bike", style: TextStyle(color: Colors.white,fontSize: 20),),
                    Spacer(),
                    Image.asset("assets/search.png")
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 240,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/mainItem.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned.fill(
                      top: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [
                            Image.asset(
                              width: 250,
                              height: 120,
                              'assets/bicycle.png'
                            ),
                            Row(
                              children: [
                                SizedBox(width: 70,),
                                Text("30% Off", style: TextStyle(color: Colors.white),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  bloc: productBloc,
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      if (state.products.isEmpty) {
                        return Center(child: Text('No products available'));
                      }
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 165 / 219,
                          crossAxisSpacing: 16.0, // Adjust the horizontal spacing
                          mainAxisSpacing: 16.0, // Adjust the vertical spacing
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: ProductItem(product: product),
                          );
                        },
                      );
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    } else {
                      return Center(child: Text('Unknown state'));
                    }
                  },
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}