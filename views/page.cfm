<cfscript>
	// Pages built with Studio blocks are full-width sections; classic content gets a title and a reading column
	ssBody = prc.page.renderContent();
	ssHasBlocks = find( "cb:block", prc.page.getContent() ) > 0;
</cfscript>
<cfoutput>
#cb.event( "cbui_prePageDisplay" )#
<main id="main">
	<cfif ssHasBlocks>
		#ssBody#
	<cfelse>
		<div class="mx-auto max-w-3xl px-6 py-20 sm:py-28">
			<h1 class="heading text-5xl sm:text-6xl">#encodeForHTML( prc.page.getTitle() )#</h1>
			<div class="prose prose-lg mt-10">#ssBody#</div>
		</div>
	</cfif>
</main>
#cb.event( "cbui_postPageDisplay" )#
</cfoutput>
