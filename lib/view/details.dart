import '../allpackages.dart';
import '../controller/report_controller.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ReportController reportController = Get.put(ReportController());
  @override
  void initState() {
    reportController.reportController(api: 'getreports');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reportController.reportLoad.value) {
        return CircularProgressIndicator();
      } else if (reportController.getReportmodel.isEmpty) {
        return Text('AUCUNE DONNÉE DISPONIBLE');
      } else {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    height: 60.0.h,
                    width: 250.0.w,
                    child: GestureDetector(
                      child: TextFormField(
                        style: listStyle,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: appcolor,
                            ),
                            suffixIcon: const Icon(
                              Icons.mic,
                              color: appcolor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: formhintcolor, width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: 'Search your products',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: formhintstylesearch,
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0.h,
                    width: 100.0.w,
                    child: Card(
                      child: ListTile(
                        title: const Icon(Icons.filter_alt_outlined),
                        trailing: Text(
                          'Filter',
                          style: listStyle,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 40.0.h,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'FirstName',
                        style: listStyleappcolor,
                      ),
                      Text(
                        'LastName',
                        style: listStyleappcolor,
                      ),
                      Text(
                        'Mobile',
                        style: listStyleappcolor,
                      ),
                      Text(
                        'Email',
                        style: listStyleappcolor,
                      ),
                      // Text(
                      //   'Address',
                      //   style: listStyleappcolor,
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 900.h,
                width: 1000.w,
                child: ListView.builder(
                    itemCount: reportController.getReportmodel[0].data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Table(
                          defaultColumnWidth: FixedColumnWidth(10.0),
                          border: TableBorder.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1),
                          children: [
                            TableRow(children: [
                              Column(children: [
                                Text(
                                    reportController.getReportmodel[0]
                                        .data[index].firstname!,
                                    style: tablestyle)
                              ]),
                              Column(children: [
                                Text(
                                    reportController.getReportmodel[0]
                                        .data[index].lastname!,
                                    style: tablestyle)
                              ]),
                              Column(children: [
                                Text(
                                    reportController
                                        .getReportmodel[0].data[index].mobile!,
                                    style: tablestyle)
                              ]),
                              Column(children: [
                                Container(
                                  width: 80.w,
                                  child: Text(
                                    reportController
                                        .getReportmodel[0].data[index].email!,
                                    style: tablestyle,
                                  ),
                                )
                              ]),
                            ]),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }
    });
  }
}
