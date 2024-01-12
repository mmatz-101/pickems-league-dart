import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://zxccvdjhozhrknywjsev.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp4Y2N2ZGpob3pocmtueXdqc2V2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM2ODc4NzIsImV4cCI6MjAxOTI2Mzg3Mn0.EC8kgtexFm-dpEROUrlJhmtJFEo5NGjnzpcK0DGUZ_w';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
