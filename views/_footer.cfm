<cfscript>
	ssFooterMenu = cb.rootMenu( type = "data", levels = "1" );
	if ( prc.oCurrentSite.getIsBlogEnabled() ) {
		ssFooterMenu.append( { "title" : "Blog", "link" : cb.linkBlog() } );
	}
</cfscript>
<cfoutput>
<footer class="tone-dark bg-surface text-ink">
	<div class="mx-auto max-w-7xl px-4 py-16 sm:px-6 lg:px-8">
		<div class="flex flex-col gap-10 md:flex-row md:items-start md:justify-between">
			<div class="max-w-sm">
				<p class="heading text-3xl">#encodeForHTML( cb.siteName() )#</p>
				<cfif len( cb.siteTagLine() )><p class="mt-3 text-muted">#encodeForHTML( cb.siteTagLine() )#</p></cfif>
			</div>
			<nav aria-label="Footer">
				<ul class="flex flex-wrap gap-x-8 gap-y-3 text-sm">
					<cfloop array="#ssFooterMenu#" index="ssItem">
						<li><a class="text-muted transition hover:text-ink" href="#encodeForHTMLAttribute( ssItem.link )#">#encodeForHTML( ssItem.title )#</a></li>
					</cfloop>
				</ul>
			</nav>
		</div>
		<div class="mt-12 border-t border-line pt-8 text-xs text-muted">&copy; #year( now() )# #encodeForHTML( cb.siteName() )#</div>
		#cb.event( "cbui_footer" )#
	</div>
</footer>
</cfoutput>
