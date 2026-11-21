<cfoutput>
<main id="main" class="mx-auto max-w-3xl px-6 py-28">
	<p class="eyebrow">Error</p>
	<h1 class="heading mt-6 text-5xl">Something went wrong</h1>
	<cfif getSetting( "environment" ) eq "development">
		<pre class="mt-8 overflow-auto rounded-box bg-surface-alt p-4 text-sm">#encodeForHTML( prc.exception.message )# #encodeForHTML( prc.exception.detail )#</pre>
	</cfif>
	<p class="mt-10"><a class="btn btn-primary" href="#cb.linkHome()#">Home</a></p>
</main>
</cfoutput>
