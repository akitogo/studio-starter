<!--- Replaces Studio's core heading block (same fields): the theme's display face in a reading column --->
<cfscript>
	// Full class names per level, so Tailwind finds them
	local.sizes = { "2": "text-4xl sm:text-5xl", "3": "text-3xl", "4": "text-2xl" };
</cfscript>
<cfoutput><div class="mx-auto max-w-3xl px-6 pt-10 pb-2"><h#args.data.level# class="heading #local.sizes[ args.data.level ]#">#args.studio.esc( args.data.text )#</h#args.data.level#></div></cfoutput>
