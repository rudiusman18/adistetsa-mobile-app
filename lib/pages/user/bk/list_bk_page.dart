import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/theme.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';

class ListBkPage extends StatefulWidget {
  @override
  _ListBkPageState createState() => _ListBkPageState();
}

class _ListBkPageState extends State<ListBkPage> {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;
    PreferredSizeWidget perpustakaanAppbar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'HaloBK',
          style: mono1TextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mono6Color,
        shadowColor: mono3Color,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-page/back', (route) => false);
          },
          icon: Icon(Icons.arrow_back),
          color: mono2Color,
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      appBar: perpustakaanAppbar(),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ExpandableNotifier(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Text(
                      'HaloBK',
                      style: mono1TextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/user/bk/daftar-konseling');
                          },
                          child: Text(
                            'Daftar Konseling',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/user/bk/status-data');
                          },
                          child: Text(
                            'Status Data',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: mono3Color,
                  ),
                ],
              ),
            ),
          ),
          rolesModel.name != 'Siswa'
              ? Container()
              : ExpandableNotifier(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Text(
                            'Peminatan dan Lintas Minat',
                            style: mono1TextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          collapsed: Container(),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.setAngket = 'Peminatan';
                                  Navigator.pushNamed(
                                      context, '/user/bk/angket');
                                },
                                child: Text(
                                  'Angket Peminatan',
                                  style: mono1TextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.setAngket = 'Lintas Minat';
                                  Navigator.pushNamed(
                                      context, '/user/bk/angket');
                                },
                                child: Text(
                                  'Angket Lintas Minat',
                                  style: mono1TextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.setAngket = 'Data Diri Siswa';
                                  Navigator.pushNamed(
                                      context, '/user/bk/angket');
                                },
                                child: Text(
                                  'Angket Data Diri Siswa',
                                  style: mono1TextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          thickness: 0.5,
                          color: mono3Color,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
