import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/models/service_model.dart';
import '../../../core/helpers/service_type_helper.dart';
import '../../../models/ui/detail_type_model.dart';
import '../update/update_breading_page.dart';
import '../update/update_health_rocords.dart';
import '../update/update_note_page.dart';
import '../update/update_renewals_page.dart';
import '../update/update_service_rocords.dart';
import '../update/update_temperature_page.dart';

class ServicesDetailPage extends StatefulWidget {
  final ServiceModel service;

  const ServicesDetailPage({super.key, required this.service});

  @override
  State<ServicesDetailPage> createState() => _ServicesDetailPageState();
}

class _ServicesDetailPageState extends State<ServicesDetailPage> {
  final service = Get.put(ServiceController());
  DetailTypeModel? detailType;
  String selectedType = "";

  @override
  void initState() {
    setState(() {
      selectedType = widget.service.serviceType;
      detailType = detailHelper(type: widget.service.recordType);
    });
    super.initState();
  }

  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }

  bool healthRecord() {
    final validRecordTypes = {
      ServiceTypeHelper.coggings,
      ServiceTypeHelper.dental,
      ServiceTypeHelper.deworming,
      ServiceTypeHelper.therapy,
      ServiceTypeHelper.vaccination,
      ServiceTypeHelper.vitals,
      ServiceTypeHelper.diagnostics,
      ServiceTypeHelper.ferrier,
      ServiceTypeHelper.generalHealth,
      ServiceTypeHelper.injury,
      ServiceTypeHelper.jointInjection,
      ServiceTypeHelper.medSupp,
    };
    return validRecordTypes.contains(widget.service.recordType);
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      if (widget.service.recordType == ServiceTypeHelper.renewals) {
        return Text(("${widget.service.serviceType} Renewals").toUpperCase(),
            style: Get.theme.textTheme.labelLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ));
      } else {
        return Text(
            (widget.service.recordType != ServiceTypeHelper.service
                    ? widget.service.recordType
                    : widget.service.serviceType)
                .toUpperCase(),
            style: Get.theme.textTheme.labelLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ));
      }
    }

    Widget detailAppBar() {
      return Container(
        height: 69,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new)),
                title(),
                IconButton(
                    onPressed: () =>
                        service.deleteServiceRequest(widget.service.id),
                    icon: Icon(Icons.delete_outline))
              ],
            ),
            SizedBox(height: 12),
            Container(
              height: 1,
              color: Color(0xffD7D7D7),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: detailAppBar()),
        preferredSize: Size.fromHeight(62),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return ListView(
              children: [
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text("Details",
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: Colors.black)),
                ),
                SizedBox(height: 16),
                if (widget.service.recordType == ServiceTypeHelper.notes)
                  UpdateNoteWidget(service: widget.service),
                if (widget.service.recordType == ServiceTypeHelper.temperature)
                  UpdateTemperaturePage(service: widget.service),
                if (widget.service.recordType == ServiceTypeHelper.renewals)
                  UpdateRenewalsPage(service: widget.service),
                if (widget.service.recordType == ServiceTypeHelper.service)
                  UpdateServiceRecords(service: widget.service),
                if (healthRecord())
                  UpdateHealthRecords(service: widget.service),
                if (widget.service.recordType == ServiceTypeHelper.breading)
                  UpdateBreadingPage(service: widget.service),
              ],
            );
          }),
    );
  }
}
