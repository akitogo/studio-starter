<cfscript>
	include "../_shared/icons.cfm";
	local.d = args.data;
	// Columns by number of plans; full class names, so Tailwind finds them
	local.columns = [ "mx-auto max-w-md", "mx-auto max-w-4xl md:grid-cols-2", "md:grid-cols-3", "md:grid-cols-2 lg:grid-cols-4" ];
	local.count = arrayLen( local.d.plans );
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
		<cfif local.count>
			<div class="mt-14 grid grid-cols-1 gap-6 md:items-stretch #local.columns[ min( local.count, 4 ) ]#">
				<cfloop array="#local.d.plans#" index="local.plan">
					<cfset local.button = args.studio.linkAttrs( local.plan.buttonLink )>
					<cfset local.features = listToArray( replace( local.plan.features, chr( 13 ), "", "all" ), chr( 10 ) ).filter( ( line ) => len( trim( line ) ) > 0 )>
					<div class="relative flex flex-col rounded-box border p-8 <cfif local.plan.highlighted>border-brand bg-surface-alt ring-1 ring-brand<cfelse>border-line bg-surface-alt</cfif>">
						<cfif local.plan.highlighted && len( local.d.badge )>
							<p class="absolute -top-3 left-8 rounded-box bg-brand px-3 py-1 text-xs font-semibold text-brand-ink">#args.studio.esc( local.d.badge )#</p>
						</cfif>
						<h3 class="text-lg font-semibold text-ink">#args.studio.esc( local.plan.name )#</h3>
						<cfif len( local.plan.description )><p class="mt-2 text-pretty text-muted">#args.studio.nl2br( local.plan.description )#</p></cfif>
						<cfif len( local.plan.price )>
							<p class="mt-6">
								<strong class="heading text-5xl">#args.studio.esc( local.plan.price )#</strong>
								<cfif len( local.plan.period )><span class="text-sm font-medium text-muted">#args.studio.esc( local.plan.period )#</span></cfif>
							</p>
						</cfif>
						<cfif arrayLen( local.features )>
							<ul class="mt-8 space-y-3 border-t border-line pt-8">
								<cfloop array="#local.features#" index="local.feature">
									<li class="flex items-start gap-2 text-muted"><span class="text-brand">#local.icons.check#</span> #args.studio.esc( trim( local.feature ) )#</li>
								</cfloop>
							</ul>
						</cfif>
						<cfif len( local.button ) && len( local.plan.buttonLabel )>
							<div class="mt-auto pt-8">
								<a class="btn w-full <cfif local.plan.highlighted>btn-primary<cfelse>btn-secondary</cfif>"#local.button#>#args.studio.esc( local.plan.buttonLabel )#</a>
							</div>
						</cfif>
					</div>
				</cfloop>
			</div>
		</cfif>
	</div>
</section></cfoutput>
