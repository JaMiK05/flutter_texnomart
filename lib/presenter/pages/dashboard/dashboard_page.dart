import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:flutter_texnomart/presenter/pages/dashboard/provider/dashboard_provider.dart';import 'package:google_fonts/google_fonts.dart';import 'package:provider/provider.dart';import '../../../utils/product_holder.dart';import '../basket/basket_page.dart';import '../catalog/catalog_page.dart';import '../favourite/favourite_page.dart';import '../home/home_page.dart';import '../product_detail/product_details_page.dart';import '../profile/profile_page.dart';class DashboardPage extends StatefulWidget {  final int currentPage;  final ProductHolder? item;  const DashboardPage(this.currentPage, {super.key, this.item});  @override  State<DashboardPage> createState() => _DashboardPageState();}class _DashboardPageState extends State<DashboardPage> {  final PageStorageBucket bucket = PageStorageBucket();  int currentTab = 0;  Widget currentScreen = const HomePage();  final List<Widget> screens = [    const HomePage(),    const CatalogPage(),    const BasketPage(),    const ProfilePage(),  ];  @override  void initState() {    currentTab = widget.currentPage;    currentTab == 2 ? currentScreen = const BasketPage() : const HomePage();    currentTab == 1 ? currentScreen = const CatalogPage() : const HomePage();    currentTab == 5        ? currentScreen = ProductDetailsPage(widget.item!)        : const HomePage();    currentTab == 6 ? currentScreen = const FavouritePage() : const HomePage();    super.initState();  }  @override  void dispose() {    super.dispose();  }  @override  Widget build(BuildContext context) {    return WillPopScope(        onWillPop: () async {          if (currentScreen == screens[0]) {            return true;          } else {            setState(() {              currentScreen = screens[0];              currentTab = 0;            });            return false;          }        },        child: ChangeNotifierProvider(          create: (BuildContext context) => DashboardProvider(),          child: Consumer<DashboardProvider>(            builder: (context, provider, child) {              return Scaffold(                body: PageStorage(                  bucket: bucket,                  child: currentScreen,                ),                bottomNavigationBar: BottomAppBar(                  shape: const CircularNotchedRectangle(),                  child: Container(                    height: 56,                    decoration: const BoxDecoration(                      borderRadius: BorderRadius.only(                        topLeft: Radius.circular(20),                        topRight: Radius.circular(20),                      ),                    ),                    child: Row(                      mainAxisAlignment: MainAxisAlignment.spaceAround,                      children: [                        MaterialButton(                          highlightColor: Colors.transparent,                          splashColor: Colors.transparent,                          onPressed: () {                            setState(() {                              currentScreen = screens[0];                              currentTab = 0;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              SvgPicture.asset(                                'assets/icons/ic_home.svg',                                height: 24,                                width: 24,                                color: currentTab == 0 || currentTab == 5                                    ? const Color(0xFFfbc100)                                    : const Color(0xFF7D7D7D),                              ),                              const SizedBox(height: 7),                              Text(                                'Bosh sahifa',                                style: GoogleFonts.ubuntu(                                  color: currentTab == 0 || currentTab == 5                                      ? const Color(0xFFfbc100)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 1.2,                                ),                              )                            ],                          ),                        ),                        MaterialButton(                          highlightColor: Colors.transparent,                          splashColor: Colors.transparent,                          onPressed: () {                            setState(() {                              currentScreen = screens[1];                              currentTab = 1;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              SvgPicture.asset(                                'assets/icons/ic_category.svg',                                height: 24,                                width: 24,                                color: currentTab == 1                                    ? const Color(0xFFfbc100)                                    : const Color(0xFF7D7D7D),                              ),                              const SizedBox(height: 7),                              Text(                                'Katalog',                                style: GoogleFonts.ubuntu(                                  color: currentTab == 1                                      ? const Color(0xFFfbc100)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 1.2,                                ),                              )                            ],                          ),                        ),                        if (context.read<DashboardProvider>().count != 0)                          MaterialButton(                            highlightColor: Colors.transparent,                            splashColor: Colors.transparent,                            onPressed: () {                              setState(() {                                currentScreen = screens[2];                                currentTab = 2;                              });                            },                            child: Badge(                                backgroundColor: const Color(0xffffc300),                                label: Text(                                  context                                      .watch<DashboardProvider>()                                      .count                                      .toString(),                                  style: GoogleFonts.poppins(                                      color: Colors.black,                                      fontWeight: FontWeight.w700),                                ),                                child: Column(                                  mainAxisAlignment: MainAxisAlignment.center,                                  children: [                                    SvgPicture.asset(                                      'assets/icons/ic_basket.svg',                                      height: 24,                                      width: 24,                                      color: currentTab == 2                                          ? const Color(0xFFfbc100)                                          : const Color(0xFF7D7D7D),                                    ),                                    const SizedBox(height: 7),                                    Text(                                      'Savatcha',                                      style: GoogleFonts.ubuntu(                                        color: currentTab == 2                                            ? const Color(0xFFfbc100)                                            : const Color(0xFF7D7D7D),                                        fontSize: 11,                                        fontWeight: FontWeight.w500,                                        height: 1.2,                                      ),                                    )                                  ],                                )),                          ),                        if (context.read<DashboardProvider>().count == 0)                          MaterialButton(                            highlightColor: Colors.transparent,                            splashColor: Colors.transparent,                            onPressed: () {                              setState(() {                                currentScreen = screens[2];                                currentTab = 2;                              });                            },                            child: Column(                              mainAxisAlignment: MainAxisAlignment.center,                              children: [                                SvgPicture.asset(                                  'assets/icons/ic_basket.svg',                                  height: 24,                                  width: 24,                                  color: currentTab == 2                                      ? const Color(0xFFfbc100)                                      : const Color(0xFF7D7D7D),                                ),                                const SizedBox(height: 7),                                Text(                                  'Savatcha',                                  style: GoogleFonts.ubuntu(                                    color: currentTab == 2                                        ? const Color(0xFFfbc100)                                        : const Color(0xFF7D7D7D),                                    fontSize: 11,                                    fontWeight: FontWeight.w500,                                    height: 1.2,                                  ),                                )                              ],                            ),                          ),                        MaterialButton(                          highlightColor: Colors.transparent,                          splashColor: Colors.transparent,                          onPressed: () {                            setState(() {                              currentScreen = screens[3];                              currentTab = 3;                            });                          },                          child: Column(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              SvgPicture.asset(                                'assets/icons/ic_accaunt.svg',                                height: 24,                                width: 24,                                color: currentTab == 3 || currentTab == 6                                    ? const Color(0xFFfbc100)                                    : const Color(0xFF7D7D7D),                              ),                              const SizedBox(height: 7),                              Text(                                'Profil',                                style: GoogleFonts.ubuntu(                                  color: currentTab == 3 || currentTab == 6                                      ? const Color(0xFFfbc100)                                      : const Color(0xFF7D7D7D),                                  fontSize: 11,                                  fontWeight: FontWeight.w500,                                  height: 1.2,                                ),                              )                            ],                          ),                        ),                      ],                    ),                  ),                ),              );            },          ),        ));  }}