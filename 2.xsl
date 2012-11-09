<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- default copy -->
<xsl:template match="@*|node()">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>

<!-- transform element -->
<!-- <xsl:template match="li[module]">
	<module>
		<xsl:for-each select="node()">
			<xsl:copy>
				<xsl:apply-templates select="." />
			</xsl:copy>
		</xsl:for-each>
	</module>
</xsl:template> -->
<!-- <xsl:template match="li[topic|module|unknown]">
 	<xsl:variable name="first-child" select="node()[1]"/>
	<xsl:element name="{$first-child/local-name()}">
		<xsl:for-each select="node()">
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
 				<xsl:for-each select="following-sibling::node()">
					<xsl:apply-templates select="@*|node()"/>
				</xsl:for-each>
			</xsl:copy>
 			<xsl:apply-templates select="." />
			<xsl:choose>
				<xsl:when test="local-name() = 'topic'">
					<topic><xsl:apply-templates select="." /></topic>
				</xsl:when>
				<xsl:otherwise>unknown</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="." />
		</xsl:for-each>
 	</xsl:element>
</xsl:template> -->

<xsl:template match="li[topic]">
	<xsl:for-each select="topic">
		<topic>
			<xsl:for-each select="node()">
				<xsl:apply-templates select="." />
			</xsl:for-each>
 			<xsl:for-each select="following-sibling::node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</topic>
	</xsl:for-each>
</xsl:template>

<xsl:template match="li[module]">
	<xsl:for-each select="module">
		<module>
			<xsl:for-each select="node()">
				<xsl:apply-templates select="." />
			</xsl:for-each>
 			<xsl:for-each select="following-sibling::node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</module>
	</xsl:for-each>
</xsl:template>

<xsl:template match="li[unknown]">
	<xsl:for-each select="unknown">
		<unknown>
			<xsl:for-each select="node()">
				<xsl:apply-templates select="." />
			</xsl:for-each>
 			<xsl:for-each select="following-sibling::node()">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</unknown>
	</xsl:for-each>
</xsl:template>
<!-- <xsl:template match="li[module]">
	<xsl:for-each select="module">
		<module>
			<xsl:for-each select="following-sibling::li">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</module>
	</xsl:for-each>
</xsl:template>
<xsl:template match="li[unknown]">
	<xsl:for-each select="unknown">
		<unknown>
			<xsl:for-each select="following-sibling::li">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</unknown>
	</xsl:for-each>
</xsl:template> -->
</xsl:stylesheet>