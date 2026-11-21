<cfscript>
	// Design preset from the theme settings; unknown values fall back to the first preset
	ssPreset = lCase( cb.themeSetting( "preset", "bold" ) );
	if ( !listFind( "bold,editorial", ssPreset ) ) {
		ssPreset = "bold";
	}
	ssTheme = cb.themeRoot() & "/includes/css";
</cfscript>
<cfoutput><!doctype html>
<html lang="#encodeForHTMLAttribute( cb.themeSetting( "language", "en" ) )#">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>#cb.getContentTitle()#</title>
	<meta name="description" content="#cb.getContentDescription()#">
	<meta name="generator" content="ContentBox">
	#cb.getOpenGraphMeta()#
	<!--- Preset first (design tokens and fonts), then the theme. Both are <link>s, so Studio's editor loads them too --->
	<link rel="stylesheet" href="#ssTheme#/presets/#ssPreset#.css">
	<link rel="stylesheet" href="#ssTheme#/theme.css">
	#cb.event( "cbui_beforeHeadEnd" )#
</head>
<body class="bg-surface font-body text-ink">
	#cb.event( "cbui_afterBodyStart" )#
	#cb.quickView( view = "_header" )#
	#cb.event( "cbui_beforeContent" )#
	#cb.mainView( args = args )#
	#cb.event( "cbui_afterContent" )#
	#cb.quickView( view = "_footer" )#
	#cb.event( "cbui_beforeBodyEnd" )#
</body>
</html></cfoutput>
