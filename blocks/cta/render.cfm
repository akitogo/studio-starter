<cfscript>
	include "../_shared/icons.cfm";
	local.d = args.data;
	local.hasImage = len( local.d.image.src ) > 0;
	local.button = args.studio.linkAttrs( local.d.buttonLink );
</cfscript>
<cfoutput><section class="tone-#local.d.tone# overflow-hidden bg-surface text-ink<cfif local.hasImage> sm:grid sm:grid-cols-2</cfif>">
	<div class="px-6 py-16 md:px-12 lg:px-16 lg:py-28<cfif local.hasImage> sm:self-center</cfif>">
		<div class="mx-auto <cfif local.hasImage>max-w-xl text-center sm:text-left<cfelse>max-w-3xl text-center</cfif>">
			<h2 class="heading text-4xl md:text-5xl">#args.studio.esc( local.d.title )#</h2>
			<cfif len( local.d.text )><p class="mt-5 text-lg text-pretty text-muted md:mt-6">#args.studio.nl2br( local.d.text )#</p></cfif>
			<cfif len( local.button ) && len( local.d.buttonLabel )>
				<div class="mt-8 md:mt-10"><a class="btn btn-primary"#local.button#>#args.studio.esc( local.d.buttonLabel )# #local.icons.arrow#</a></div>
			</cfif>
		</div>
	</div>
	<cfif local.hasImage>
		<img class="h-64 w-full object-cover sm:h-full" src="#args.studio.src( local.d.image.src )#" alt="#args.studio.attr( local.d.image.alt )#">
	</cfif>
</section></cfoutput>
