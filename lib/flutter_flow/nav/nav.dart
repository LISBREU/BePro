import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/BeProZastavka1.gif',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/BeProZastavka1.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'PregamePsychology',
          path: '/pregamePsychology',
          builder: (context, params) => PregamePsychologyWidget(),
        ),
        FFRoute(
          name: 'goals',
          path: '/goals',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'goals') : GoalsWidget(),
        ),
        FFRoute(
          name: 'MainMenu1',
          path: '/mainMenu1',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MainMenu1')
              : MainMenu1Widget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: 'StickTech_SkateStick',
          path: '/stickTechSkateStick',
          builder: (context, params) => StickTechSkateStickWidget(),
        ),
        FFRoute(
          name: 'Virazhy_Ulitka',
          path: '/virazhyUlitka',
          builder: (context, params) => VirazhyUlitkaWidget(),
        ),
        FFRoute(
          name: 'Health1',
          path: '/health1',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Health1')
              : Health1Widget(),
        ),
        FFRoute(
          name: 'TechOfSkate',
          path: '/techOfSkate',
          builder: (context, params) => TechOfSkateWidget(),
        ),
        FFRoute(
          name: 'Training',
          path: '/training',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Training')
              : TrainingWidget(),
        ),
        FFRoute(
          name: 'Virazhy',
          path: '/virazhy',
          builder: (context, params) => VirazhyWidget(
            shadowColor: params.getParam('shadowColor', ParamType.Color),
          ),
        ),
        FFRoute(
          name: 'Edges',
          path: '/edges',
          builder: (context, params) => EdgesWidget(),
        ),
        FFRoute(
          name: 'Steps',
          path: '/steps',
          builder: (context, params) => StepsWidget(),
        ),
        FFRoute(
          name: 'Ships',
          path: '/ships',
          builder: (context, params) => ShipsWidget(),
        ),
        FFRoute(
          name: 'Virazhy_FastUlitka',
          path: '/virazhyFastUlitka',
          builder: (context, params) => VirazhyFastUlitkaWidget(),
        ),
        FFRoute(
          name: 'Virazhy_UlitkaBTOF',
          path: '/virazhyUlitkaBTOF',
          builder: (context, params) => VirazhyUlitkaBTOFWidget(),
        ),
        FFRoute(
          name: 'Virazhy_LiyingUlitka',
          path: '/virazhyLiyingUlitka',
          builder: (context, params) => VirazhyLiyingUlitkaWidget(),
        ),
        FFRoute(
          name: 'Virazhy_Christ',
          path: '/virazhyChrist',
          builder: (context, params) => VirazhyChristWidget(),
        ),
        FFRoute(
          name: 'Virazhy_UlitkaPlusJump',
          path: '/virazhyUlitkaPlusJump',
          builder: (context, params) => VirazhyUlitkaPlusJumpWidget(),
        ),
        FFRoute(
          name: 'Edges_Inside',
          path: '/edgesInside',
          builder: (context, params) => EdgesInsideWidget(),
        ),
        FFRoute(
          name: 'Edges_Outside',
          path: '/edgesOutside',
          builder: (context, params) => EdgesOutsideWidget(),
        ),
        FFRoute(
          name: 'Edges_Slalom',
          path: '/edgesSlalom',
          builder: (context, params) => EdgesSlalomWidget(),
        ),
        FFRoute(
          name: 'Edges_Stop1',
          path: '/edgesStop1',
          builder: (context, params) => EdgesStop1Widget(),
        ),
        FFRoute(
          name: 'Edges_Fleshlights',
          path: '/edgesFleshlights',
          builder: (context, params) => EdgesFleshlightsWidget(),
        ),
        FFRoute(
          name: 'Edges_ChristSteps',
          path: '/edgesChristSteps',
          builder: (context, params) => EdgesChristStepsWidget(),
        ),
        FFRoute(
          name: 'Edges_PliometrikaIce',
          path: '/edgesPliometrikaIce',
          builder: (context, params) => EdgesPliometrikaIceWidget(),
        ),
        FFRoute(
          name: 'Edges_Chelnok',
          path: '/edgesChelnok',
          builder: (context, params) => EdgesChelnokWidget(),
        ),
        FFRoute(
          name: 'BTOF_OnBackonForward',
          path: '/bTOFOnBackonForward',
          builder: (context, params) => BTOFOnBackonForwardWidget(),
        ),
        FFRoute(
          name: 'BTOF_Jumping',
          path: '/bTOFJumping',
          builder: (context, params) => BTOFJumpingWidget(),
        ),
        FFRoute(
          name: 'Virazhy_complex',
          path: '/virazhyComplex',
          builder: (context, params) => VirazhyComplexWidget(),
        ),
        FFRoute(
          name: 'EdgesSlicePlusUborPodSebya',
          path: '/edgesSlicePlusUborPodSebya',
          builder: (context, params) => EdgesSlicePlusUborPodSebyaWidget(),
        ),
        FFRoute(
          name: 'VirazhySlicePlusUlitka',
          path: '/virazhySlicePlusUlitka',
          builder: (context, params) => VirazhySlicePlusUlitkaWidget(),
        ),
        FFRoute(
          name: 'Edges_Stop2',
          path: '/edgesStop2',
          builder: (context, params) => EdgesStop2Widget(),
        ),
        FFRoute(
          name: 'Ships_Ship',
          path: '/shipsShip',
          builder: (context, params) => ShipsShipWidget(),
        ),
        FFRoute(
          name: 'Ships_PlusUlitka',
          path: '/shipsPlusUlitka',
          builder: (context, params) => ShipsPlusUlitkaWidget(),
        ),
        FFRoute(
          name: 'Ships_OnForward',
          path: '/shipsOnForward',
          builder: (context, params) => ShipsOnForwardWidget(),
        ),
        FFRoute(
          name: 'Ship_ReversePlusUborPodSebya',
          path: '/shipReversePlusUborPodSebya',
          builder: (context, params) => ShipReversePlusUborPodSebyaWidget(),
        ),
        FFRoute(
          name: 'Ships_BTOFPlus8',
          path: '/shipsBTOFPlus8',
          builder: (context, params) => ShipsBTOFPlus8Widget(),
        ),
        FFRoute(
          name: 'Ships_PlusSit',
          path: '/shipsPlusSit',
          builder: (context, params) => ShipsPlusSitWidget(),
        ),
        FFRoute(
          name: 'Ships_Reverse',
          path: '/shipsReverse',
          builder: (context, params) => ShipsReverseWidget(),
        ),
        FFRoute(
          name: 'Ships_OnForwardAndUlitka',
          path: '/shipsOnForwardAndUlitka',
          builder: (context, params) => ShipsOnForwardAndUlitkaWidget(),
        ),
        FFRoute(
          name: 'Steps_Snake',
          path: '/stepsSnake',
          builder: (context, params) => StepsSnakeWidget(),
        ),
        FFRoute(
          name: 'Steps_FirstLeg',
          path: '/stepsFirstLeg',
          builder: (context, params) => StepsFirstLegWidget(),
        ),
        FFRoute(
          name: 'Steps_SecondLeg',
          path: '/stepsSecondLeg',
          builder: (context, params) => StepsSecondLegWidget(),
        ),
        FFRoute(
          name: 'Steps_FirstLegBack',
          path: '/stepsFirstLegBack',
          builder: (context, params) => StepsFirstLegBackWidget(),
        ),
        FFRoute(
          name: 'Steps_SecondLegBack',
          path: '/stepsSecondLegBack',
          builder: (context, params) => StepsSecondLegBackWidget(),
        ),
        FFRoute(
          name: 'Steps_SecondLegPlus',
          path: '/stepsSecondLegPlus',
          builder: (context, params) => StepsSecondLegPlusWidget(),
        ),
        FFRoute(
          name: 'Steps_SecondLegPlusBack',
          path: '/stepsSecondLegPlusBack',
          builder: (context, params) => StepsSecondLegPlusBackWidget(),
        ),
        FFRoute(
          name: 'Shooting',
          path: '/shooting',
          builder: (context, params) => ShootingWidget(),
        ),
        FFRoute(
          name: 'Shooting_Forehand',
          path: '/shootingForehand',
          builder: (context, params) => ShootingForehandWidget(),
        ),
        FFRoute(
          name: 'Shooting_Backhand',
          path: '/shootingBackhand',
          builder: (context, params) => ShootingBackhandWidget(),
        ),
        FFRoute(
          name: 'Shooting_Shelchok',
          path: '/shootingShelchok',
          builder: (context, params) => ShootingShelchokWidget(),
        ),
        FFRoute(
          name: 'Shooting_RapidShoot',
          path: '/shootingRapidShoot',
          builder: (context, params) => ShootingRapidShootWidget(),
        ),
        FFRoute(
          name: 'Shooting_Statick',
          path: '/shootingStatick',
          builder: (context, params) => ShootingStatickWidget(),
        ),
        FFRoute(
          name: 'Shooting_OneTimer',
          path: '/shootingOneTimer',
          builder: (context, params) => ShootingOneTimerWidget(),
        ),
        FFRoute(
          name: 'Shooting_QuickShotAfterPerebor',
          path: '/shootingQuickShotAfterPerebor',
          builder: (context, params) => ShootingQuickShotAfterPereborWidget(),
        ),
        FFRoute(
          name: 'Shooting_AfterTwoPasses',
          path: '/shootingAfterTwoPasses',
          builder: (context, params) => ShootingAfterTwoPassesWidget(),
        ),
        FFRoute(
          name: 'Shooting_QuickShotAfterPass',
          path: '/shootingQuickShotAfterPass',
          builder: (context, params) => ShootingQuickShotAfterPassWidget(),
        ),
        FFRoute(
          name: 'Shooting_ShootFromMyself',
          path: '/shootingShootFromMyself',
          builder: (context, params) => ShootingShootFromMyselfWidget(),
        ),
        FFRoute(
          name: 'Shooting_FromOneLegStatick',
          path: '/shootingFromOneLegStatick',
          builder: (context, params) => ShootingFromOneLegStatickWidget(),
        ),
        FFRoute(
          name: 'Shooting_shortSchelchok',
          path: '/shootingShortSchelchok',
          builder: (context, params) => ShootingShortSchelchokWidget(),
        ),
        FFRoute(
          name: 'Shooting_FromMyselfAfterSecondPuck',
          path: '/shootingFromMyselfAfterSecondPuck',
          builder: (context, params) =>
              ShootingFromMyselfAfterSecondPuckWidget(),
        ),
        FFRoute(
          name: 'Shooting_SitOnPlatform',
          path: '/shootingSitOnPlatform',
          builder: (context, params) => ShootingSitOnPlatformWidget(),
        ),
        FFRoute(
          name: 'Shooting_OneLegOnPlatformBack',
          path: '/shootingOneLegOnPlatformBack',
          builder: (context, params) => ShootingOneLegOnPlatformBackWidget(),
        ),
        FFRoute(
          name: 'Shooting_QuickShotAfterJumpOnLeg',
          path: '/shootingQuickShotAfterJumpOnLeg',
          builder: (context, params) => ShootingQuickShotAfterJumpOnLegWidget(),
        ),
        FFRoute(
          name: 'Shooting_ShotFromKneeAfterPerestupaniye',
          path: '/shootingShotFromKneeAfterPerestupaniye',
          builder: (context, params) =>
              ShootingShotFromKneeAfterPerestupaniyeWidget(),
        ),
        FFRoute(
          name: 'Shooting_InStaticJumpFromLegToLeg',
          path: '/shootingInStaticJumpFromLegToLeg',
          builder: (context, params) =>
              ShootingInStaticJumpFromLegToLegWidget(),
        ),
        FFRoute(
          name: 'Shooting_QuickShotAfterLieBackhandForehand',
          path: '/shootingQuickShotAfterLieBackhandForehand',
          builder: (context, params) =>
              ShootingQuickShotAfterLieBackhandForehandWidget(),
        ),
        FFRoute(
          name: 'Earth_Lovkost',
          path: '/earthLovkost',
          builder: (context, params) => EarthLovkostWidget(),
        ),
        FFRoute(
          name: 'Earth_Moshnost',
          path: '/earthMoshnost',
          builder: (context, params) => EarthMoshnostWidget(),
        ),
        FFRoute(
          name: 'Earth_Vynoslivost',
          path: '/earthVynoslivost',
          builder: (context, params) => EarthVynoslivostWidget(),
        ),
        FFRoute(
          name: 'Earth_Balance',
          path: '/earthBalance',
          builder: (context, params) => EarthBalanceWidget(),
        ),
        FFRoute(
          name: 'Earth_Force',
          path: '/earthForce',
          builder: (context, params) => EarthForceWidget(),
        ),
        FFRoute(
          name: 'Earth_Speed',
          path: '/earthSpeed',
          builder: (context, params) => EarthSpeedWidget(),
        ),
        FFRoute(
          name: 'AfterGamePsychlogy',
          path: '/afterGamePsychlogy',
          builder: (context, params) => AfterGamePsychlogyWidget(),
        ),
        FFRoute(
          name: 'FreeDayPsychology',
          path: '/freeDayPsychology',
          builder: (context, params) => FreeDayPsychologyWidget(),
        ),
        FFRoute(
          name: 'BeforeTrainingPsychology',
          path: '/beforeTrainingPsychology',
          builder: (context, params) => BeforeTrainingPsychologyWidget(),
        ),
        FFRoute(
          name: 'AfterTrainingPsychology',
          path: '/afterTrainingPsychology',
          builder: (context, params) => AfterTrainingPsychologyWidget(),
        ),
        FFRoute(
          name: 'OnVacationPsychology',
          path: '/onVacationPsychology',
          builder: (context, params) => OnVacationPsychologyWidget(),
        ),
        FFRoute(
          name: 'Sleep_pregame',
          path: '/sleepPregame',
          builder: (context, params) => SleepPregameWidget(),
        ),
        FFRoute(
          name: 'Sleep_aftergame',
          path: '/sleepAftergame',
          builder: (context, params) => SleepAftergameWidget(),
        ),
        FFRoute(
          name: 'Sleep_trainingday',
          path: '/sleepTrainingday',
          builder: (context, params) => SleepTrainingdayWidget(),
        ),
        FFRoute(
          name: 'Sleep_freeday',
          path: '/sleepFreeday',
          builder: (context, params) => SleepFreedayWidget(),
        ),
        FFRoute(
          name: 'Sleep_onvacation',
          path: '/sleepOnvacation',
          builder: (context, params) => SleepOnvacationWidget(),
        ),
        FFRoute(
          name: 'Eating_Pregame',
          path: '/eatingPregame',
          builder: (context, params) => EatingPregameWidget(),
        ),
        FFRoute(
          name: 'Eating_BeforeTraining',
          path: '/eatingBeforeTraining',
          builder: (context, params) => EatingBeforeTrainingWidget(),
        ),
        FFRoute(
          name: 'Eating_AfterTraining',
          path: '/eatingAfterTraining',
          builder: (context, params) => EatingAfterTrainingWidget(),
        ),
        FFRoute(
          name: 'Eating_FreeDays',
          path: '/eatingFreeDays',
          builder: (context, params) => EatingFreeDaysWidget(),
        ),
        FFRoute(
          name: 'Eating_AfterGame',
          path: '/eatingAfterGame',
          builder: (context, params) => EatingAfterGameWidget(),
        ),
        FFRoute(
          name: 'speed_jumping_on_platform',
          path: '/speedJumpingOnPlatform',
          builder: (context, params) => SpeedJumpingOnPlatformWidget(),
        ),
        FFRoute(
          name: 'speed_running_on_lestnitsa',
          path: '/speedRunningOnLestnitsa',
          builder: (context, params) => SpeedRunningOnLestnitsaWidget(),
        ),
        FFRoute(
          name: 'speed_running_on_side',
          path: '/speedRunningOnSide',
          builder: (context, params) => SpeedRunningOnSideWidget(),
        ),
        FFRoute(
          name: 'speed_running_on_place',
          path: '/speedRunningOnPlace',
          builder: (context, params) => SpeedRunningOnPlaceWidget(),
        ),
        FFRoute(
          name: 'speed_sprinting',
          path: '/speedSprinting',
          builder: (context, params) => SpeedSprintingWidget(),
        ),
        FFRoute(
          name: 'speed_snakes',
          path: '/speedSnakes',
          builder: (context, params) => SpeedSnakesWidget(),
        ),
        FFRoute(
          name: 'speed_frogg',
          path: '/speedFrogg',
          builder: (context, params) => SpeedFroggWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_byke',
          path: '/vynoslivostByke',
          builder: (context, params) => VynoslivostBykeWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_circles',
          path: '/vynoslivostCircles',
          builder: (context, params) => VynoslivostCirclesWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_m_football',
          path: '/vynoslivostMFootball',
          builder: (context, params) => VynoslivostMFootballWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_skakalka_p_sprint',
          path: '/vynoslivostSkakalkaPSprint',
          builder: (context, params) => VynoslivostSkakalkaPSprintWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_tabata',
          path: '/vynoslivostTabata',
          builder: (context, params) => VynoslivostTabataWidget(),
        ),
        FFRoute(
          name: 'vynoslivost_swimming',
          path: '/vynoslivostSwimming',
          builder: (context, params) => VynoslivostSwimmingWidget(),
        ),
        FFRoute(
          name: 'moshnost_otzhim_v_pryzhke',
          path: '/moshnostOtzhimVPryzhke',
          builder: (context, params) => MoshnostOtzhimVPryzhkeWidget(),
        ),
        FFRoute(
          name: 'moshnost_jump_from_sit',
          path: '/moshnostJumpFromSit',
          builder: (context, params) => MoshnostJumpFromSitWidget(),
        ),
        FFRoute(
          name: 'moshnost_medicin_ball',
          path: '/moshnostMedicinBall',
          builder: (context, params) => MoshnostMedicinBallWidget(),
        ),
        FFRoute(
          name: 'moshnost_jump_from_one_leg',
          path: '/moshnostJumpFromOneLeg',
          builder: (context, params) => MoshnostJumpFromOneLegWidget(),
        ),
        FFRoute(
          name: 'moshnost_paliometrica',
          path: '/moshnostPaliometrica',
          builder: (context, params) => MoshnostPaliometricaWidget(),
        ),
        FFRoute(
          name: 'moshnost_zhgut',
          path: '/moshnostZhgut',
          builder: (context, params) => MoshnostZhgutWidget(),
        ),
        FFRoute(
          name: 'moshnost_zhim',
          path: '/moshnostZhim',
          builder: (context, params) => MoshnostZhimWidget(),
        ),
        FFRoute(
          name: 'lovkst_kuvyrok',
          path: '/lovkstKuvyrok',
          builder: (context, params) => LovkstKuvyrokWidget(),
        ),
        FFRoute(
          name: 'lovkost_step',
          path: '/lovkostStep',
          builder: (context, params) => LovkostStepWidget(),
        ),
        FFRoute(
          name: 'lovkost_legging',
          path: '/lovkostLegging',
          builder: (context, params) => LovkostLeggingWidget(),
        ),
        FFRoute(
          name: 'lovkost_jump_on_side',
          path: '/lovkostJumpOnSide',
          builder: (context, params) => LovkostJumpOnSideWidget(),
        ),
        FFRoute(
          name: 'lovkost_prygalka',
          path: '/lovkostPrygalka',
          builder: (context, params) => LovkostPrygalkaWidget(),
        ),
        FFRoute(
          name: 'lovkost_small_area',
          path: '/lovkostSmallArea',
          builder: (context, params) => LovkostSmallAreaWidget(),
        ),
        FFRoute(
          name: 'lovkost_tennisball',
          path: '/lovkostTennisball',
          builder: (context, params) => LovkostTennisballWidget(),
        ),
        FFRoute(
          name: 'force_bicepcs',
          path: '/forceBicepcs',
          builder: (context, params) => ForceBicepcsWidget(),
        ),
        FFRoute(
          name: 'force_brusya',
          path: '/forceBrusya',
          builder: (context, params) => ForceBrusyaWidget(),
        ),
        FFRoute(
          name: 'force_plank',
          path: '/forcePlank',
          builder: (context, params) => ForcePlankWidget(),
        ),
        FFRoute(
          name: 'force_turnik',
          path: '/forceTurnik',
          builder: (context, params) => ForceTurnikWidget(),
        ),
        FFRoute(
          name: 'force_sit',
          path: '/forceSit',
          builder: (context, params) => ForceSitWidget(),
        ),
        FFRoute(
          name: 'force_tyaga',
          path: '/forceTyaga',
          builder: (context, params) => ForceTyagaWidget(),
        ),
        FFRoute(
          name: 'force_otzhim_pauk',
          path: '/forceOtzhimPauk',
          builder: (context, params) => ForceOtzhimPaukWidget(),
        ),
        FFRoute(
          name: 'balance_millenium',
          path: '/balanceMillenium',
          builder: (context, params) => BalanceMilleniumWidget(),
        ),
        FFRoute(
          name: 'balance_prised_on_podushka',
          path: '/balancePrisedOnPodushka',
          builder: (context, params) => BalancePrisedOnPodushkaWidget(),
        ),
        FFRoute(
          name: 'balance_supermen',
          path: '/balanceSupermen',
          builder: (context, params) => BalanceSupermenWidget(),
        ),
        FFRoute(
          name: 'balance_skruchivanya_v_upore',
          path: '/balanceSkruchivanyaVUpore',
          builder: (context, params) => BalanceSkruchivanyaVUporeWidget(),
        ),
        FFRoute(
          name: 'balance_jump_on_stepup',
          path: '/balanceJumpOnStepup',
          builder: (context, params) => BalanceJumpOnStepupWidget(),
        ),
        FFRoute(
          name: 'balance_one_leg_sit',
          path: '/balanceOneLegSit',
          builder: (context, params) => BalanceOneLegSitWidget(),
        ),
        FFRoute(
          name: 'balance_bird',
          path: '/balanceBird',
          builder: (context, params) => BalanceBirdWidget(),
        ),
        FFRoute(
          name: 'ice_stick_tech',
          path: '/iceStickTech',
          builder: (context, params) => IceStickTechWidget(),
        ),
        FFRoute(
          name: 'stick_eight',
          path: '/stickEight',
          builder: (context, params) => StickEightWidget(),
        ),
        FFRoute(
          name: 'stick_weight_perebor',
          path: '/stickWeightPerebor',
          builder: (context, params) => StickWeightPereborWidget(),
        ),
        FFRoute(
          name: 'stick_underself',
          path: '/stickUnderself',
          builder: (context, params) => StickUnderselfWidget(),
        ),
        FFRoute(
          name: 'stick_forehand',
          path: '/stickForehand',
          builder: (context, params) => StickForehandWidget(),
        ),
        FFRoute(
          name: 'stick_backhand',
          path: '/stickBackhand',
          builder: (context, params) => StickBackhandWidget(),
        ),
        FFRoute(
          name: 'stick_fast_dribble',
          path: '/stickFastDribble',
          builder: (context, params) => StickFastDribbleWidget(),
        ),
        FFRoute(
          name: 'stick_twice_underself',
          path: '/stickTwiceUnderself',
          builder: (context, params) => StickTwiceUnderselfWidget(),
        ),
        FFRoute(
          name: 'stick_speed_puckline',
          path: '/stickSpeedPuckline',
          builder: (context, params) => StickSpeedPucklineWidget(),
        ),
        FFRoute(
          name: 'stick_flypuck',
          path: '/stickFlypuck',
          builder: (context, params) => StickFlypuckWidget(),
        ),
        FFRoute(
          name: 'stick_underself_outself',
          path: '/stickUnderselfOutself',
          builder: (context, params) => StickUnderselfOutselfWidget(),
        ),
        FFRoute(
          name: 'stick_oneHand_line',
          path: '/stickOneHandLine',
          builder: (context, params) => StickOneHandLineWidget(),
        ),
        FFRoute(
          name: 'stick_tetris',
          path: '/stickTetris',
          builder: (context, params) => StickTetrisWidget(),
        ),
        FFRoute(
          name: 'stick_twice_lie',
          path: '/stickTwiceLie',
          builder: (context, params) => StickTwiceLieWidget(),
        ),
        FFRoute(
          name: 'shootout_datsuyk',
          path: '/shootoutDatsuyk',
          builder: (context, params) => ShootoutDatsuykWidget(),
        ),
        FFRoute(
          name: 'shootout_zaripov',
          path: '/shootoutZaripov',
          builder: (context, params) => ShootoutZaripovWidget(),
        ),
        FFRoute(
          name: 'shootout_backhand',
          path: '/shootoutBackhand',
          builder: (context, params) => ShootoutBackhandWidget(),
        ),
        FFRoute(
          name: 'shootouts',
          path: '/shootouts',
          builder: (context, params) => ShootoutsWidget(),
        ),
        FFRoute(
          name: 'shootout_quickShot',
          path: '/shootoutQuickShot',
          builder: (context, params) => ShootoutQuickShotWidget(),
        ),
        FFRoute(
          name: 'shootout_in_house',
          path: '/shootoutInHouse',
          builder: (context, params) => ShootoutInHouseWidget(),
        ),
        FFRoute(
          name: 'shootout_oneHand',
          path: '/shootoutOneHand',
          builder: (context, params) => ShootoutOneHandWidget(),
        ),
        FFRoute(
          name: 'edges_complexOne',
          path: '/edgesComplexOne',
          builder: (context, params) => EdgesComplexOneWidget(),
        ),
        FFRoute(
          name: 'edges_SlalomOneLeg',
          path: '/edgesSlalomOneLeg',
          builder: (context, params) => EdgesSlalomOneLegWidget(),
        ),
        FFRoute(
          name: 'Virazhy_complexOne',
          path: '/virazhyComplexOne',
          builder: (context, params) => VirazhyComplexOneWidget(),
        ),
        FFRoute(
          name: 'Ships_Triangle',
          path: '/shipsTriangle',
          builder: (context, params) => ShipsTriangleWidget(),
        ),
        FFRoute(
          name: 'Ships_TriangleTwo',
          path: '/shipsTriangleTwo',
          builder: (context, params) => ShipsTriangleTwoWidget(),
        ),
        FFRoute(
          name: 'Ships_Christ',
          path: '/shipsChrist',
          builder: (context, params) => ShipsChristWidget(),
        ),
        FFRoute(
          name: 'progress',
          path: '/progress',
          builder: (context, params) => ProgressWidget(),
        ),
        FFRoute(
          name: 'speed_halfJump',
          path: '/speedHalfJump',
          builder: (context, params) => SpeedHalfJumpWidget(),
        ),
        FFRoute(
          name: 'shooting_FromMyselfOutself',
          path: '/shootingFromMyselfOutself',
          builder: (context, params) => ShootingFromMyselfOutselfWidget(),
        ),
        FFRoute(
          name: 'shooting_FromOneLegOnPlatormSide',
          path: '/shootingFromOneLegOnPlatormSide',
          builder: (context, params) => ShootingFromOneLegOnPlatormSideWidget(),
        ),
        FFRoute(
          name: 'BTOF_onBack',
          path: '/bTOFOnBack',
          builder: (context, params) => BTOFOnBackWidget(),
        ),
        FFRoute(
          name: 'changeProfile',
          path: '/changeProfile',
          builder: (context, params) => ChangeProfileWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => HomePageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
