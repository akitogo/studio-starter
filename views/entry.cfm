<cfscript>
	ssBody = prc.entry.renderContent();
	ssHasBlocks = find( "cb:block", prc.entry.getContent() ) > 0;
</cfscript>
<cfoutput>
#cb.event( "cbui_preEntryDisplay" )#
<main id="main">
	<article>
		<header class="mx-auto max-w-3xl px-6 pt-20 sm:pt-28">
			<p class="eyebrow">#encodeForHTML( prc.entry.getDisplayPublishedDate() )#</p>
			<h1 class="heading mt-6 text-5xl sm:text-6xl">#encodeForHTML( prc.entry.getTitle() )#</h1>
		</header>
		<cfif ssHasBlocks>
			<div class="mt-12">#ssBody#</div>
		<cfelse>
			<div class="prose prose-lg mx-auto max-w-3xl px-6 py-12">#ssBody#</div>
		</cfif>
	</article>
</main>
#cb.event( "cbui_postEntryDisplay" )#
</cfoutput>
