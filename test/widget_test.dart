import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_offers_mohammad_ali/connection/network_helper.dart';
import 'package:job_offers_mohammad_ali/data/models/company.dart';
import 'package:job_offers_mohammad_ali/data/models/location.dart';
import 'package:job_offers_mohammad_ali/data/models/status.dart';
import 'package:job_offers_mohammad_ali/data/repos/jobs_repo.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_event.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_states.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_bloc.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_events.dart';
import 'package:job_offers_mohammad_ali/logic/locale_bloc/locale_states.dart';
import 'package:job_offers_mohammad_ali/main.dart';
import 'package:job_offers_mohammad_ali/presentation/jobs_list_screen.dart';
import 'package:job_offers_mohammad_ali/data/models/job.dart';
import 'package:job_offers_mohammad_ali/data/models/jobs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockJobsBloc extends MockBloc<JobsEvents, JobsStates>
    implements JobsBloc {}

class MockLanguageBloc extends MockBloc<LocaleEvents, LocaleStates>
    implements LocaleBloc {}

class FakeLanguageEvent extends Fake implements LocaleEvents {}

class FakeLanguageState extends Fake implements LocaleStates {}

class MockDio extends Mock implements NetworkHelper {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('JobsListScreen', () {
    late MockJobsBloc mockJobsBloc;
    late MockLanguageBloc mockLanguageBloc;
    late MockDio mockDio;
    late JobsRepo jobsRepo;
    setUp(() {
      mockJobsBloc = MockJobsBloc();
      mockLanguageBloc = MockLanguageBloc();
      mockDio = MockDio();
      jobsRepo = JobsRepo(networkHelper: mockDio);
      when(() => mockJobsBloc.state).thenReturn(JobsFetchInitialState());
      when(() => mockLanguageBloc.state).thenReturn(LocaleInitialState());
      when(() => mockLanguageBloc.locale).thenReturn(const Locale('en'));
    });

    testWidgets('displays jobs when fetch is successful',
        (WidgetTester tester) async {
      // Create a list of mock jobs
      when(() => mockDio.get('/jobs')).thenAnswer((_) async => Response(
            data: {
              // Mock your JSON data here
              "jobs": [
                {
                  "uuid": "1",
                  "vertical": {"nameEn": "Sales"},
                  "company": {
                    "name": "Tamara",
                    "logo": "https://i.ibb.co/VjQhBH5/683ec87cd067544e.jpg"
                  },
                  "location": {"nameEn": "Jeddah"},
                  "workplacePreference": {"nameEn": "On-Site"},
                  "createdDate":
                      DateTime.now().subtract(Duration(days: 5)).toString(),
                },
                {
                  "uuid": "2",
                  "vertical": {"nameEn": "Sales"},
                  "company": {
                    "name": "منجز",
                    "logo": "https://i.ibb.co/Y2v3VDP/images.png"
                  },
                  "location": {"nameEn": "Riyadh"},
                  "workplacePreference": {"nameEn": "On-site"},
                  "createdDate":
                      DateTime.now().subtract(Duration(days: 3)).toString(),
                },
              ]
            },
            statusCode: 200,
            requestOptions: RequestOptions(path: '/jobs'),
          ));

      // Use an initial state
      // Set the state of the mock bloc to JobsFetchSuccess
      whenListen(
        mockLanguageBloc,
        Stream<LocaleStates>.fromIterable([
          LocaleInProgress(),
          LocaleSuccess(locale: Locale('en')),
        ]),
        initialState: LocaleInitialState(),
      );
      whenListen(
        mockJobsBloc,
        Stream.fromIterable([
          JobsFetchSuccess(allJobs: [
            Job(
              uuid: '1',
              vertical: Status(nameEn: 'Sales'),
              company: Company(
                  name: 'Tamara',
                  logo: "https://i.ibb.co/VjQhBH5/683ec87cd067544e.jpg"),
              location: Location(nameEn: 'Jeddah'),
              workplacePreference: Status(nameEn: 'On-Site'),
              createdDate:
                  DateTime.now().subtract(const Duration(days: 5)).toString(),
            ),
            Job(
              uuid: '2',
              vertical: Status(nameEn: 'Sales'),
              company: Company(
                  name: 'منجز', logo: 'https://i.ibb.co/Y2v3VDP/images.png'),
              location: Location(nameEn: 'Riyadh'),
              workplacePreference: Status(nameEn: 'On-site'),
              createdDate:
                  DateTime.now().subtract(const Duration(days: 3)).toString(),
            ),
          ]),
        ]),
        initialState: JobsFetchInitialState(),
      );

      await mockNetworkImagesFor(() async {
        // Build the widget with both BlocProviders
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<JobsBloc>(
                create: (context) => mockJobsBloc,
              ),
              BlocProvider<LocaleBloc>(
                create: (context) => mockLanguageBloc,
              ),
            ],
            child: const MaterialApp(home: JobsListScreen()),
          ),
        );
      });
      // Wait for the jobs to be fetched
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Verify if the jobs are displayed
      expect(find.text('Sales'), findsWidgets);
      expect(find.text('Tamara'), findsOneWidget);
      expect(find.text('منجز'), findsOneWidget);
      expect(
          find.textContaining('days ago'),
          findsNWidgets(
              2)); // Assuming you check for the time difference display
    });

    testWidgets('displays loading indicator when fetching jobs',
        (WidgetTester tester) async {
      // Set the state of the mock bloc to JobsFetchInProgress
      whenListen(
        mockJobsBloc,
        Stream.fromIterable([
          JobsFetchInProgress(),
        ]),
      );

      // Build the widget
      await tester.pumpWidget(
        BlocProvider<JobsBloc>(
          create: (context) => mockJobsBloc,
          child: const MaterialApp(home: JobsListScreen()),
        ),
      );

      // Verify if the CircularProgressIndicator is shown
      expect(find.byWidget(const CircularProgressIndicator()), findsOneWidget);
    });

    testWidgets('displays error message when fetching jobs fails',
        (WidgetTester tester) async {
      // Set the state of the mock bloc to JobsFetchError
      whenListen(
        mockJobsBloc,
        Stream.fromIterable([
          JobsFetchError(),
        ]),
      );

      // Build the widget
      await tester.pumpWidget(
        BlocProvider<JobsBloc>(
          create: (context) => mockJobsBloc,
          child: const MaterialApp(home: JobsListScreen()),
        ),
      );

      // Verify if the error message is shown
      expect(find.text("something went wrong"), findsWidgets);
    });
  });
}
