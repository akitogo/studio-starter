<cfscript>
	include "../_shared/icons.cfm";
	local.d = args.data;
	// Full class names, so Tailwind finds them when it scans the templates
	local.columns = { "2": "md:grid-cols-2", "3": "md:grid-cols-3" };
</cfscript>
<cfoutput><section class="tone-#local.d.tone# bg-surface text-ink">
	<div class="mx-auto max-w-7xl px-4 py-20 sm:px-6 sm:py-28 lg:px-8">
		<cfif len( local.d.eyebrow ) || len( local.d.title ) || len( local.d.intro )>
			<div class="mx-auto max-w-2xl text-center">
				<cfif len( local.d.eyebrow )><p class="eyebrow">#args.studio.esc( local.d.eyebrow )#</p></cfif>
				<cfif len( local.d.title )><h2 class="heading mt-5 text-4xl sm:text-5xl">#args.studio.esc( local.d.title )#</h2></cfif>
				<cfif len( local.d.intro )><p class="mt-5 text-lg text-pretty text-muted">#args.studio.nl2br( local.d.intro )#</p></cfif>
			</div>
		</cfif>
		<cfif arrayLen( local.d.items )>
			<div class="mt-14 grid grid-cols-1 gap-6 #local.columns[ local.d.columns ]#">
				<cfloop array="#local.d.items#" index="local.item">
					<div class="rounded-box border border-line bg-surface-alt p-7">
						<cfif local.item.icon != "none"><div class="inline-flex rounded-box bg-brand p-3 text-brand-ink">#local.icons[ local.item.icon ]#</div></cfif>
						<h3 class="mt-6 text-xl font-semibold text-ink">#args.studio.esc( local.item.title )#</h3>
						<cfif len( local.item.text )><p class="mt-2 text-pretty text-muted">#args.studio.nl2br( local.item.text )#</p></cfif>
					</div>
				</cfloop>
			</div>
		</cfif>
	</div>
</section></cfoutput>
