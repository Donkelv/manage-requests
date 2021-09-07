


import 'package:flutter/material.dart';
import 'package:request/views/widgets/adminAccepReq.dart';
import 'package:request/views/widgets/adminPendingReq.dart';
import 'package:request/views/widgets/adminRejected.dart';

List<Widget> adminReqPageViewList = [
  AdminPendingReq(),
  AdminRejectedReq(),
  AdminAcceptedReq(),
];