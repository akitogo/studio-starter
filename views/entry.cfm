<cfscript>
	ssBody = prc.entry.renderContent();
	ssHasBlocks = find( "cb:block", prc.entry.getContent() ) > 0;
	ssImage = prc.entry.getFeaturedImageURL();
	ssCategories = prc.entry.getCategories();
</cfscript>
<cfoutput>
#cb.event( "cbui_preEntryDisplay" )#
<main id="main">
	<article>
		<header class="tone-light bg-surface text-ink">
			<div class="mx-auto max-w-3xl px-6 pt-20 sm:pt-28">
				<p class="eyebrow"><a class="hover:text-brand" href="#cb.linkBlog()#">Blog</a></p>
				<h1 class="heading mt-6 text-5xl sm:text-6xl">#encodeForHTML( prc.entry.getTitle() )#</h1>
				<p class="mt-6 text-muted">
					<time datetime="#dateFormat( prc.entry.getPublishedDate(), "yyyy-mm-dd" )#">#encodeForHTML( prc.entry.getDisplayPublishedDate( showTime = false ) )#</time>
					&middot; #encodeForHTML( prc.entry.getAuthorName() )#
				</p>
				<cfif arrayLen( ssCategories )>
					<ul class="mt-6 flex flex-wrap gap-2">
						<cfloop array="#ssCategories#" index="ssCat">
							<li><a class="inline-block rounded-box border border-line px-3 py-1 text-sm text-muted transition hover:border-brand hover:text-ink" href="#cb.linkCategory( ssCat )#">#encodeForHTML( ssCat.getCategory() )#</a></li>
						</cfloop>
					</ul>
				</cfif>
			</div>
			<cfif len( ssImage )>
				<div class="mx-auto mt-12 max-w-5xl px-4 sm:px-6">
					<img class="aspect-[16/9] w-full rounded-box object-cover" src="#encodeForHTMLAttribute( ssImage )#" alt="">
				</div>
			</cfif>
		</header>

		<cfif ssHasBlocks>
			<div class="mt-12">#ssBody#</div>
		<cfelse>
			<div class="tone-light bg-surface text-ink">
				<div class="prose prose-lg mx-auto max-w-3xl px-6 py-12">#ssBody#</div>
			</div>
		</cfif>

		<footer class="tone-light bg-surface text-ink">
			<div class="mx-auto max-w-3xl border-t border-line px-6 py-12">
				<a class="btn btn-secondary" href="#cb.linkBlog()#"><span aria-hidden="true">&larr;</span> All posts</a>
			</div>
		</footer>
	</article>
</main>
#cb.event( "cbui_postEntryDisplay" )#
</cfoutput>
