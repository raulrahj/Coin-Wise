import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/data.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/screens/action_screens/add_screen.dart';
import 'package:coin_wise/screens/action_screens/categories.dart';
import 'package:coin_wise/screens/main_screens/all_transactions.dart';
import 'package:coin_wise/screens/main_screens/analysis.dart';
import 'package:coin_wise/screens/main_screens/home.dart';
import 'package:coin_wise/screens/main_screens/settings.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
   late Animation<double> _animation;
  late AnimationController _animationController;
 late PageController _pageController;
int? field;
   @override
  void initState() {
    _pageController = PageController();
     _animationController = AnimationController(
      vsync:this ,
      duration:const Duration(milliseconds: 260));
       final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text(
            appbarTitle[page],
            style: boxTitle,
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration:  BoxDecoration(gradient: brightness!=Brightness.light? defaultBoxGradient: defaultBoxGradientDark),
          ),
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar:  SnackBar(
          
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text(
                'Double tap to close the app !',
              ),
            ],
          ),
          shape:const StadiumBorder(),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 70,),
        ),
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              page=index;
              setState(() {
                 setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
              });
            },
            children:const <Widget>[
              Home(),
              AllTransactions(),
              Analysis(),
             Settings(),
            ],
          ),
        ),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionBubble(
        
        // Menu items
        items: <Bubble>[

          // Floating action menu item
          Bubble(
            title:"Categories",
            iconColor :Colors.white,
            bubbleColor : defaultColor,
            icon:Icons.category,
            titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) =>const Categories()));
              _animationController.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title:"Expense",
            iconColor :Colors.white,
            bubbleColor : defaultColor,
            icon:Icons.arrow_circle_up_sharp,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
                isAdd =true;
                        categoryMod = 1;
                         field = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => AddScreen(field: field)));
                        dropDownValue =
                            null; 
              _animationController.reverse();
            },
          ),
          //Floating action menu item
          Bubble(
            title:"Income",
            iconColor :Colors.white,
            bubbleColor : defaultColor,
            icon:Icons.arrow_circle_down_rounded,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
               isAdd = true;
                          categoryMod = 0;
                           field = 0;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => AddScreen(field: field)));
                          dropDownValue =
                              null; 
              _animationController.reverse();
            },
          ),
        ],

        animation: _animation,

        onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
        
        iconColor: defaultPrimaryColor,
        iconData: Icons.add, 
        backGroundColor: defaultColor,
      ),
    
  
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        // brightness ==Brightness.light ? primaryLight: defaultPrimaryColorDark,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
       onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon:const Icon(Icons.home),
            title:const Text('Home'),
            activeColor: primaryDark,
            textAlign: TextAlign.center,
            // inactiveColor: brightness!=Brightness.light? primaryDark :defaultGreyDark
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.account_balance_wallet),
            title:const Text('Transactions'),
            activeColor: primaryDark,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.stacked_line_chart_rounded),
            title:const Text(
              'Statistics',
            ),
            activeColor: primaryDark,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.settings),
            title:const Text('Settings'),
            activeColor: primaryDark,
            textAlign: TextAlign.center,
          ),
        ],
      ));
    
  }
}