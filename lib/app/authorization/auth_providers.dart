

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userPhoneNumStrProvider = StateProvider((ref) => '+7 (900) 000-00-00');
final userPhoneNumProvider = StateProvider((ref) => 9000000000.0);

final hitechProviders = StateProvider((ref) => 'Анализируем...');