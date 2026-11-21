<cfscript>
	include "../_shared/icons.cfm";
	local.d = args.data;
	local.hasImage = len( local.d.image.src ) > 0;
	local.button = args.studio.linkAttrs( local.d.buttonLink );
	local.stacked = local.d.layout == "stacked" || !local.hasImage;
	// Full class names per layout, so Tailwind finds them: [ grid, text column, image column ]
	local.grids = {
		"half"      : [ "md:grid-cols-2", "", "" ],
		"largeImage": [ "md:grid-cols-3", "md:col-span-1", "md:col-span-2" ],
		"largeText" : [ "md:grid-cols-3", "md:col-span-2", "md:col-span-1" ],
		"stacked"   : [ "", "", "" ]
	};
	local.grid = local.grids[ local.d.layout ];
</cfscript>
<cfoutput><section class="tone-#local.d.tone# bg-surface text-ink">
	<div class="mx-auto max-w-7xl px-4 py-20 sm:px-6 sm:py-24 lg:px-8">
		<div class="<cfif local.stacked>space-y-12<cfelse>grid grid-cols-1 gap-10 md:items-center md:gap-16 #local.grid[ 1 ]#</cfif>">
			<div class="<cfif local.stacked>max-w-3xl<cfelse>#local.grid[ 2 ]#</cfif>">
				<cfif len( local.d.eyebrow )><p class="eyebrow">#args.studio.esc( local.d.eyebrow )#</p></cfif>
				<cfif len( local.d.title )><h2 class="heading mt-5 text-4xl sm:text-5xl">#args.studio.esc( local.d.title )#</h2></cfif>
				<div class="prose prose-lg mt-6 max-w-none">#args.studio.richText( local.d.text )#</div>
				<cfif len( local.button ) && len( local.d.buttonLabel )>
					<div class="mt-8"><a class="btn btn-primary"#local.button#>#args.studio.esc( local.d.buttonLabel )# #local.icons.arrow#</a></div>
				</cfif>
			</div>
			<cfif local.hasImage>
				<div class="<cfif !local.stacked>#local.grid[ 3 ]#<cfif local.d.imageSide == "left"> md:order-first</cfif></cfif>">
					<img class="w-full rounded-box object-cover" src="#args.studio.src( local.d.image.src )#" alt="#args.studio.attr( local.d.image.alt )#">
				</div>
			</cfif>
		</div>
	</div>
</section></cfoutput>
