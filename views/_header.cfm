<cfscript>
	// Header from HyperUI's header "Icon on the left, links and call to actions on the right" (MIT)
	ssMenu = cb.rootMenu( type = "data", levels = "1" );
	if ( prc.oCurrentSite.getIsBlogEnabled() ) {
		ssMenu.append( { "title" : "Blog", "link" : cb.linkBlog() } );
	}
	ssButtonLabel = cb.themeSetting( "headerButtonLabel", "" );
	ssButtonLink = cb.themeSetting( "headerButtonLink", "" );
	ssHasButton = len( ssButtonLabel ) && len( ssButtonLink );
</cfscript>
<cfoutput>
<header class="tone-light sticky top-0 z-40 border-b border-line bg-surface/90 backdrop-blur">
	<div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
		<div class="flex h-16 items-center gap-8">
			<a class="heading text-xl text-ink" href="#cb.linkHome()#">#encodeForHTML( cb.siteName() )#</a>

			<!--- Menu and button on the right, aligned with the content's right edge, with or without a button --->
			<div class="ml-auto flex items-center gap-8">
				<nav aria-label="Main" class="hidden md:block">
					<ul class="flex items-center gap-8 text-sm font-medium">
						<cfloop array="#ssMenu#" index="ssItem">
							<li><a class="text-muted transition hover:text-ink" href="#encodeForHTMLAttribute( ssItem.link )#">#encodeForHTML( ssItem.title )#</a></li>
						</cfloop>
					</ul>
				</nav>

				<cfif ssHasButton>
					<a class="btn btn-primary hidden px-4 py-2.5 text-sm sm:inline-flex" href="#encodeForHTMLAttribute( ssButtonLink )#">#encodeForHTML( ssButtonLabel )#</a>
				</cfif>
				<button type="button" popovertarget="ss-mobile-menu" aria-expanded="false" aria-controls="ss-mobile-menu" class="rounded-box p-2 text-ink transition hover:bg-surface-alt md:hidden">
					<span class="sr-only">Menu</span>
					<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" class="size-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"/></svg>
				</button>
			</div>
		</div>
	</div>

	<nav id="ss-mobile-menu" popover aria-label="Mobile" class="tone-light inset-x-0 top-16 bottom-auto m-0 h-auto w-full border-0 border-b border-line bg-surface p-4 shadow-sm md:hidden">
		<ul class="space-y-1">
			<cfloop array="#ssMenu#" index="ssItem">
				<li><a class="block rounded-box px-3 py-2 text-ink transition hover:bg-surface-alt" href="#encodeForHTMLAttribute( ssItem.link )#">#encodeForHTML( ssItem.title )#</a></li>
			</cfloop>
			<cfif ssHasButton>
				<li class="pt-2"><a class="btn btn-primary w-full" href="#encodeForHTMLAttribute( ssButtonLink )#">#encodeForHTML( ssButtonLabel )#</a></li>
			</cfif>
		</ul>
	</nav>
	<script>
		document.getElementById( 'ss-mobile-menu' ).addEventListener( 'toggle', ( event ) => {
			document.querySelector( '[popovertarget="ss-mobile-menu"]' ).setAttribute( 'aria-expanded', String( event.newState === 'open' ) )
		} )
	</script>
</header>
</cfoutput>
