<cfoutput>
#cb.event( "cbui_preIndexDisplay" )#
<main id="main" class="mx-auto max-w-3xl px-6 py-20 sm:py-28">
	<h1 class="heading text-5xl sm:text-6xl">Blog</h1>
	<cfif prc.entriesCount>
		<ul class="mt-14 divide-y divide-line">
			<cfloop array="#prc.entries#" index="ssEntry">
				<li class="py-8">
					<p class="text-sm text-muted">#encodeForHTML( ssEntry.getDisplayPublishedDate() )#</p>
					<h2 class="heading mt-2 text-3xl"><a class="hover:text-brand" href="#cb.linkEntry( ssEntry )#">#encodeForHTML( ssEntry.getTitle() )#</a></h2>
					<cfif ssEntry.hasExcerpt()><div class="prose mt-4">#ssEntry.renderExcerpt()#</div></cfif>
				</li>
			</cfloop>
		</ul>
		<div class="mt-10">#cb.quickPaging()#</div>
	<cfelse>
		<p class="mt-10 text-muted">No entries yet.</p>
	</cfif>
</main>
#cb.event( "cbui_postIndexDisplay" )#
</cfoutput>
