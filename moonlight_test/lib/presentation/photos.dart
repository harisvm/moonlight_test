import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';

class Photos extends StatefulWidget {

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Styles',

          ),
          backgroundColor: AppColors.transparent,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/HomeIcons/background_lt.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: BlocBuilder(
                bloc: dashboardBloc,
                builder: (context, snapshot) {
                  if (snapshot is StylesLoaded ||
                      snapshot is InitialDashboardState) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: ListView.separated(
                        itemCount: GlobalData?.styles?.response?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    ServerAddresses.stylesImagePath +
                                        GlobalData.styles.response[index].image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      GlobalData.styles.response[index].name,
                                      style: _theme.textTheme.caption.copyWith(
                                          color: AppColors.black, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, position) {
                          return Divider();
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                })));  }
}
