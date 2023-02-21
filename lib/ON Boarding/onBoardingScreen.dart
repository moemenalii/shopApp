import 'package:flutter/material.dart';
import 'package:shop_app/Login_Screen/Login_Screen.dart';
import 'package:shop_app/Network/Local/Cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String title;
  final String body;
  final String image;
  BoardingModel({
    required this.title,
    required this.body,
    required this.image});
}
class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardController=PageController();

  bool isLast=false;

  void submit (){
    CacheHelper.saveData(Key: 'boarding', value:true ).then((value) {
      if(value){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
  }
List<BoardingModel>boarding=[
  BoardingModel(title: 'BoardingTitle_1', body: 'BoardingBody_1', image: 'images/onBoard_1.jpg'),
  BoardingModel(title: 'BoardingTitle_2', body: 'BoardingBody_2', image: 'images/onBoard_2.jpg'),
  BoardingModel(title: 'BoardingTitle_3', body: 'BoardingBody_3', image: 'images/onBoard_3.jpg'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text('ShopApp') ,
          actions: [
            TextButton(onPressed: (){
            submit();
              },
              child: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 24)),)
          ],
        ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==boarding.length -1){
                    isLast=true;
                  };
                },
                controller: boardController,
                itemBuilder: (context,index)=>BuildItem(boarding[index]),
                itemCount:boarding.length,
              ),
            ),
            Row(
              children: [
                //لخطوط بتاعت البوردينج بتاعت الصفحات
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(dotHeight: 10,dotWidth: 10,spacing: 5,activeDotColor: Colors.black38),),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(isLast){
                    submit();
                  }else{
                    boardController.nextPage(duration:Duration(seconds: 1),curve: Curves.easeInOutCubicEmphasized);
                  }
                },child: Icon(Icons.arrow_forward_outlined),)
              ],
            ),

          ],
        ),
      ));

  }
}
Widget BuildItem (BoardingModel model)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(child: Image.asset('${model.image}')),
    SizedBox(height:30,),
    Text('${model.title}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
    SizedBox(height:15,),
    Text('${model.body}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


  ],
);