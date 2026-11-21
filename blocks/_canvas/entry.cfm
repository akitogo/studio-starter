<!---
	The header of a blog entry in ContentBox Studio's editor canvas (above the entry's blocks): the same as the header of
	views/entry.cfm on the site, from the values being edited. Keep the two alike. Categories are plain text here
	(no links in the editor).
--->
<cfoutput><header class="tone-light bg-surface pb-12 text-ink">
	<div class="mx-auto max-w-3xl px-6 pt-20 sm:pt-28">
		<p class="eyebrow">Blog</p>
		<h1 class="heading mt-6 text-5xl sm:text-6xl">#args.studio.esc( args.data.title )#</h1>
		<p class="mt-6 text-muted">#args.studio.esc( args.data.date )#<cfif len( args.data.author )> &middot; #args.studio.esc( args.data.author )#</cfif></p>
		<cfif arrayLen( args.data.categories )>
			<ul class="mt-6 flex flex-wrap gap-2">
				<cfloop array="#args.data.categories#" index="local.category">
					<li><span class="inline-block rounded-box border border-line px-3 py-1 text-sm text-muted">#args.studio.esc( local.category )#</span></li>
				</cfloop>
			</ul>
		</cfif>
	</div>
	<cfif len( args.data.image.src )>
		<div class="mx-auto mt-12 max-w-5xl px-4 sm:px-6">
			<img class="aspect-[16/9] w-full rounded-box object-cover" src="#args.studio.src( args.data.image.src )#" alt="">
		</div>
	</cfif>
</header></cfoutput>
