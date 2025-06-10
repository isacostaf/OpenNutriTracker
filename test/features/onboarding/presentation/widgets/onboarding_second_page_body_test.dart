import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opennutritracker/generated/l10n.dart';
import 'package:opennutritracker/features/onboarding/presentation/widgets/onboarding_second_page_body.dart';

void main() {
  testWidgets('Case 1: Value is null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    state.validate();
    await tester.pump();

    expect(find.text(S.current.onboardingWrongHeightLabel), findsOneWidget);
  });

  testWidgets('Case 2: Value is empty string with imperial units', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final imperialButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: imperialButton,
      matching: find.text(S.current.ftLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    state.validate();
    await tester.pump();

    expect(find.text(S.current.onboardingWrongHeightLabel), findsNWidgets(2));
  });

  testWidgets('Case 3: Value is different than real numbers with imperial units', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final imperialButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: imperialButton,
      matching: find.text(S.current.ftLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '-9@');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    state.validate();
    await tester.pump();

    expect(find.text(S.current.onboardingWrongHeightLabel), findsNWidgets(2));
  });

  testWidgets('Case 5: Value is empty string with decimal units', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final metricButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: metricButton,
      matching: find.text(S.current.cmLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    state.validate();
    await tester.pump();

    expect(find.text(S.current.onboardingWrongHeightLabel), findsNWidgets(2));
  });

  testWidgets('Case 6: Value is not integer string with decimal units', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final metricButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: metricButton,
      matching: find.text(S.current.cmLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '9.6');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    state.validate();
    await tester.pump();

    expect(find.text(S.current.onboardingWrongHeightLabel), findsOneWidget);
  });

  testWidgets('Case 4: Imperial selected and value is 6.7 (should be valid)', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final imperialButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: imperialButton,
      matching: find.text(S.current.ftLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '6.7');
    await tester.pump();

    final weightField = find.byType(TextFormField).last;
    await tester.enterText(weightField, '150');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    final isValid = state.validate();
    await tester.pump();

    expect(isValid, isTrue);
    expect(find.text(S.current.onboardingWrongHeightLabel), findsNothing);
  });

  testWidgets('Case 7: Metric selected and value is 6.7 (should be valid)', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        S.delegate,
      ],
      home: Scaffold(
        body: OnboardingSecondPageBody(
          setButtonContent: (_, __, ___, ____) {},
        ),
      ),
    ));

    final metricButton = find.byType(ToggleButtons).first;
    await tester.tap(find.descendant(
      of: metricButton,
      matching: find.text(S.current.cmLabel),
    ));
    await tester.pump();

    final heightField = find.byType(TextFormField).first;
    await tester.enterText(heightField, '6.7');
    await tester.pump();

    final weightField = find.byType(TextFormField).last;
    await tester.enterText(weightField, '150');
    await tester.pump();

    final form = find.byType(Form).first;
    final state = tester.state<FormState>(form);
    final isValid = state.validate();
    await tester.pump();

    expect(isValid, isTrue);
    expect(find.text(S.current.onboardingWrongHeightLabel), findsNothing);
  });
}
