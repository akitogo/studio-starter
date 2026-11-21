<cfscript>
	include "../_shared/icons.cfm";
	local.d = args.data;
	local.hasImage = len( local.d.image.src ) > 0;
	local.primary = args.studio.linkAttrs( local.d.primaryLink );
	local.secondary = args.studio.linkAttrs( local.d.secondaryLink );
</cfscript>
<cfoutput><section class="tone-#local.d.tone# bg-surface text-ink">
	<div class="mx-auto max-w-7xl px-4 py-20 sm:px-6 sm:py-28 lg:px-8 lg:py-36<cfif local.hasImage> md:grid md:grid-cols-2 md:items-center md:gap-16</cfif>">
		<div class="<cfif local.hasImage>max-w-2xl<cfelse>max-w-5xl</cfif>">
			<cfif len( local.d.eyebrow )><p class="eyebrow">#args.studio.esc( local.d.eyebrow )#</p></cfif>
			<h1 class="heading mt-6 text-5xl sm:text-7xl lg:text-8xl">#args.studio.nl2br( local.d.title )#</h1>
			<cfif len( local.d.lead )><p class="mt-6 max-w-xl text-lg text-pretty text-muted sm:text-xl/relaxed">#args.studio.nl2br( local.d.lead )#</p></cfif>
			<cfif ( len( local.primary ) && len( local.d.primaryLabel ) ) || ( len( local.secondary ) && len( local.d.secondaryLabel ) )>
				<div class="mt-10 flex flex-wrap gap-4">
					<cfif len( local.primary ) && len( local.d.primaryLabel )><a class="btn btn-primary"#local.primary#>#args.studio.esc( local.d.primaryLabel )# #local.icons.arrow#</a></cfif>
					<cfif len( local.secondary ) && len( local.d.secondaryLabel )><a class="btn btn-secondary"#local.secondary#>#args.studio.esc( local.d.secondaryLabel )#</a></cfif>
				</div>
			</cfif>
		</div>
		<cfif local.hasImage>
			<div class="mt-14 md:mt-0">
				<img class="aspect-[4/5] w-full rounded-box object-cover" src="#args.studio.src( local.d.image.src )#" alt="#args.studio.attr( local.d.image.alt )#">
			</div>
		</cfif>
	</div>
</section></cfoutput>
