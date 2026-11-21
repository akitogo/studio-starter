/**
 * Studio Starter: a ContentBox theme with ready-made blocks for ContentBox Studio, built with Tailwind CSS from
 * HyperUI's marketing components (MIT).
 *
 * - includes/css/presets/<preset>.css: the design tokens of a preset (colors, fonts, corner radius) and its fonts
 * - includes/css/theme.css: Tailwind, built from src/theme.css by `npm run build` (sites need no Node)
 * - blocks/: the Studio block types; every block has a background tone (light, tinted, dark, brand color)
 * - layouts/pages.cfm: page frame with header (site name, main menu, optional button) and footer
 */
component {

	property name="contentService" inject="contentService@contentbox";

	this.name         = "Studio Starter";
	this.description   = "Ready-made blocks for ContentBox Studio with switchable design presets (Tailwind CSS)";
	this.version       = "0.1.0";
	this.author        = "akitogo Internet and Media Applications GmbH";
	this.authorURL     = "https://github.com/akitogo";
	this.screenShotURL = "";

	// No setting is "required": ContentBox 7 checks required theme settings under their plain names, but the admin
	// posts them as cb_theme_<theme>_<name>, so their form could never be saved. The layout falls back to defaults.
	this.settings = [
		{
			name             : "preset",
			group            : "Design",
			defaultValue     : "bold",
			type             : "select",
			label            : "Design preset:",
			required         : "false",
			options          : [
				{ name : "Bold (grotesque, signal orange, square corners)", value : "bold" },
				{ name : "Editorial (serif, deep green, rounded corners)", value : "editorial" }
			],
			fieldDescription : "Colors, fonts and corners of the whole site."
		},
		{
			name             : "language",
			group            : "Site",
			defaultValue     : "en",
			type             : "text",
			label            : "Language:",
			required         : "false",
			fieldDescription : "Language code of the site's pages (html lang), e.g. en or de"
		},
		{
			name             : "blogTitle",
			group            : "Blog",
			defaultValue     : "Latest posts",
			type             : "text",
			label            : "Heading of the blog:",
			required         : "false",
			fieldDescription : "Shown above the list of posts"
		},
		{
			name             : "headerButtonLabel",
			group            : "Header",
			defaultValue     : "",
			type             : "text",
			label            : "Header button:",
			required         : "false",
			fieldDescription : "Optional button on the right of the header, e.g. Contact. Needs a link too."
		},
		{
			name             : "headerButtonLink",
			group            : "Header",
			defaultValue     : "",
			type             : "text",
			label            : "Header button link:",
			required         : "false",
			fieldDescription : "Address of the header button, e.g. /contact"
		}
	];

	/** Presets with a stylesheet in includes/css/presets */
	this.presets = [ "bold", "editorial" ];

	function onActivation(){
	}

	function onDeactivation(){
	}

	function onDelete(){
	}

	/**
	 * ContentBox caches whole pages (layout included) and only clears them when a theme is activated, not when its
	 * settings are saved: a new preset would show only once the cache expires. The theme is registered as an
	 * interceptor, so it clears the page caches itself.
	 */
	function cbadmin_postThemeSettingsSave( event, data ){
		variables.contentService.clearAllPageWrapperCaches();
	}

}
