import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _amplua = prefs.getString('ff_amplua') ?? _amplua;
    });
    _safeInit(() {
      _team = prefs.getString('ff_team') ?? _team;
    });
    _safeInit(() {
      _numberOfPlayer = prefs.getInt('ff_numberOfPlayer') ?? _numberOfPlayer;
    });
    _safeInit(() {
      _ulitkaProgress = prefs.getDouble('ff_ulitkaProgress') ?? _ulitkaProgress;
    });
    _safeInit(() {
      _allProgress = prefs.getDouble('ff_allProgress') ?? _allProgress;
    });
    _safeInit(() {
      _virazhyPereshagivanieProgress =
          prefs.getDouble('ff_virazhyPereshagivanieProgress') ??
              _virazhyPereshagivanieProgress;
    });
    _safeInit(() {
      _virazhyPodrezanieProgress =
          prefs.getDouble('ff_virazhyPodrezanieProgress') ??
              _virazhyPodrezanieProgress;
    });
    _safeInit(() {
      _virazhyComplexProgress = prefs.getDouble('ff_virazhyComplexProgress') ??
          _virazhyComplexProgress;
    });
    _safeInit(() {
      _virazhyComplexOneProgress =
          prefs.getDouble('ff_virazhyComplexOneProgress') ??
              _virazhyComplexOneProgress;
    });
    _safeInit(() {
      _virazhyComplexTwoProgress =
          prefs.getDouble('ff_virazhyComplexTwoProgress') ??
              _virazhyComplexTwoProgress;
    });
    _safeInit(() {
      _virazhyLyingUlitka =
          prefs.getDouble('ff_virazhyLyingUlitka') ?? _virazhyLyingUlitka;
    });
    _safeInit(() {
      _virazhyFastUlitka =
          prefs.getDouble('ff_virazhyFastUlitka') ?? _virazhyFastUlitka;
    });
    _safeInit(() {
      _virazhyUlitkaPlusProgress =
          prefs.getDouble('ff_virazhyUlitkaPlusProgress') ??
              _virazhyUlitkaPlusProgress;
    });
    _safeInit(() {
      _virazhyUlitkaPlusPlus =
          prefs.getDouble('ff_virazhyUlitkaPlusPlus') ?? _virazhyUlitkaPlusPlus;
    });
    _safeInit(() {
      _virazhyUlitkaPlusJumpProgress =
          prefs.getDouble('ff_virazhyUlitkaPlusJumpProgress') ??
              _virazhyUlitkaPlusJumpProgress;
    });
    _safeInit(() {
      _virazhySlicePlusUlitkaProgress =
          prefs.getDouble('ff_virazhySlicePlusUlitkaProgress') ??
              _virazhySlicePlusUlitkaProgress;
    });
    _safeInit(() {
      _virazhyUlitkaPlusVirazhProgress =
          prefs.getDouble('ff_virazhyUlitkaPlusVirazhProgress') ??
              _virazhyUlitkaPlusVirazhProgress;
    });
    _safeInit(() {
      _stepsFirstLegProgress =
          prefs.getDouble('ff_stepsFirstLegProgress') ?? _stepsFirstLegProgress;
    });
    _safeInit(() {
      _stepsSecondLegProgress = prefs.getDouble('ff_stepsSecondLegProgress') ??
          _stepsSecondLegProgress;
    });
    _safeInit(() {
      _stepsFirstLegBackProgress =
          prefs.getDouble('ff_stepsFirstLegBackProgress') ??
              _stepsFirstLegBackProgress;
    });
    _safeInit(() {
      _stepsFirstLegBackPlusProgress =
          prefs.getDouble('ff_stepsFirstLegBackPlusProgress') ??
              _stepsFirstLegBackPlusProgress;
    });
    _safeInit(() {
      _stepsFirstLegPlusProgress =
          prefs.getDouble('ff_stepsFirstLegPlusProgress') ??
              _stepsFirstLegPlusProgress;
    });
    _safeInit(() {
      _stepsSecondLegBackProgress =
          prefs.getDouble('ff_stepsSecondLegBackProgress') ??
              _stepsSecondLegBackProgress;
    });
    _safeInit(() {
      _stepsSnakeProgress =
          prefs.getDouble('ff_stepsSnakeProgress') ?? _stepsSnakeProgress;
    });
    _safeInit(() {
      _stepsSnakePlusProgress = prefs.getDouble('ff_stepsSnakePlusProgress') ??
          _stepsSnakePlusProgress;
    });
    _safeInit(() {
      _BtoFJumpingProgress =
          prefs.getDouble('ff_BtoFJumpingProgress') ?? _BtoFJumpingProgress;
    });
    _safeInit(() {
      _BtoFBackProgress =
          prefs.getDouble('ff_BtoFBackProgress') ?? _BtoFBackProgress;
    });
    _safeInit(() {
      _BtoFTriangleOne =
          prefs.getDouble('ff_BtoFTriangleOne') ?? _BtoFTriangleOne;
    });
    _safeInit(() {
      _BtoFTriangleTwo =
          prefs.getDouble('ff_BtoFTriangleTwo') ?? _BtoFTriangleTwo;
    });
    _safeInit(() {
      _edgesChristStepsProgress =
          prefs.getDouble('ff_edgesChristStepsProgress') ??
              _edgesChristStepsProgress;
    });
    _safeInit(() {
      _edgesComplexOneProgress =
          prefs.getDouble('ff_edgesComplexOneProgress') ??
              _edgesComplexOneProgress;
    });
    _safeInit(() {
      _edgesComplexTwoProgress =
          prefs.getDouble('ff_edgesComplexTwoProgress') ??
              _edgesComplexTwoProgress;
    });
    _safeInit(() {
      _edgesJumpingProgress =
          prefs.getDouble('ff_edgesJumpingProgress') ?? _edgesJumpingProgress;
    });
    _safeInit(() {
      _edgesInsideProgress =
          prefs.getDouble('ff_edgesInsideProgress') ?? _edgesInsideProgress;
    });
    _safeInit(() {
      _edgesOutsideProgress =
          prefs.getDouble('ff_edgesOutsideProgress') ?? _edgesOutsideProgress;
    });
    _safeInit(() {
      _edgesSlalomProgress =
          prefs.getDouble('ff_edgesSlalomProgress') ?? _edgesSlalomProgress;
    });
    _safeInit(() {
      _edgesUlitkaVBalance =
          prefs.getDouble('ff_edgesUlitkaVBalance') ?? _edgesUlitkaVBalance;
    });
    _safeInit(() {
      _edgesStopOne = prefs.getDouble('ff_edgesStopOne') ?? _edgesStopOne;
    });
    _safeInit(() {
      _edgesStopTwo = prefs.getDouble('ff_edgesStopTwo') ?? _edgesStopTwo;
    });
    _safeInit(() {
      _edgesSkatingPLyingProgress =
          prefs.getDouble('ff_edgesSkatingPLyingProgress') ??
              _edgesSkatingPLyingProgress;
    });
    _safeInit(() {
      _edgesSlicePUborPodSebyaProgress =
          prefs.getDouble('ff_edgesSlicePUborPodSebyaProgress') ??
              _edgesSlicePUborPodSebyaProgress;
    });
    _safeInit(() {
      _edgesFleshlightsProgress =
          prefs.getDouble('ff_edgesFleshlightsProgress') ??
              _edgesFleshlightsProgress;
    });
    _safeInit(() {
      _shipsShipProgress =
          prefs.getDouble('ff_shipsShipProgress') ?? _shipsShipProgress;
    });
    _safeInit(() {
      _shipsReverseProgress =
          prefs.getDouble('ff_shipsReverseProgress') ?? _shipsReverseProgress;
    });
    _safeInit(() {
      _shipsPUlitkaProgress =
          prefs.getDouble('ff_shipsPUlitkaProgress') ?? _shipsPUlitkaProgress;
    });
    _safeInit(() {
      _shipsPVirazhProgress =
          prefs.getDouble('ff_shipsPVirazhProgress') ?? _shipsPVirazhProgress;
    });
    _safeInit(() {
      _shipsComplexOneProgress =
          prefs.getDouble('ff_shipsComplexOneProgress') ??
              _shipsComplexOneProgress;
    });
    _safeInit(() {
      _shipsComplexTwoProgress =
          prefs.getDouble('ff_shipsComplexTwoProgress') ??
              _shipsComplexTwoProgress;
    });
    _safeInit(() {
      _shipsComplexThreeProgress =
          prefs.getDouble('ff_shipsComplexThreeProgress') ??
              _shipsComplexThreeProgress;
    });
    _safeInit(() {
      _shipsPUborPodSebyaProgress =
          prefs.getDouble('ff_shipsPUborPodSebyaProgress') ??
              _shipsPUborPodSebyaProgress;
    });
    _safeInit(() {
      _shipsPEightProgress =
          prefs.getDouble('ff_shipsPEightProgress') ?? _shipsPEightProgress;
    });
    _safeInit(() {
      _shipsPJumpProgress =
          prefs.getDouble('ff_shipsPJumpProgress') ?? _shipsPJumpProgress;
    });
    _safeInit(() {
      _shipsOnForwardProgress = prefs.getDouble('ff_shipsOnForwardProgress') ??
          _shipsOnForwardProgress;
    });
    _safeInit(() {
      _shipsBalance = prefs.getDouble('ff_shipsBalance') ?? _shipsBalance;
    });
    _safeInit(() {
      _shipsJumpPUlitka =
          prefs.getDouble('ff_shipsJumpPUlitka') ?? _shipsJumpPUlitka;
    });
    _safeInit(() {
      _shipsSit = prefs.getDouble('ff_shipsSit') ?? _shipsSit;
    });
    _safeInit(() {
      _stickBackhandProgress =
          prefs.getDouble('ff_stickBackhandProgress') ?? _stickBackhandProgress;
    });
    _safeInit(() {
      _stickFakeShootProgress = prefs.getDouble('ff_stickFakeShootProgress') ??
          _stickFakeShootProgress;
    });
    _safeInit(() {
      _stickEightProgress =
          prefs.getDouble('ff_stickEightProgress') ?? _stickEightProgress;
    });
    _safeInit(() {
      _stickFlyPuckProgress =
          prefs.getDouble('ff_stickFlyPuckProgress') ?? _stickFlyPuckProgress;
    });
    _safeInit(() {
      _stickFastDribbleProgress =
          prefs.getDouble('ff_stickFastDribbleProgress') ??
              _stickFastDribbleProgress;
    });
    _safeInit(() {
      _stickForehandProgress =
          prefs.getDouble('ff_stickForehandProgress') ?? _stickForehandProgress;
    });
    _safeInit(() {
      _stickPucklineProgress =
          prefs.getDouble('ff_stickPucklineProgress') ?? _stickPucklineProgress;
    });
    _safeInit(() {
      _stickTetrisProgress =
          prefs.getDouble('ff_stickTetrisProgress') ?? _stickTetrisProgress;
    });
    _safeInit(() {
      _stickTwiceLieProgress =
          prefs.getDouble('ff_stickTwiceLieProgress') ?? _stickTwiceLieProgress;
    });
    _safeInit(() {
      _stickOneHandLineProgress =
          prefs.getDouble('ff_stickOneHandLineProgress') ??
              _stickOneHandLineProgress;
    });
    _safeInit(() {
      _stickLacrossProgress =
          prefs.getDouble('ff_stickLacrossProgress') ?? _stickLacrossProgress;
    });
    _safeInit(() {
      _stickUnderselfProgress = prefs.getDouble('ff_stickUnderselfProgress') ??
          _stickUnderselfProgress;
    });
    _safeInit(() {
      _stickTwiceUnderselfProgress =
          prefs.getDouble('ff_stickTwiceUnderselfProgress') ??
              _stickTwiceUnderselfProgress;
    });
    _safeInit(() {
      _stickWeightPereborProgress =
          prefs.getDouble('ff_stickWeightPereborProgress') ??
              _stickWeightPereborProgress;
    });
    _safeInit(() {
      _stickSkateStickProgress =
          prefs.getDouble('ff_stickSkateStickProgress') ??
              _stickSkateStickProgress;
    });
    _safeInit(() {
      _stickUnderselfOutselfProgress =
          prefs.getDouble('ff_stickUnderselfOutselfProgress') ??
              _stickUnderselfOutselfProgress;
    });
    _safeInit(() {
      _shootoutBackhandProgress =
          prefs.getDouble('ff_shootoutBackhandProgress') ??
              _shootoutBackhandProgress;
    });
    _safeInit(() {
      _shootoutZaripovProgress =
          prefs.getDouble('ff_shootoutZaripovProgress') ??
              _shootoutZaripovProgress;
    });
    _safeInit(() {
      _shootoutDatsyukProgress =
          prefs.getDouble('ff_shootoutDatsyukProgress') ??
              _shootoutDatsyukProgress;
    });
    _safeInit(() {
      _shootoutOneHandProgress =
          prefs.getDouble('ff_shootoutOneHandProgress') ??
              _shootoutOneHandProgress;
    });
    _safeInit(() {
      _shootoutInHouseProgress =
          prefs.getDouble('ff_shootoutInHouseProgress') ??
              _shootoutInHouseProgress;
    });
    _safeInit(() {
      _shootoutQuickShotProgress =
          prefs.getDouble('ff_shootoutQuickShotProgress') ??
              _shootoutQuickShotProgress;
    });
    _safeInit(() {
      _shootingForehandProgress =
          prefs.getDouble('ff_shootingForehandProgress') ??
              _shootingForehandProgress;
    });
    _safeInit(() {
      _shootingBackhandProgress =
          prefs.getDouble('ff_shootingBackhandProgress') ??
              _shootingBackhandProgress;
    });
    _safeInit(() {
      _shootingAfterLieBFProgress =
          prefs.getDouble('ff_shootingAfterLieBFProgress') ??
              _shootingAfterLieBFProgress;
    });
    _safeInit(() {
      _shootingAfterTwoPasses = prefs.getDouble('ff_shootingAfterTwoPasses') ??
          _shootingAfterTwoPasses;
    });
    _safeInit(() {
      _shootingFromMyselfASPProgress =
          prefs.getDouble('ff_shootingFromMyselfASPProgress') ??
              _shootingFromMyselfASPProgress;
    });
    _safeInit(() {
      _shootingFromOneLegStProgress =
          prefs.getDouble('ff_shootingFromOneLegStProgress') ??
              _shootingFromOneLegStProgress;
    });
    _safeInit(() {
      _shootingHandShootProgress =
          prefs.getDouble('ff_shootingHandShootProgress') ??
              _shootingHandShootProgress;
    });
    _safeInit(() {
      _shootingOneTimerProgress =
          prefs.getDouble('ff_shootingOneTimerProgress') ??
              _shootingOneTimerProgress;
    });
    _safeInit(() {
      _shootingInStJumpFromLegToLegProgress =
          prefs.getDouble('ff_shootingInStJumpFromLegToLegProgress') ??
              _shootingInStJumpFromLegToLegProgress;
    });
    _safeInit(() {
      _shootingOneLegOnSkProgress =
          prefs.getDouble('ff_shootingOneLegOnSkProgress') ??
              _shootingOneLegOnSkProgress;
    });
    _safeInit(() {
      _shootingOneTimerFromKneeProgress =
          prefs.getDouble('ff_shootingOneTimerFromKneeProgress') ??
              _shootingOneTimerFromKneeProgress;
    });
    _safeInit(() {
      _shootingRapidShot =
          prefs.getDouble('ff_shootingRapidShot') ?? _shootingRapidShot;
    });
    _safeInit(() {
      _shootingSchelchokProgress =
          prefs.getDouble('ff_shootingSchelchokProgress') ??
              _shootingSchelchokProgress;
    });
    _safeInit(() {
      _shootingQuickShotAJOLProgress =
          prefs.getDouble('ff_shootingQuickShotAJOLProgress') ??
              _shootingQuickShotAJOLProgress;
    });
    _safeInit(() {
      _shootingQuickShotALBProgress =
          prefs.getDouble('ff_shootingQuickShotALBProgress') ??
              _shootingQuickShotALBProgress;
    });
    _safeInit(() {
      _shootingQuickShotAPassProgress =
          prefs.getDouble('ff_shootingQuickShotAPassProgress') ??
              _shootingQuickShotAPassProgress;
    });
    _safeInit(() {
      _shootingShotFromMyselfProgress =
          prefs.getDouble('ff_shootingShotFromMyselfProgress') ??
              _shootingShotFromMyselfProgress;
    });
    _safeInit(() {
      _shootingStaticProgress = prefs.getDouble('ff_shootingStaticProgress') ??
          _shootingStaticProgress;
    });
    _safeInit(() {
      _shootingSitOnSkProgress =
          prefs.getDouble('ff_shootingSitOnSkProgress') ??
              _shootingSitOnSkProgress;
    });
    _safeInit(() {
      _shootingShotFromKAPProgress =
          prefs.getDouble('ff_shootingShotFromKAPProgress') ??
              _shootingShotFromKAPProgress;
    });
    _safeInit(() {
      _goalGoalsForSeasonBest =
          prefs.getInt('ff_goalGoalsForSeasonBest') ?? _goalGoalsForSeasonBest;
    });
    _safeInit(() {
      _goalGoalsForSeasonNow =
          prefs.getInt('ff_goalGoalsForSeasonNow') ?? _goalGoalsForSeasonNow;
    });
    _safeInit(() {
      _congratsStick = prefs.getBool('ff_congratsStick') ?? _congratsStick;
    });
    _safeInit(() {
      _goalsAssistsForSeasonBest =
          prefs.getInt('ff_goalsAssistsForSeasonBest') ??
              _goalsAssistsForSeasonBest;
    });
    _safeInit(() {
      _goalsAssistsForSeasonNow = prefs.getInt('ff_goalsAssistsForSeasonNow') ??
          _goalsAssistsForSeasonNow;
    });
    _safeInit(() {
      _goalsTeamPointsBest =
          prefs.getInt('ff_goalsTeamPointsBest') ?? _goalsTeamPointsBest;
    });
    _safeInit(() {
      _goalsTeamPointsNow =
          prefs.getInt('ff_goalsTeamPointsNow') ?? _goalsTeamPointsNow;
    });
    _safeInit(() {
      _healthProgress = prefs.getDouble('ff_healthProgress') ?? _healthProgress;
    });
    _safeInit(() {
      _authorisationProgress =
          prefs.getBool('ff_authorisationProgress') ?? _authorisationProgress;
    });
    _safeInit(() {
      _progressShotPower =
          prefs.getInt('ff_progressShotPower') ?? _progressShotPower;
    });
    _safeInit(() {
      _progressShootPowerPrevious =
          prefs.getInt('ff_progressShootPowerPrevious') ??
              _progressShootPowerPrevious;
    });
    _safeInit(() {
      _progressShootAccuracy =
          prefs.getInt('ff_progressShootAccuracy') ?? _progressShootAccuracy;
    });
    _safeInit(() {
      _progressAccuracyPrevious = prefs.getInt('ff_progressAccuracyPrevious') ??
          _progressAccuracyPrevious;
    });
    _safeInit(() {
      _progressAssistAccuracy =
          prefs.getInt('ff_progressAssistAccuracy') ?? _progressAssistAccuracy;
    });
    _safeInit(() {
      _progressAssistAccuracyPrevious =
          prefs.getInt('ff_progressAssistAccuracyPrevious') ??
              _progressAssistAccuracyPrevious;
    });
    _safeInit(() {
      _progressSpeed = prefs.getDouble('ff_progressSpeed') ?? _progressSpeed;
    });
    _safeInit(() {
      _progressSpeedPrevious =
          prefs.getDouble('ff_progressSpeedPrevious') ?? _progressSpeedPrevious;
    });
    _safeInit(() {
      _progressVynoslivost =
          prefs.getDouble('ff_progressVynoslivost') ?? _progressVynoslivost;
    });
    _safeInit(() {
      _progressVynoslivostPrevious =
          prefs.getDouble('ff_progressVynoslivostPrevious') ??
              _progressVynoslivostPrevious;
    });
    _safeInit(() {
      _moshnostAchieve =
          prefs.getDouble('ff_moshnostAchieve') ?? _moshnostAchieve;
    });
    _safeInit(() {
      _moshnost1 = prefs.getInt('ff_moshnost1') ?? _moshnost1;
    });
    _safeInit(() {
      _moshnost2 = prefs.getInt('ff_moshnost2') ?? _moshnost2;
    });
    _safeInit(() {
      _moshnost3 = prefs.getInt('ff_moshnost3') ?? _moshnost3;
    });
    _safeInit(() {
      _moshnost4 = prefs.getInt('ff_moshnost4') ?? _moshnost4;
    });
    _safeInit(() {
      _moshnost5 = prefs.getInt('ff_moshnost5') ?? _moshnost5;
    });
    _safeInit(() {
      _moshnost6 = prefs.getInt('ff_moshnost6') ?? _moshnost6;
    });
    _safeInit(() {
      _moshnost7 = prefs.getInt('ff_moshnost7') ?? _moshnost7;
    });
    _safeInit(() {
      _moshnost8 = prefs.getInt('ff_moshnost8') ?? _moshnost8;
    });
    _safeInit(() {
      _lovkostAchieve = prefs.getDouble('ff_lovkostAchieve') ?? _lovkostAchieve;
    });
    _safeInit(() {
      _lovkost1 = prefs.getInt('ff_lovkost1') ?? _lovkost1;
    });
    _safeInit(() {
      _lovkost2 = prefs.getInt('ff_lovkost2') ?? _lovkost2;
    });
    _safeInit(() {
      _lovkost3 = prefs.getInt('ff_lovkost3') ?? _lovkost3;
    });
    _safeInit(() {
      _lovkost4 = prefs.getInt('ff_lovkost4') ?? _lovkost4;
    });
    _safeInit(() {
      _lovkost5 = prefs.getInt('ff_lovkost5') ?? _lovkost5;
    });
    _safeInit(() {
      _lovkost6 = prefs.getInt('ff_lovkost6') ?? _lovkost6;
    });
    _safeInit(() {
      _lovkost7 = prefs.getInt('ff_lovkost7') ?? _lovkost7;
    });
    _safeInit(() {
      _eSpeedAchieve = prefs.getDouble('ff_eSpeedAchieve') ?? _eSpeedAchieve;
    });
    _safeInit(() {
      _espeed1 = prefs.getInt('ff_espeed1') ?? _espeed1;
    });
    _safeInit(() {
      _espeed2 = prefs.getInt('ff_espeed2') ?? _espeed2;
    });
    _safeInit(() {
      _espeed3 = prefs.getInt('ff_espeed3') ?? _espeed3;
    });
    _safeInit(() {
      _espeed4 = prefs.getInt('ff_espeed4') ?? _espeed4;
    });
    _safeInit(() {
      _espeed5 = prefs.getInt('ff_espeed5') ?? _espeed5;
    });
    _safeInit(() {
      _espeed6 = prefs.getInt('ff_espeed6') ?? _espeed6;
    });
    _safeInit(() {
      _espeed7 = prefs.getInt('ff_espeed7') ?? _espeed7;
    });
    _safeInit(() {
      _espeed8 = prefs.getInt('ff_espeed8') ?? _espeed8;
    });
    _safeInit(() {
      _balanceAchieve = prefs.getDouble('ff_balanceAchieve') ?? _balanceAchieve;
    });
    _safeInit(() {
      _balance1 = prefs.getInt('ff_balance1') ?? _balance1;
    });
    _safeInit(() {
      _balance2 = prefs.getInt('ff_balance2') ?? _balance2;
    });
    _safeInit(() {
      _balance3 = prefs.getInt('ff_balance3') ?? _balance3;
    });
    _safeInit(() {
      _balance4 = prefs.getInt('ff_balance4') ?? _balance4;
    });
    _safeInit(() {
      _balance5 = prefs.getInt('ff_balance5') ?? _balance5;
    });
    _safeInit(() {
      _balance6 = prefs.getInt('ff_balance6') ?? _balance6;
    });
    _safeInit(() {
      _balance7 = prefs.getInt('ff_balance7') ?? _balance7;
    });
    _safeInit(() {
      _forceAchieve = prefs.getDouble('ff_forceAchieve') ?? _forceAchieve;
    });
    _safeInit(() {
      _force1 = prefs.getInt('ff_force1') ?? _force1;
    });
    _safeInit(() {
      _force2 = prefs.getInt('ff_force2') ?? _force2;
    });
    _safeInit(() {
      _force3 = prefs.getInt('ff_force3') ?? _force3;
    });
    _safeInit(() {
      _force4 = prefs.getInt('ff_force4') ?? _force4;
    });
    _safeInit(() {
      _force5 = prefs.getInt('ff_force5') ?? _force5;
    });
    _safeInit(() {
      _force6 = prefs.getInt('ff_force6') ?? _force6;
    });
    _safeInit(() {
      _force7 = prefs.getInt('ff_force7') ?? _force7;
    });
    _safeInit(() {
      _vynoslivostAchieve =
          prefs.getDouble('ff_vynoslivostAchieve') ?? _vynoslivostAchieve;
    });
    _safeInit(() {
      _vynoslivost1 = prefs.getInt('ff_vynoslivost1') ?? _vynoslivost1;
    });
    _safeInit(() {
      _vynoslivost2 = prefs.getInt('ff_vynoslivost2') ?? _vynoslivost2;
    });
    _safeInit(() {
      _vynoslivost3 = prefs.getInt('ff_vynoslivost3') ?? _vynoslivost3;
    });
    _safeInit(() {
      _vynoslivost4 = prefs.getInt('ff_vynoslivost4') ?? _vynoslivost4;
    });
    _safeInit(() {
      _vynoslivost5 = prefs.getInt('ff_vynoslivost5') ?? _vynoslivost5;
    });
    _safeInit(() {
      _vynoslivost6 = prefs.getInt('ff_vynoslivost6') ?? _vynoslivost6;
    });
    _safeInit(() {
      _shootoutAchieve =
          prefs.getDouble('ff_shootoutAchieve') ?? _shootoutAchieve;
    });
    _safeInit(() {
      _edgesChelnokProgress =
          prefs.getDouble('ff_edgesChelnokProgress') ?? _edgesChelnokProgress;
    });
    _safeInit(() {
      _BTOFOnBackOnForwardProgress =
          prefs.getDouble('ff_BTOFOnBackOnForwardProgress') ??
              _BTOFOnBackOnForwardProgress;
    });
    _safeInit(() {
      _shootingFromMyselfOutself =
          prefs.getDouble('ff_shootingFromMyselfOutself') ??
              _shootingFromMyselfOutself;
    });
    _safeInit(() {
      _shootingOneLegOnPlatformBack =
          prefs.getDouble('ff_shootingOneLegOnPlatformBack') ??
              _shootingOneLegOnPlatformBack;
    });
    _safeInit(() {
      _shootingAchieve = prefs.getInt('ff_shootingAchieve') ?? _shootingAchieve;
    });
    _safeInit(() {
      _skateAchieve = prefs.getDouble('ff_skateAchieve') ?? _skateAchieve;
    });
    _safeInit(() {
      _eating1 = prefs.getInt('ff_eating1') ?? _eating1;
    });
    _safeInit(() {
      _eating2 = prefs.getInt('ff_eating2') ?? _eating2;
    });
    _safeInit(() {
      _eating3 = prefs.getInt('ff_eating3') ?? _eating3;
    });
    _safeInit(() {
      _eating4 = prefs.getInt('ff_eating4') ?? _eating4;
    });
    _safeInit(() {
      _eating5 = prefs.getInt('ff_eating5') ?? _eating5;
    });
    _safeInit(() {
      _psychology1 = prefs.getInt('ff_psychology1') ?? _psychology1;
    });
    _safeInit(() {
      _psychology2 = prefs.getInt('ff_psychology2') ?? _psychology2;
    });
    _safeInit(() {
      _psychology3 = prefs.getInt('ff_psychology3') ?? _psychology3;
    });
    _safeInit(() {
      _psychology4 = prefs.getInt('ff_psychology4') ?? _psychology4;
    });
    _safeInit(() {
      _psychology5 = prefs.getInt('ff_psychology5') ?? _psychology5;
    });
    _safeInit(() {
      _psychology6 = prefs.getInt('ff_psychology6') ?? _psychology6;
    });
    _safeInit(() {
      _sleep1 = prefs.getInt('ff_sleep1') ?? _sleep1;
    });
    _safeInit(() {
      _sleep2 = prefs.getInt('ff_sleep2') ?? _sleep2;
    });
    _safeInit(() {
      _sleep3 = prefs.getInt('ff_sleep3') ?? _sleep3;
    });
    _safeInit(() {
      _sleep4 = prefs.getInt('ff_sleep4') ?? _sleep4;
    });
    _safeInit(() {
      _sleep5 = prefs.getInt('ff_sleep5') ?? _sleep5;
    });
    _safeInit(() {
      _goalStickProgress =
          prefs.getInt('ff_goalStickProgress') ?? _goalStickProgress;
    });
    _safeInit(() {
      _goalsCatchingPuckBest =
          prefs.getInt('ff_goalsCatchingPuckBest') ?? _goalsCatchingPuckBest;
    });
    _safeInit(() {
      _goalsCatchingPuckNow =
          prefs.getInt('ff_goalsCatchingPuckNow') ?? _goalsCatchingPuckNow;
    });
    _safeInit(() {
      _goalsPowerMoveBest =
          prefs.getInt('ff_goalsPowerMoveBest') ?? _goalsPowerMoveBest;
    });
    _safeInit(() {
      _goalsPowerMoveNow =
          prefs.getInt('ff_goalsPowerMoveNow') ?? _goalsPowerMoveNow;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  String _amplua = '';
  String get amplua => _amplua;
  set amplua(String _value) {
    _amplua = _value;
    prefs.setString('ff_amplua', _value);
  }

  String _team = '';
  String get team => _team;
  set team(String _value) {
    _team = _value;
    prefs.setString('ff_team', _value);
  }

  int _numberOfPlayer = 0;
  int get numberOfPlayer => _numberOfPlayer;
  set numberOfPlayer(int _value) {
    _numberOfPlayer = _value;
    prefs.setInt('ff_numberOfPlayer', _value);
  }

  double _ulitkaProgress = 0.0;
  double get ulitkaProgress => _ulitkaProgress;
  set ulitkaProgress(double _value) {
    _ulitkaProgress = _value;
    prefs.setDouble('ff_ulitkaProgress', _value);
  }

  double _allProgress = 0.0;
  double get allProgress => _allProgress;
  set allProgress(double _value) {
    _allProgress = _value;
    prefs.setDouble('ff_allProgress', _value);
  }

  double _virazhyPereshagivanieProgress = 0.0;
  double get virazhyPereshagivanieProgress => _virazhyPereshagivanieProgress;
  set virazhyPereshagivanieProgress(double _value) {
    _virazhyPereshagivanieProgress = _value;
    prefs.setDouble('ff_virazhyPereshagivanieProgress', _value);
  }

  double _virazhyPodrezanieProgress = 0.0;
  double get virazhyPodrezanieProgress => _virazhyPodrezanieProgress;
  set virazhyPodrezanieProgress(double _value) {
    _virazhyPodrezanieProgress = _value;
    prefs.setDouble('ff_virazhyPodrezanieProgress', _value);
  }

  double _virazhyComplexProgress = 0.0;
  double get virazhyComplexProgress => _virazhyComplexProgress;
  set virazhyComplexProgress(double _value) {
    _virazhyComplexProgress = _value;
    prefs.setDouble('ff_virazhyComplexProgress', _value);
  }

  double _virazhyComplexOneProgress = 0.0;
  double get virazhyComplexOneProgress => _virazhyComplexOneProgress;
  set virazhyComplexOneProgress(double _value) {
    _virazhyComplexOneProgress = _value;
    prefs.setDouble('ff_virazhyComplexOneProgress', _value);
  }

  double _virazhyComplexTwoProgress = 0.0;
  double get virazhyComplexTwoProgress => _virazhyComplexTwoProgress;
  set virazhyComplexTwoProgress(double _value) {
    _virazhyComplexTwoProgress = _value;
    prefs.setDouble('ff_virazhyComplexTwoProgress', _value);
  }

  double _virazhyLyingUlitka = 0.0;
  double get virazhyLyingUlitka => _virazhyLyingUlitka;
  set virazhyLyingUlitka(double _value) {
    _virazhyLyingUlitka = _value;
    prefs.setDouble('ff_virazhyLyingUlitka', _value);
  }

  double _virazhyFastUlitka = 0.0;
  double get virazhyFastUlitka => _virazhyFastUlitka;
  set virazhyFastUlitka(double _value) {
    _virazhyFastUlitka = _value;
    prefs.setDouble('ff_virazhyFastUlitka', _value);
  }

  double _virazhyUlitkaPlusProgress = 0.0;
  double get virazhyUlitkaPlusProgress => _virazhyUlitkaPlusProgress;
  set virazhyUlitkaPlusProgress(double _value) {
    _virazhyUlitkaPlusProgress = _value;
    prefs.setDouble('ff_virazhyUlitkaPlusProgress', _value);
  }

  double _virazhyUlitkaPlusPlus = 0.0;
  double get virazhyUlitkaPlusPlus => _virazhyUlitkaPlusPlus;
  set virazhyUlitkaPlusPlus(double _value) {
    _virazhyUlitkaPlusPlus = _value;
    prefs.setDouble('ff_virazhyUlitkaPlusPlus', _value);
  }

  double _virazhyUlitkaPlusJumpProgress = 0.0;
  double get virazhyUlitkaPlusJumpProgress => _virazhyUlitkaPlusJumpProgress;
  set virazhyUlitkaPlusJumpProgress(double _value) {
    _virazhyUlitkaPlusJumpProgress = _value;
    prefs.setDouble('ff_virazhyUlitkaPlusJumpProgress', _value);
  }

  double _virazhySlicePlusUlitkaProgress = 0.0;
  double get virazhySlicePlusUlitkaProgress => _virazhySlicePlusUlitkaProgress;
  set virazhySlicePlusUlitkaProgress(double _value) {
    _virazhySlicePlusUlitkaProgress = _value;
    prefs.setDouble('ff_virazhySlicePlusUlitkaProgress', _value);
  }

  double _virazhyUlitkaPlusVirazhProgress = 0.0;
  double get virazhyUlitkaPlusVirazhProgress =>
      _virazhyUlitkaPlusVirazhProgress;
  set virazhyUlitkaPlusVirazhProgress(double _value) {
    _virazhyUlitkaPlusVirazhProgress = _value;
    prefs.setDouble('ff_virazhyUlitkaPlusVirazhProgress', _value);
  }

  double _stepsFirstLegProgress = 0.0;
  double get stepsFirstLegProgress => _stepsFirstLegProgress;
  set stepsFirstLegProgress(double _value) {
    _stepsFirstLegProgress = _value;
    prefs.setDouble('ff_stepsFirstLegProgress', _value);
  }

  double _stepsSecondLegProgress = 0.0;
  double get stepsSecondLegProgress => _stepsSecondLegProgress;
  set stepsSecondLegProgress(double _value) {
    _stepsSecondLegProgress = _value;
    prefs.setDouble('ff_stepsSecondLegProgress', _value);
  }

  double _stepsFirstLegBackProgress = 0.0;
  double get stepsFirstLegBackProgress => _stepsFirstLegBackProgress;
  set stepsFirstLegBackProgress(double _value) {
    _stepsFirstLegBackProgress = _value;
    prefs.setDouble('ff_stepsFirstLegBackProgress', _value);
  }

  double _stepsFirstLegBackPlusProgress = 0.0;
  double get stepsFirstLegBackPlusProgress => _stepsFirstLegBackPlusProgress;
  set stepsFirstLegBackPlusProgress(double _value) {
    _stepsFirstLegBackPlusProgress = _value;
    prefs.setDouble('ff_stepsFirstLegBackPlusProgress', _value);
  }

  double _stepsFirstLegPlusProgress = 0.0;
  double get stepsFirstLegPlusProgress => _stepsFirstLegPlusProgress;
  set stepsFirstLegPlusProgress(double _value) {
    _stepsFirstLegPlusProgress = _value;
    prefs.setDouble('ff_stepsFirstLegPlusProgress', _value);
  }

  double _stepsSecondLegBackProgress = 0.0;
  double get stepsSecondLegBackProgress => _stepsSecondLegBackProgress;
  set stepsSecondLegBackProgress(double _value) {
    _stepsSecondLegBackProgress = _value;
    prefs.setDouble('ff_stepsSecondLegBackProgress', _value);
  }

  double _stepsSnakeProgress = 0.0;
  double get stepsSnakeProgress => _stepsSnakeProgress;
  set stepsSnakeProgress(double _value) {
    _stepsSnakeProgress = _value;
    prefs.setDouble('ff_stepsSnakeProgress', _value);
  }

  double _stepsSnakePlusProgress = 0.0;
  double get stepsSnakePlusProgress => _stepsSnakePlusProgress;
  set stepsSnakePlusProgress(double _value) {
    _stepsSnakePlusProgress = _value;
    prefs.setDouble('ff_stepsSnakePlusProgress', _value);
  }

  double _BtoFJumpingProgress = 0.0;
  double get BtoFJumpingProgress => _BtoFJumpingProgress;
  set BtoFJumpingProgress(double _value) {
    _BtoFJumpingProgress = _value;
    prefs.setDouble('ff_BtoFJumpingProgress', _value);
  }

  double _BtoFBackProgress = 0.0;
  double get BtoFBackProgress => _BtoFBackProgress;
  set BtoFBackProgress(double _value) {
    _BtoFBackProgress = _value;
    prefs.setDouble('ff_BtoFBackProgress', _value);
  }

  double _BtoFTriangleOne = 0.0;
  double get BtoFTriangleOne => _BtoFTriangleOne;
  set BtoFTriangleOne(double _value) {
    _BtoFTriangleOne = _value;
    prefs.setDouble('ff_BtoFTriangleOne', _value);
  }

  double _BtoFTriangleTwo = 0.0;
  double get BtoFTriangleTwo => _BtoFTriangleTwo;
  set BtoFTriangleTwo(double _value) {
    _BtoFTriangleTwo = _value;
    prefs.setDouble('ff_BtoFTriangleTwo', _value);
  }

  double _edgesChristStepsProgress = 0.0;
  double get edgesChristStepsProgress => _edgesChristStepsProgress;
  set edgesChristStepsProgress(double _value) {
    _edgesChristStepsProgress = _value;
    prefs.setDouble('ff_edgesChristStepsProgress', _value);
  }

  double _edgesComplexOneProgress = 0.0;
  double get edgesComplexOneProgress => _edgesComplexOneProgress;
  set edgesComplexOneProgress(double _value) {
    _edgesComplexOneProgress = _value;
    prefs.setDouble('ff_edgesComplexOneProgress', _value);
  }

  double _edgesComplexTwoProgress = 0.0;
  double get edgesComplexTwoProgress => _edgesComplexTwoProgress;
  set edgesComplexTwoProgress(double _value) {
    _edgesComplexTwoProgress = _value;
    prefs.setDouble('ff_edgesComplexTwoProgress', _value);
  }

  double _edgesJumpingProgress = 0.0;
  double get edgesJumpingProgress => _edgesJumpingProgress;
  set edgesJumpingProgress(double _value) {
    _edgesJumpingProgress = _value;
    prefs.setDouble('ff_edgesJumpingProgress', _value);
  }

  double _edgesInsideProgress = 0.0;
  double get edgesInsideProgress => _edgesInsideProgress;
  set edgesInsideProgress(double _value) {
    _edgesInsideProgress = _value;
    prefs.setDouble('ff_edgesInsideProgress', _value);
  }

  double _edgesOutsideProgress = 0.0;
  double get edgesOutsideProgress => _edgesOutsideProgress;
  set edgesOutsideProgress(double _value) {
    _edgesOutsideProgress = _value;
    prefs.setDouble('ff_edgesOutsideProgress', _value);
  }

  double _edgesSlalomProgress = 0.0;
  double get edgesSlalomProgress => _edgesSlalomProgress;
  set edgesSlalomProgress(double _value) {
    _edgesSlalomProgress = _value;
    prefs.setDouble('ff_edgesSlalomProgress', _value);
  }

  double _edgesUlitkaVBalance = 0.0;
  double get edgesUlitkaVBalance => _edgesUlitkaVBalance;
  set edgesUlitkaVBalance(double _value) {
    _edgesUlitkaVBalance = _value;
    prefs.setDouble('ff_edgesUlitkaVBalance', _value);
  }

  double _edgesStopOne = 0.0;
  double get edgesStopOne => _edgesStopOne;
  set edgesStopOne(double _value) {
    _edgesStopOne = _value;
    prefs.setDouble('ff_edgesStopOne', _value);
  }

  double _edgesStopTwo = 0.0;
  double get edgesStopTwo => _edgesStopTwo;
  set edgesStopTwo(double _value) {
    _edgesStopTwo = _value;
    prefs.setDouble('ff_edgesStopTwo', _value);
  }

  double _edgesSkatingPLyingProgress = 0.0;
  double get edgesSkatingPLyingProgress => _edgesSkatingPLyingProgress;
  set edgesSkatingPLyingProgress(double _value) {
    _edgesSkatingPLyingProgress = _value;
    prefs.setDouble('ff_edgesSkatingPLyingProgress', _value);
  }

  double _edgesSlicePUborPodSebyaProgress = 0.0;
  double get edgesSlicePUborPodSebyaProgress =>
      _edgesSlicePUborPodSebyaProgress;
  set edgesSlicePUborPodSebyaProgress(double _value) {
    _edgesSlicePUborPodSebyaProgress = _value;
    prefs.setDouble('ff_edgesSlicePUborPodSebyaProgress', _value);
  }

  double _edgesFleshlightsProgress = 0.0;
  double get edgesFleshlightsProgress => _edgesFleshlightsProgress;
  set edgesFleshlightsProgress(double _value) {
    _edgesFleshlightsProgress = _value;
    prefs.setDouble('ff_edgesFleshlightsProgress', _value);
  }

  double _shipsShipProgress = 0.0;
  double get shipsShipProgress => _shipsShipProgress;
  set shipsShipProgress(double _value) {
    _shipsShipProgress = _value;
    prefs.setDouble('ff_shipsShipProgress', _value);
  }

  double _shipsReverseProgress = 0.0;
  double get shipsReverseProgress => _shipsReverseProgress;
  set shipsReverseProgress(double _value) {
    _shipsReverseProgress = _value;
    prefs.setDouble('ff_shipsReverseProgress', _value);
  }

  double _shipsPUlitkaProgress = 0.0;
  double get shipsPUlitkaProgress => _shipsPUlitkaProgress;
  set shipsPUlitkaProgress(double _value) {
    _shipsPUlitkaProgress = _value;
    prefs.setDouble('ff_shipsPUlitkaProgress', _value);
  }

  double _shipsPVirazhProgress = 0.0;
  double get shipsPVirazhProgress => _shipsPVirazhProgress;
  set shipsPVirazhProgress(double _value) {
    _shipsPVirazhProgress = _value;
    prefs.setDouble('ff_shipsPVirazhProgress', _value);
  }

  double _shipsComplexOneProgress = 0.0;
  double get shipsComplexOneProgress => _shipsComplexOneProgress;
  set shipsComplexOneProgress(double _value) {
    _shipsComplexOneProgress = _value;
    prefs.setDouble('ff_shipsComplexOneProgress', _value);
  }

  double _shipsComplexTwoProgress = 0.0;
  double get shipsComplexTwoProgress => _shipsComplexTwoProgress;
  set shipsComplexTwoProgress(double _value) {
    _shipsComplexTwoProgress = _value;
    prefs.setDouble('ff_shipsComplexTwoProgress', _value);
  }

  double _shipsComplexThreeProgress = 0.0;
  double get shipsComplexThreeProgress => _shipsComplexThreeProgress;
  set shipsComplexThreeProgress(double _value) {
    _shipsComplexThreeProgress = _value;
    prefs.setDouble('ff_shipsComplexThreeProgress', _value);
  }

  double _shipsPUborPodSebyaProgress = 0.0;
  double get shipsPUborPodSebyaProgress => _shipsPUborPodSebyaProgress;
  set shipsPUborPodSebyaProgress(double _value) {
    _shipsPUborPodSebyaProgress = _value;
    prefs.setDouble('ff_shipsPUborPodSebyaProgress', _value);
  }

  double _shipsPEightProgress = 0.0;
  double get shipsPEightProgress => _shipsPEightProgress;
  set shipsPEightProgress(double _value) {
    _shipsPEightProgress = _value;
    prefs.setDouble('ff_shipsPEightProgress', _value);
  }

  double _shipsPJumpProgress = 0.0;
  double get shipsPJumpProgress => _shipsPJumpProgress;
  set shipsPJumpProgress(double _value) {
    _shipsPJumpProgress = _value;
    prefs.setDouble('ff_shipsPJumpProgress', _value);
  }

  double _shipsOnForwardProgress = 0.0;
  double get shipsOnForwardProgress => _shipsOnForwardProgress;
  set shipsOnForwardProgress(double _value) {
    _shipsOnForwardProgress = _value;
    prefs.setDouble('ff_shipsOnForwardProgress', _value);
  }

  double _shipsBalance = 0.0;
  double get shipsBalance => _shipsBalance;
  set shipsBalance(double _value) {
    _shipsBalance = _value;
    prefs.setDouble('ff_shipsBalance', _value);
  }

  double _shipsJumpPUlitka = 0.0;
  double get shipsJumpPUlitka => _shipsJumpPUlitka;
  set shipsJumpPUlitka(double _value) {
    _shipsJumpPUlitka = _value;
    prefs.setDouble('ff_shipsJumpPUlitka', _value);
  }

  double _shipsSit = 0.0;
  double get shipsSit => _shipsSit;
  set shipsSit(double _value) {
    _shipsSit = _value;
    prefs.setDouble('ff_shipsSit', _value);
  }

  double _stickBackhandProgress = 0.0;
  double get stickBackhandProgress => _stickBackhandProgress;
  set stickBackhandProgress(double _value) {
    _stickBackhandProgress = _value;
    prefs.setDouble('ff_stickBackhandProgress', _value);
  }

  double _stickFakeShootProgress = 0.0;
  double get stickFakeShootProgress => _stickFakeShootProgress;
  set stickFakeShootProgress(double _value) {
    _stickFakeShootProgress = _value;
    prefs.setDouble('ff_stickFakeShootProgress', _value);
  }

  double _stickEightProgress = 0.0;
  double get stickEightProgress => _stickEightProgress;
  set stickEightProgress(double _value) {
    _stickEightProgress = _value;
    prefs.setDouble('ff_stickEightProgress', _value);
  }

  double _stickFlyPuckProgress = 0.0;
  double get stickFlyPuckProgress => _stickFlyPuckProgress;
  set stickFlyPuckProgress(double _value) {
    _stickFlyPuckProgress = _value;
    prefs.setDouble('ff_stickFlyPuckProgress', _value);
  }

  double _stickFastDribbleProgress = 0.0;
  double get stickFastDribbleProgress => _stickFastDribbleProgress;
  set stickFastDribbleProgress(double _value) {
    _stickFastDribbleProgress = _value;
    prefs.setDouble('ff_stickFastDribbleProgress', _value);
  }

  double _stickForehandProgress = 0.0;
  double get stickForehandProgress => _stickForehandProgress;
  set stickForehandProgress(double _value) {
    _stickForehandProgress = _value;
    prefs.setDouble('ff_stickForehandProgress', _value);
  }

  double _stickPucklineProgress = 0.0;
  double get stickPucklineProgress => _stickPucklineProgress;
  set stickPucklineProgress(double _value) {
    _stickPucklineProgress = _value;
    prefs.setDouble('ff_stickPucklineProgress', _value);
  }

  double _stickTetrisProgress = 0.0;
  double get stickTetrisProgress => _stickTetrisProgress;
  set stickTetrisProgress(double _value) {
    _stickTetrisProgress = _value;
    prefs.setDouble('ff_stickTetrisProgress', _value);
  }

  double _stickTwiceLieProgress = 0.0;
  double get stickTwiceLieProgress => _stickTwiceLieProgress;
  set stickTwiceLieProgress(double _value) {
    _stickTwiceLieProgress = _value;
    prefs.setDouble('ff_stickTwiceLieProgress', _value);
  }

  double _stickOneHandLineProgress = 0.0;
  double get stickOneHandLineProgress => _stickOneHandLineProgress;
  set stickOneHandLineProgress(double _value) {
    _stickOneHandLineProgress = _value;
    prefs.setDouble('ff_stickOneHandLineProgress', _value);
  }

  double _stickLacrossProgress = 0.0;
  double get stickLacrossProgress => _stickLacrossProgress;
  set stickLacrossProgress(double _value) {
    _stickLacrossProgress = _value;
    prefs.setDouble('ff_stickLacrossProgress', _value);
  }

  double _stickUnderselfProgress = 0.0;
  double get stickUnderselfProgress => _stickUnderselfProgress;
  set stickUnderselfProgress(double _value) {
    _stickUnderselfProgress = _value;
    prefs.setDouble('ff_stickUnderselfProgress', _value);
  }

  double _stickTwiceUnderselfProgress = 0.0;
  double get stickTwiceUnderselfProgress => _stickTwiceUnderselfProgress;
  set stickTwiceUnderselfProgress(double _value) {
    _stickTwiceUnderselfProgress = _value;
    prefs.setDouble('ff_stickTwiceUnderselfProgress', _value);
  }

  double _stickWeightPereborProgress = 0.0;
  double get stickWeightPereborProgress => _stickWeightPereborProgress;
  set stickWeightPereborProgress(double _value) {
    _stickWeightPereborProgress = _value;
    prefs.setDouble('ff_stickWeightPereborProgress', _value);
  }

  double _stickSkateStickProgress = 0.0;
  double get stickSkateStickProgress => _stickSkateStickProgress;
  set stickSkateStickProgress(double _value) {
    _stickSkateStickProgress = _value;
    prefs.setDouble('ff_stickSkateStickProgress', _value);
  }

  double _stickUnderselfOutselfProgress = 0.0;
  double get stickUnderselfOutselfProgress => _stickUnderselfOutselfProgress;
  set stickUnderselfOutselfProgress(double _value) {
    _stickUnderselfOutselfProgress = _value;
    prefs.setDouble('ff_stickUnderselfOutselfProgress', _value);
  }

  double _shootoutBackhandProgress = 0.0;
  double get shootoutBackhandProgress => _shootoutBackhandProgress;
  set shootoutBackhandProgress(double _value) {
    _shootoutBackhandProgress = _value;
    prefs.setDouble('ff_shootoutBackhandProgress', _value);
  }

  double _shootoutZaripovProgress = 0.0;
  double get shootoutZaripovProgress => _shootoutZaripovProgress;
  set shootoutZaripovProgress(double _value) {
    _shootoutZaripovProgress = _value;
    prefs.setDouble('ff_shootoutZaripovProgress', _value);
  }

  double _shootoutDatsyukProgress = 0.0;
  double get shootoutDatsyukProgress => _shootoutDatsyukProgress;
  set shootoutDatsyukProgress(double _value) {
    _shootoutDatsyukProgress = _value;
    prefs.setDouble('ff_shootoutDatsyukProgress', _value);
  }

  double _shootoutOneHandProgress = 0.0;
  double get shootoutOneHandProgress => _shootoutOneHandProgress;
  set shootoutOneHandProgress(double _value) {
    _shootoutOneHandProgress = _value;
    prefs.setDouble('ff_shootoutOneHandProgress', _value);
  }

  double _shootoutInHouseProgress = 0.0;
  double get shootoutInHouseProgress => _shootoutInHouseProgress;
  set shootoutInHouseProgress(double _value) {
    _shootoutInHouseProgress = _value;
    prefs.setDouble('ff_shootoutInHouseProgress', _value);
  }

  double _shootoutQuickShotProgress = 0.0;
  double get shootoutQuickShotProgress => _shootoutQuickShotProgress;
  set shootoutQuickShotProgress(double _value) {
    _shootoutQuickShotProgress = _value;
    prefs.setDouble('ff_shootoutQuickShotProgress', _value);
  }

  double _shootingForehandProgress = 0.0;
  double get shootingForehandProgress => _shootingForehandProgress;
  set shootingForehandProgress(double _value) {
    _shootingForehandProgress = _value;
    prefs.setDouble('ff_shootingForehandProgress', _value);
  }

  double _shootingBackhandProgress = 0.0;
  double get shootingBackhandProgress => _shootingBackhandProgress;
  set shootingBackhandProgress(double _value) {
    _shootingBackhandProgress = _value;
    prefs.setDouble('ff_shootingBackhandProgress', _value);
  }

  double _shootingAfterLieBFProgress = 0.0;
  double get shootingAfterLieBFProgress => _shootingAfterLieBFProgress;
  set shootingAfterLieBFProgress(double _value) {
    _shootingAfterLieBFProgress = _value;
    prefs.setDouble('ff_shootingAfterLieBFProgress', _value);
  }

  double _shootingAfterTwoPasses = 0.0;
  double get shootingAfterTwoPasses => _shootingAfterTwoPasses;
  set shootingAfterTwoPasses(double _value) {
    _shootingAfterTwoPasses = _value;
    prefs.setDouble('ff_shootingAfterTwoPasses', _value);
  }

  double _shootingFromMyselfASPProgress = 0.0;
  double get shootingFromMyselfASPProgress => _shootingFromMyselfASPProgress;
  set shootingFromMyselfASPProgress(double _value) {
    _shootingFromMyselfASPProgress = _value;
    prefs.setDouble('ff_shootingFromMyselfASPProgress', _value);
  }

  double _shootingFromOneLegStProgress = 0.0;
  double get shootingFromOneLegStProgress => _shootingFromOneLegStProgress;
  set shootingFromOneLegStProgress(double _value) {
    _shootingFromOneLegStProgress = _value;
    prefs.setDouble('ff_shootingFromOneLegStProgress', _value);
  }

  double _shootingHandShootProgress = 0.0;
  double get shootingHandShootProgress => _shootingHandShootProgress;
  set shootingHandShootProgress(double _value) {
    _shootingHandShootProgress = _value;
    prefs.setDouble('ff_shootingHandShootProgress', _value);
  }

  double _shootingOneTimerProgress = 0.0;
  double get shootingOneTimerProgress => _shootingOneTimerProgress;
  set shootingOneTimerProgress(double _value) {
    _shootingOneTimerProgress = _value;
    prefs.setDouble('ff_shootingOneTimerProgress', _value);
  }

  double _shootingInStJumpFromLegToLegProgress = 0.0;
  double get shootingInStJumpFromLegToLegProgress =>
      _shootingInStJumpFromLegToLegProgress;
  set shootingInStJumpFromLegToLegProgress(double _value) {
    _shootingInStJumpFromLegToLegProgress = _value;
    prefs.setDouble('ff_shootingInStJumpFromLegToLegProgress', _value);
  }

  double _shootingOneLegOnSkProgress = 0.0;
  double get shootingOneLegOnSkProgress => _shootingOneLegOnSkProgress;
  set shootingOneLegOnSkProgress(double _value) {
    _shootingOneLegOnSkProgress = _value;
    prefs.setDouble('ff_shootingOneLegOnSkProgress', _value);
  }

  double _shootingOneTimerFromKneeProgress = 0.0;
  double get shootingOneTimerFromKneeProgress =>
      _shootingOneTimerFromKneeProgress;
  set shootingOneTimerFromKneeProgress(double _value) {
    _shootingOneTimerFromKneeProgress = _value;
    prefs.setDouble('ff_shootingOneTimerFromKneeProgress', _value);
  }

  double _shootingRapidShot = 0.0;
  double get shootingRapidShot => _shootingRapidShot;
  set shootingRapidShot(double _value) {
    _shootingRapidShot = _value;
    prefs.setDouble('ff_shootingRapidShot', _value);
  }

  double _shootingSchelchokProgress = 0.0;
  double get shootingSchelchokProgress => _shootingSchelchokProgress;
  set shootingSchelchokProgress(double _value) {
    _shootingSchelchokProgress = _value;
    prefs.setDouble('ff_shootingSchelchokProgress', _value);
  }

  double _shootingQuickShotAJOLProgress = 0.0;
  double get shootingQuickShotAJOLProgress => _shootingQuickShotAJOLProgress;
  set shootingQuickShotAJOLProgress(double _value) {
    _shootingQuickShotAJOLProgress = _value;
    prefs.setDouble('ff_shootingQuickShotAJOLProgress', _value);
  }

  double _shootingQuickShotALBProgress = 0.0;
  double get shootingQuickShotALBProgress => _shootingQuickShotALBProgress;
  set shootingQuickShotALBProgress(double _value) {
    _shootingQuickShotALBProgress = _value;
    prefs.setDouble('ff_shootingQuickShotALBProgress', _value);
  }

  double _shootingQuickShotAPassProgress = 0.0;
  double get shootingQuickShotAPassProgress => _shootingQuickShotAPassProgress;
  set shootingQuickShotAPassProgress(double _value) {
    _shootingQuickShotAPassProgress = _value;
    prefs.setDouble('ff_shootingQuickShotAPassProgress', _value);
  }

  double _shootingShotFromMyselfProgress = 0.0;
  double get shootingShotFromMyselfProgress => _shootingShotFromMyselfProgress;
  set shootingShotFromMyselfProgress(double _value) {
    _shootingShotFromMyselfProgress = _value;
    prefs.setDouble('ff_shootingShotFromMyselfProgress', _value);
  }

  double _shootingStaticProgress = 0.0;
  double get shootingStaticProgress => _shootingStaticProgress;
  set shootingStaticProgress(double _value) {
    _shootingStaticProgress = _value;
    prefs.setDouble('ff_shootingStaticProgress', _value);
  }

  double _shootingSitOnSkProgress = 0.0;
  double get shootingSitOnSkProgress => _shootingSitOnSkProgress;
  set shootingSitOnSkProgress(double _value) {
    _shootingSitOnSkProgress = _value;
    prefs.setDouble('ff_shootingSitOnSkProgress', _value);
  }

  double _shootingShotFromKAPProgress = 0.0;
  double get shootingShotFromKAPProgress => _shootingShotFromKAPProgress;
  set shootingShotFromKAPProgress(double _value) {
    _shootingShotFromKAPProgress = _value;
    prefs.setDouble('ff_shootingShotFromKAPProgress', _value);
  }

  int _goalGoalsForSeasonBest = 0;
  int get goalGoalsForSeasonBest => _goalGoalsForSeasonBest;
  set goalGoalsForSeasonBest(int _value) {
    _goalGoalsForSeasonBest = _value;
    prefs.setInt('ff_goalGoalsForSeasonBest', _value);
  }

  int _goalGoalsForSeasonNow = 0;
  int get goalGoalsForSeasonNow => _goalGoalsForSeasonNow;
  set goalGoalsForSeasonNow(int _value) {
    _goalGoalsForSeasonNow = _value;
    prefs.setInt('ff_goalGoalsForSeasonNow', _value);
  }

  bool _congratsStick = false;
  bool get congratsStick => _congratsStick;
  set congratsStick(bool _value) {
    _congratsStick = _value;
    prefs.setBool('ff_congratsStick', _value);
  }

  int _goalsAssistsForSeasonBest = 0;
  int get goalsAssistsForSeasonBest => _goalsAssistsForSeasonBest;
  set goalsAssistsForSeasonBest(int _value) {
    _goalsAssistsForSeasonBest = _value;
    prefs.setInt('ff_goalsAssistsForSeasonBest', _value);
  }

  int _goalsAssistsForSeasonNow = 0;
  int get goalsAssistsForSeasonNow => _goalsAssistsForSeasonNow;
  set goalsAssistsForSeasonNow(int _value) {
    _goalsAssistsForSeasonNow = _value;
    prefs.setInt('ff_goalsAssistsForSeasonNow', _value);
  }

  int _goalsTeamPointsBest = 0;
  int get goalsTeamPointsBest => _goalsTeamPointsBest;
  set goalsTeamPointsBest(int _value) {
    _goalsTeamPointsBest = _value;
    prefs.setInt('ff_goalsTeamPointsBest', _value);
  }

  int _goalsTeamPointsNow = 0;
  int get goalsTeamPointsNow => _goalsTeamPointsNow;
  set goalsTeamPointsNow(int _value) {
    _goalsTeamPointsNow = _value;
    prefs.setInt('ff_goalsTeamPointsNow', _value);
  }

  double _healthProgress = 0.0;
  double get healthProgress => _healthProgress;
  set healthProgress(double _value) {
    _healthProgress = _value;
    prefs.setDouble('ff_healthProgress', _value);
  }

  bool _authorisationProgress = false;
  bool get authorisationProgress => _authorisationProgress;
  set authorisationProgress(bool _value) {
    _authorisationProgress = _value;
    prefs.setBool('ff_authorisationProgress', _value);
  }

  int _progressShotPower = 0;
  int get progressShotPower => _progressShotPower;
  set progressShotPower(int _value) {
    _progressShotPower = _value;
    prefs.setInt('ff_progressShotPower', _value);
  }

  int _progressShootPowerPrevious = 0;
  int get progressShootPowerPrevious => _progressShootPowerPrevious;
  set progressShootPowerPrevious(int _value) {
    _progressShootPowerPrevious = _value;
    prefs.setInt('ff_progressShootPowerPrevious', _value);
  }

  int _progressShootAccuracy = 0;
  int get progressShootAccuracy => _progressShootAccuracy;
  set progressShootAccuracy(int _value) {
    _progressShootAccuracy = _value;
    prefs.setInt('ff_progressShootAccuracy', _value);
  }

  int _progressAccuracyPrevious = 0;
  int get progressAccuracyPrevious => _progressAccuracyPrevious;
  set progressAccuracyPrevious(int _value) {
    _progressAccuracyPrevious = _value;
    prefs.setInt('ff_progressAccuracyPrevious', _value);
  }

  int _progressAssistAccuracy = 0;
  int get progressAssistAccuracy => _progressAssistAccuracy;
  set progressAssistAccuracy(int _value) {
    _progressAssistAccuracy = _value;
    prefs.setInt('ff_progressAssistAccuracy', _value);
  }

  int _progressAssistAccuracyPrevious = 0;
  int get progressAssistAccuracyPrevious => _progressAssistAccuracyPrevious;
  set progressAssistAccuracyPrevious(int _value) {
    _progressAssistAccuracyPrevious = _value;
    prefs.setInt('ff_progressAssistAccuracyPrevious', _value);
  }

  double _progressSpeed = 0.0;
  double get progressSpeed => _progressSpeed;
  set progressSpeed(double _value) {
    _progressSpeed = _value;
    prefs.setDouble('ff_progressSpeed', _value);
  }

  double _progressSpeedPrevious = 0.0;
  double get progressSpeedPrevious => _progressSpeedPrevious;
  set progressSpeedPrevious(double _value) {
    _progressSpeedPrevious = _value;
    prefs.setDouble('ff_progressSpeedPrevious', _value);
  }

  double _progressVynoslivost = 0.0;
  double get progressVynoslivost => _progressVynoslivost;
  set progressVynoslivost(double _value) {
    _progressVynoslivost = _value;
    prefs.setDouble('ff_progressVynoslivost', _value);
  }

  double _progressVynoslivostPrevious = 0.0;
  double get progressVynoslivostPrevious => _progressVynoslivostPrevious;
  set progressVynoslivostPrevious(double _value) {
    _progressVynoslivostPrevious = _value;
    prefs.setDouble('ff_progressVynoslivostPrevious', _value);
  }

  double _moshnostAchieve = 0.0;
  double get moshnostAchieve => _moshnostAchieve;
  set moshnostAchieve(double _value) {
    _moshnostAchieve = _value;
    prefs.setDouble('ff_moshnostAchieve', _value);
  }

  int _moshnost1 = 0;
  int get moshnost1 => _moshnost1;
  set moshnost1(int _value) {
    _moshnost1 = _value;
    prefs.setInt('ff_moshnost1', _value);
  }

  int _moshnost2 = 0;
  int get moshnost2 => _moshnost2;
  set moshnost2(int _value) {
    _moshnost2 = _value;
    prefs.setInt('ff_moshnost2', _value);
  }

  int _moshnost3 = 0;
  int get moshnost3 => _moshnost3;
  set moshnost3(int _value) {
    _moshnost3 = _value;
    prefs.setInt('ff_moshnost3', _value);
  }

  int _moshnost4 = 0;
  int get moshnost4 => _moshnost4;
  set moshnost4(int _value) {
    _moshnost4 = _value;
    prefs.setInt('ff_moshnost4', _value);
  }

  int _moshnost5 = 0;
  int get moshnost5 => _moshnost5;
  set moshnost5(int _value) {
    _moshnost5 = _value;
    prefs.setInt('ff_moshnost5', _value);
  }

  int _moshnost6 = 0;
  int get moshnost6 => _moshnost6;
  set moshnost6(int _value) {
    _moshnost6 = _value;
    prefs.setInt('ff_moshnost6', _value);
  }

  int _moshnost7 = 0;
  int get moshnost7 => _moshnost7;
  set moshnost7(int _value) {
    _moshnost7 = _value;
    prefs.setInt('ff_moshnost7', _value);
  }

  int _moshnost8 = 0;
  int get moshnost8 => _moshnost8;
  set moshnost8(int _value) {
    _moshnost8 = _value;
    prefs.setInt('ff_moshnost8', _value);
  }

  double _lovkostAchieve = 0.0;
  double get lovkostAchieve => _lovkostAchieve;
  set lovkostAchieve(double _value) {
    _lovkostAchieve = _value;
    prefs.setDouble('ff_lovkostAchieve', _value);
  }

  int _lovkost1 = 0;
  int get lovkost1 => _lovkost1;
  set lovkost1(int _value) {
    _lovkost1 = _value;
    prefs.setInt('ff_lovkost1', _value);
  }

  int _lovkost2 = 0;
  int get lovkost2 => _lovkost2;
  set lovkost2(int _value) {
    _lovkost2 = _value;
    prefs.setInt('ff_lovkost2', _value);
  }

  int _lovkost3 = 0;
  int get lovkost3 => _lovkost3;
  set lovkost3(int _value) {
    _lovkost3 = _value;
    prefs.setInt('ff_lovkost3', _value);
  }

  int _lovkost4 = 0;
  int get lovkost4 => _lovkost4;
  set lovkost4(int _value) {
    _lovkost4 = _value;
    prefs.setInt('ff_lovkost4', _value);
  }

  int _lovkost5 = 0;
  int get lovkost5 => _lovkost5;
  set lovkost5(int _value) {
    _lovkost5 = _value;
    prefs.setInt('ff_lovkost5', _value);
  }

  int _lovkost6 = 0;
  int get lovkost6 => _lovkost6;
  set lovkost6(int _value) {
    _lovkost6 = _value;
    prefs.setInt('ff_lovkost6', _value);
  }

  int _lovkost7 = 0;
  int get lovkost7 => _lovkost7;
  set lovkost7(int _value) {
    _lovkost7 = _value;
    prefs.setInt('ff_lovkost7', _value);
  }

  double _eSpeedAchieve = 0.0;
  double get eSpeedAchieve => _eSpeedAchieve;
  set eSpeedAchieve(double _value) {
    _eSpeedAchieve = _value;
    prefs.setDouble('ff_eSpeedAchieve', _value);
  }

  int _espeed1 = 0;
  int get espeed1 => _espeed1;
  set espeed1(int _value) {
    _espeed1 = _value;
    prefs.setInt('ff_espeed1', _value);
  }

  int _espeed2 = 0;
  int get espeed2 => _espeed2;
  set espeed2(int _value) {
    _espeed2 = _value;
    prefs.setInt('ff_espeed2', _value);
  }

  int _espeed3 = 0;
  int get espeed3 => _espeed3;
  set espeed3(int _value) {
    _espeed3 = _value;
    prefs.setInt('ff_espeed3', _value);
  }

  int _espeed4 = 0;
  int get espeed4 => _espeed4;
  set espeed4(int _value) {
    _espeed4 = _value;
    prefs.setInt('ff_espeed4', _value);
  }

  int _espeed5 = 0;
  int get espeed5 => _espeed5;
  set espeed5(int _value) {
    _espeed5 = _value;
    prefs.setInt('ff_espeed5', _value);
  }

  int _espeed6 = 0;
  int get espeed6 => _espeed6;
  set espeed6(int _value) {
    _espeed6 = _value;
    prefs.setInt('ff_espeed6', _value);
  }

  int _espeed7 = 0;
  int get espeed7 => _espeed7;
  set espeed7(int _value) {
    _espeed7 = _value;
    prefs.setInt('ff_espeed7', _value);
  }

  int _espeed8 = 0;
  int get espeed8 => _espeed8;
  set espeed8(int _value) {
    _espeed8 = _value;
    prefs.setInt('ff_espeed8', _value);
  }

  double _balanceAchieve = 0.0;
  double get balanceAchieve => _balanceAchieve;
  set balanceAchieve(double _value) {
    _balanceAchieve = _value;
    prefs.setDouble('ff_balanceAchieve', _value);
  }

  int _balance1 = 0;
  int get balance1 => _balance1;
  set balance1(int _value) {
    _balance1 = _value;
    prefs.setInt('ff_balance1', _value);
  }

  int _balance2 = 0;
  int get balance2 => _balance2;
  set balance2(int _value) {
    _balance2 = _value;
    prefs.setInt('ff_balance2', _value);
  }

  int _balance3 = 0;
  int get balance3 => _balance3;
  set balance3(int _value) {
    _balance3 = _value;
    prefs.setInt('ff_balance3', _value);
  }

  int _balance4 = 0;
  int get balance4 => _balance4;
  set balance4(int _value) {
    _balance4 = _value;
    prefs.setInt('ff_balance4', _value);
  }

  int _balance5 = 0;
  int get balance5 => _balance5;
  set balance5(int _value) {
    _balance5 = _value;
    prefs.setInt('ff_balance5', _value);
  }

  int _balance6 = 0;
  int get balance6 => _balance6;
  set balance6(int _value) {
    _balance6 = _value;
    prefs.setInt('ff_balance6', _value);
  }

  int _balance7 = 0;
  int get balance7 => _balance7;
  set balance7(int _value) {
    _balance7 = _value;
    prefs.setInt('ff_balance7', _value);
  }

  double _forceAchieve = 0.0;
  double get forceAchieve => _forceAchieve;
  set forceAchieve(double _value) {
    _forceAchieve = _value;
    prefs.setDouble('ff_forceAchieve', _value);
  }

  int _force1 = 0;
  int get force1 => _force1;
  set force1(int _value) {
    _force1 = _value;
    prefs.setInt('ff_force1', _value);
  }

  int _force2 = 0;
  int get force2 => _force2;
  set force2(int _value) {
    _force2 = _value;
    prefs.setInt('ff_force2', _value);
  }

  int _force3 = 0;
  int get force3 => _force3;
  set force3(int _value) {
    _force3 = _value;
    prefs.setInt('ff_force3', _value);
  }

  int _force4 = 0;
  int get force4 => _force4;
  set force4(int _value) {
    _force4 = _value;
    prefs.setInt('ff_force4', _value);
  }

  int _force5 = 0;
  int get force5 => _force5;
  set force5(int _value) {
    _force5 = _value;
    prefs.setInt('ff_force5', _value);
  }

  int _force6 = 0;
  int get force6 => _force6;
  set force6(int _value) {
    _force6 = _value;
    prefs.setInt('ff_force6', _value);
  }

  int _force7 = 0;
  int get force7 => _force7;
  set force7(int _value) {
    _force7 = _value;
    prefs.setInt('ff_force7', _value);
  }

  double _vynoslivostAchieve = 0.0;
  double get vynoslivostAchieve => _vynoslivostAchieve;
  set vynoslivostAchieve(double _value) {
    _vynoslivostAchieve = _value;
    prefs.setDouble('ff_vynoslivostAchieve', _value);
  }

  int _vynoslivost1 = 0;
  int get vynoslivost1 => _vynoslivost1;
  set vynoslivost1(int _value) {
    _vynoslivost1 = _value;
    prefs.setInt('ff_vynoslivost1', _value);
  }

  int _vynoslivost2 = 0;
  int get vynoslivost2 => _vynoslivost2;
  set vynoslivost2(int _value) {
    _vynoslivost2 = _value;
    prefs.setInt('ff_vynoslivost2', _value);
  }

  int _vynoslivost3 = 0;
  int get vynoslivost3 => _vynoslivost3;
  set vynoslivost3(int _value) {
    _vynoslivost3 = _value;
    prefs.setInt('ff_vynoslivost3', _value);
  }

  int _vynoslivost4 = 0;
  int get vynoslivost4 => _vynoslivost4;
  set vynoslivost4(int _value) {
    _vynoslivost4 = _value;
    prefs.setInt('ff_vynoslivost4', _value);
  }

  int _vynoslivost5 = 0;
  int get vynoslivost5 => _vynoslivost5;
  set vynoslivost5(int _value) {
    _vynoslivost5 = _value;
    prefs.setInt('ff_vynoslivost5', _value);
  }

  int _vynoslivost6 = 0;
  int get vynoslivost6 => _vynoslivost6;
  set vynoslivost6(int _value) {
    _vynoslivost6 = _value;
    prefs.setInt('ff_vynoslivost6', _value);
  }

  double _shootoutAchieve = 0.0;
  double get shootoutAchieve => _shootoutAchieve;
  set shootoutAchieve(double _value) {
    _shootoutAchieve = _value;
    prefs.setDouble('ff_shootoutAchieve', _value);
  }

  double _edgesChelnokProgress = 0.0;
  double get edgesChelnokProgress => _edgesChelnokProgress;
  set edgesChelnokProgress(double _value) {
    _edgesChelnokProgress = _value;
    prefs.setDouble('ff_edgesChelnokProgress', _value);
  }

  double _BTOFOnBackOnForwardProgress = 0.0;
  double get BTOFOnBackOnForwardProgress => _BTOFOnBackOnForwardProgress;
  set BTOFOnBackOnForwardProgress(double _value) {
    _BTOFOnBackOnForwardProgress = _value;
    prefs.setDouble('ff_BTOFOnBackOnForwardProgress', _value);
  }

  double _shootingFromMyselfOutself = 0.0;
  double get shootingFromMyselfOutself => _shootingFromMyselfOutself;
  set shootingFromMyselfOutself(double _value) {
    _shootingFromMyselfOutself = _value;
    prefs.setDouble('ff_shootingFromMyselfOutself', _value);
  }

  double _shootingOneLegOnPlatformBack = 0.0;
  double get shootingOneLegOnPlatformBack => _shootingOneLegOnPlatformBack;
  set shootingOneLegOnPlatformBack(double _value) {
    _shootingOneLegOnPlatformBack = _value;
    prefs.setDouble('ff_shootingOneLegOnPlatformBack', _value);
  }

  int _shootingAchieve = 0;
  int get shootingAchieve => _shootingAchieve;
  set shootingAchieve(int _value) {
    _shootingAchieve = _value;
    prefs.setInt('ff_shootingAchieve', _value);
  }

  double _skateAchieve = 0.0;
  double get skateAchieve => _skateAchieve;
  set skateAchieve(double _value) {
    _skateAchieve = _value;
    prefs.setDouble('ff_skateAchieve', _value);
  }

  int _eating1 = 0;
  int get eating1 => _eating1;
  set eating1(int _value) {
    _eating1 = _value;
    prefs.setInt('ff_eating1', _value);
  }

  int _eating2 = 0;
  int get eating2 => _eating2;
  set eating2(int _value) {
    _eating2 = _value;
    prefs.setInt('ff_eating2', _value);
  }

  int _eating3 = 0;
  int get eating3 => _eating3;
  set eating3(int _value) {
    _eating3 = _value;
    prefs.setInt('ff_eating3', _value);
  }

  int _eating4 = 0;
  int get eating4 => _eating4;
  set eating4(int _value) {
    _eating4 = _value;
    prefs.setInt('ff_eating4', _value);
  }

  int _eating5 = 0;
  int get eating5 => _eating5;
  set eating5(int _value) {
    _eating5 = _value;
    prefs.setInt('ff_eating5', _value);
  }

  int _psychology1 = 0;
  int get psychology1 => _psychology1;
  set psychology1(int _value) {
    _psychology1 = _value;
    prefs.setInt('ff_psychology1', _value);
  }

  int _psychology2 = 0;
  int get psychology2 => _psychology2;
  set psychology2(int _value) {
    _psychology2 = _value;
    prefs.setInt('ff_psychology2', _value);
  }

  int _psychology3 = 0;
  int get psychology3 => _psychology3;
  set psychology3(int _value) {
    _psychology3 = _value;
    prefs.setInt('ff_psychology3', _value);
  }

  int _psychology4 = 0;
  int get psychology4 => _psychology4;
  set psychology4(int _value) {
    _psychology4 = _value;
    prefs.setInt('ff_psychology4', _value);
  }

  int _psychology5 = 0;
  int get psychology5 => _psychology5;
  set psychology5(int _value) {
    _psychology5 = _value;
    prefs.setInt('ff_psychology5', _value);
  }

  int _psychology6 = 0;
  int get psychology6 => _psychology6;
  set psychology6(int _value) {
    _psychology6 = _value;
    prefs.setInt('ff_psychology6', _value);
  }

  int _sleep1 = 0;
  int get sleep1 => _sleep1;
  set sleep1(int _value) {
    _sleep1 = _value;
    prefs.setInt('ff_sleep1', _value);
  }

  int _sleep2 = 0;
  int get sleep2 => _sleep2;
  set sleep2(int _value) {
    _sleep2 = _value;
    prefs.setInt('ff_sleep2', _value);
  }

  int _sleep3 = 0;
  int get sleep3 => _sleep3;
  set sleep3(int _value) {
    _sleep3 = _value;
    prefs.setInt('ff_sleep3', _value);
  }

  int _sleep4 = 0;
  int get sleep4 => _sleep4;
  set sleep4(int _value) {
    _sleep4 = _value;
    prefs.setInt('ff_sleep4', _value);
  }

  int _sleep5 = 0;
  int get sleep5 => _sleep5;
  set sleep5(int _value) {
    _sleep5 = _value;
    prefs.setInt('ff_sleep5', _value);
  }

  int _goalStickProgress = 0;
  int get goalStickProgress => _goalStickProgress;
  set goalStickProgress(int _value) {
    _goalStickProgress = _value;
    prefs.setInt('ff_goalStickProgress', _value);
  }

  int _goalsCatchingPuckBest = 0;
  int get goalsCatchingPuckBest => _goalsCatchingPuckBest;
  set goalsCatchingPuckBest(int _value) {
    _goalsCatchingPuckBest = _value;
    prefs.setInt('ff_goalsCatchingPuckBest', _value);
  }

  int _goalsCatchingPuckNow = 0;
  int get goalsCatchingPuckNow => _goalsCatchingPuckNow;
  set goalsCatchingPuckNow(int _value) {
    _goalsCatchingPuckNow = _value;
    prefs.setInt('ff_goalsCatchingPuckNow', _value);
  }

  int _goalsPowerMoveBest = 0;
  int get goalsPowerMoveBest => _goalsPowerMoveBest;
  set goalsPowerMoveBest(int _value) {
    _goalsPowerMoveBest = _value;
    prefs.setInt('ff_goalsPowerMoveBest', _value);
  }

  int _goalsPowerMoveNow = 0;
  int get goalsPowerMoveNow => _goalsPowerMoveNow;
  set goalsPowerMoveNow(int _value) {
    _goalsPowerMoveNow = _value;
    prefs.setInt('ff_goalsPowerMoveNow', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
