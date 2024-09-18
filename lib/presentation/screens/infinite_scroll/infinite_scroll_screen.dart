import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [11,12,13,14,15];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMouted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ){

        loadNextPage();
      }

    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    isMouted = false;
    super.dispose();
  }

  Future loadNextPage() async {

    if ( isLoading ) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    
    if ( !isMouted ) return;
    
    setState(() {});
    moveScrollToButtom();
    
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if ( !isMouted ) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }
  

  void moveScrollToButtom() {

    if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }


  void addFiveImages () {
    final lastId = imagesIds.last;
    
    imagesIds.addAll(                      // AGREGAR IMAGENES 
      [1,2,3,4,5].map((e) => lastId + e)   // AGRGAMOS ARREGLO SUMANDO CADA UNO A 'lastId'
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return  FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(        
        child: isLoading
        ? SpinPerfect(
          child: const CircularProgressIndicator(),
        )
        : FadeIn(child: const Icon(Icons.arrow_back_ios_rounded)),
          onPressed: () => context.pop(),
      ),

    );
  }
}

