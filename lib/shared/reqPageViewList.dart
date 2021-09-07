

import 'package:flutter/material.dart';
import 'package:request/views/widgets/acceptedReq.dart';
import 'package:request/views/widgets/pendingRequests.dart';
import 'package:request/views/widgets/rejectdRequest.dart';

List<Widget> reqPageViewList = [
  PendingRequests(),
  RejectdRequest(),
  AcceptedReq(),
];