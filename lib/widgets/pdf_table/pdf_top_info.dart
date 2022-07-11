import 'package:flutter/material.dart';

class PDFTopInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: const Text('Heavenly Feast'),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: const Text('Jesus School Weekly Report 2021'),
        ),
        SizedBox(
          height: 20,
        ),
        _buildPDFHEaderInfo('Name of Diocese and Church :',
            'HF Changanacherry,(KTM Dio II)', context),
        SizedBox(
          height: 30,
        ),
        _buildPDFHEaderInfo(
            'Name of Pastor in Charge :', 'Shaji Thomas', context),
        SizedBox(
          height: 30,
        ),
        _buildPDFHEaderInfo('Name of Principal :', 'Rani Saji', context),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _buildPDFHEaderInfo(String label, String text, BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.49,
        child: Text(text, style: TextStyle(fontSize: 12)),
      ),
    ]);
  }
}
