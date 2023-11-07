import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'progress_model.dart';
export 'progress_model.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  late ProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFD23852),
          automaticallyImplyLeading: false,
          leading: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFFD23852),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              FFLocalizations.of(context).getText(
                '4qo8w7hl' /* Прогресс */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('ProfilePage');
                },
                child: Container(
                  width: 62.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('ProfilePage');
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/Profile_picture.png',
                          fit: BoxFit.cover,
                          alignment: Alignment(0.00, -1.00),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/freqb_.jpeg',
                ).image,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'cu1tvcyy' /* Достижения */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Color(0xFFF7B433),
                      size: 60.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: Image.asset(
                            'assets/images/GoldenApple.png',
                          ).image,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Color(0xFF57697B),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Icon(
                                Icons.stars_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 48.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 242.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'jz880luv' /* All-Star Account */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ucbp0boh' /* Зарегистрируйся в приложении  */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(
                                    'assets/images/GoldenApple.png',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Color(0xFF57697B),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Icon(
                                        Icons.handshake_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 48.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 242.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w5g0116s' /* Часть команды */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    fontSize: 24.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'uhvkvwnk' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().goalStickProgress > 14)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.front_hand,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'h0gi2hte' /* Руки Мидаса */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '9yt1bkn7' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().shootingAchieve > 20)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.ads_click_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'riq1k5dp' /* Снайпер */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2s86bjar' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().skateAchieve > 0.98)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.ice_skating_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'az2rwn4z' /* Катающийся */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ojfxmszm' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().shootoutAchieve > 0.5)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.sports_hockey_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9cl02g0n' /* Буллитёр */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'os695e59' /* Прочитай все лекции о здоровье */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().healthProgress > 15.0)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'nq1vsbl9' /* Бык */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '3nrnm31x' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().forceAchieve > 0.6)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidHandRock,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ym7c8wlk' /* Сильный */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '3e6a9owv' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().balanceAchieve > 0.6)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.hexagon_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5ck7eje3' /* Устойчивый */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '348sm8fr' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().lovkostAchieve > 0.6)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.swap_horizontal_circle_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ng3qdcbe' /* Ловкий */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ild3bcwm' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().vynoslivostAchieve > 0.5)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.battery_charging_full,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '25ih25aq' /* Выносливый */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tvkbmnct' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().moshnostAchieve > 0.6)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.electric_car_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ohlryghd' /* Мощный */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F4259),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: FlutterFlowTheme.of(context).shadowColor,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  width: 105.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: Color(0xFF3F4259),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.question_mark_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 242.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '3xn3ru9g' /* Успешно пройди блок упражнений... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (FFAppState().eSpeedAchieve > 0.7)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.asset(
                                      'assets/images/GoldenApple.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .shadowColor,
                                      offset: Offset(1.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Icon(
                                          Icons.rocket_launch,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 242.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: AutoSizeText(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'bekmlos6' /* Скоростной */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                minFontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
