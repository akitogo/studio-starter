<cfscript>
	// Blog list: cards from HyperUI's blog card "Bordered with image, date, title and excerpt, shadow on hover" (MIT)
	ssCategorySlug = rc.category ?: "";
	ssSearch = rc.q ?: "";
	// The category's name, from the entries (all of them have it)
	ssCategoryName = ssCategorySlug;
	if ( len( ssCategorySlug ) && prc.entriesCount ) {
		for ( ssCat in prc.entries[ 1 ].getCategories() ) {
			if ( ssCat.getSlug() == ssCategorySlug ) {
				ssCategoryName = encodeForHTML( ssCat.getCategory() );
			}
		}
	}
</cfscript>
<cfoutput>
#cb.event( "cbui_preIndexDisplay" )#
<main id="main" class="tone-light bg-surface text-ink">
	<div class="mx-auto max-w-7xl px-4 pt-20 pb-24 sm:px-6 sm:pt-28 lg:px-8">
		<p class="eyebrow">Blog</p>
		<h1 class="heading mt-6 text-5xl sm:text-7xl">
			<cfif len( ssCategorySlug )>#ssCategoryName#<cfelseif len( ssSearch )>Search: #encodeForHTML( ssSearch )#<cfelse>#encodeForHTML( cb.themeSetting( "blogTitle", "Latest posts" ) )#</cfif>
		</h1>
		<cfif len( ssCategorySlug ) || len( ssSearch )>
			<p class="mt-8"><a class="btn btn-secondary" href="#cb.linkBlog()#">All posts</a></p>
		</cfif>

		<cfif prc.entriesCount>
			<div class="mt-14 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
				<cfloop array="#prc.entries#" index="ssEntry">
					<cfscript>
						ssLink = cb.linkEntry( ssEntry );
						ssImage = ssEntry.getFeaturedImageURL();
						// Excerpt as plain text (the card clamps it), else the meta description
						ssSummary = ssEntry.hasExcerpt() ? trim( reReplace( ssEntry.renderExcerpt(), "<[^>]*>", " ", "all" ) ) : "";
						if ( !len( ssSummary ) ) {
							ssSummary = ssEntry.getHTMLDescription();
						}
						ssCategories = ssEntry.getCategories().map( ( category ) => category.getCategory() ).toList( ", " );
					</cfscript>
					<article class="group flex flex-col overflow-hidden rounded-box border border-line bg-surface-alt transition hover:shadow-lg">
						<a href="#ssLink#" class="block overflow-hidden" tabindex="-1" aria-hidden="true">
							<cfif len( ssImage )>
								<img alt="" src="#encodeForHTMLAttribute( ssImage )#" class="h-56 w-full object-cover transition duration-500 group-hover:scale-105">
							<cfelse>
								<!--- No featured image: a panel in the brand color keeps the cards even --->
								<span class="tone-brand flex h-56 items-end bg-surface p-6 transition duration-500 group-hover:bg-surface-alt">
									<span class="heading text-4xl text-ink">#encodeForHTML( len( ssCategories ) ? listFirst( ssCategories ) : "Blog" )#</span>
								</span>
							</cfif>
						</a>
						<div class="flex flex-1 flex-col p-6">
							<p class="text-xs font-medium tracking-wide text-muted uppercase">
								<time datetime="#dateFormat( ssEntry.getPublishedDate(), "yyyy-mm-dd" )#">#encodeForHTML( ssEntry.getDisplayPublishedDate( showTime = false ) )#</time><cfif len( ssCategories )> · #encodeForHTML( ssCategories )#</cfif>
							</p>
							<h2 class="heading mt-3 text-2xl"><a class="transition hover:text-brand" href="#ssLink#">#encodeForHTML( ssEntry.getTitle() )#</a></h2>
							<cfif len( ssSummary )><p class="mt-3 line-clamp-3 text-pretty text-muted">#encodeForHTML( ssSummary )#</p></cfif>
							<p class="mt-auto pt-6"><a class="inline-flex items-center gap-2 text-sm font-semibold text-ink transition hover:text-brand" href="#ssLink#">Read more <span class="sr-only">about #encodeForHTML( ssEntry.getTitle() )#</span><span aria-hidden="true">&rarr;</span></a></p>
						</div>
					</article>
				</cfloop>
			</div>
			<div class="mt-16">#cb.quickPaging()#</div>
		<cfelse>
			<p class="mt-14 text-lg text-muted">No posts yet.</p>
		</cfif>
	</div>
</main>
#cb.event( "cbui_postIndexDisplay" )#
</cfoutput>
