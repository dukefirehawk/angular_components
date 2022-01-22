// Copyright (c) 2016-2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.9

import 'package:collection/collection.dart' as collection;
import 'package:angular_components/model/ui/display_name.dart';

/// Returns a non-null label.
typedef LabelFunction = String Function();

/// A list with an optional label.
class LabeledList<T> extends collection.DelegatingList<T>
    implements HasUIDisplayName {
  final LabelFunction _labelFcn;

  bool get hasLabel => _labelFcn != null;

  @override
  String get uiDisplayName => _labelFcn != null ? _labelFcn() : null;

  LabeledList(List<T> items, [this._labelFcn]) : super(items);

  LabeledList.withLabelFunction(List<T> items, [LabelFunction labelFcn])
      : this(items, labelFcn);

  LabeledList.withLabel(List<T> items, [String label])
      : this(items, label != null ? (() => label) : null);
}
