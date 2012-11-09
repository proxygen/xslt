<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- default copy -->
<xsl:template match="@*|node()">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>

<!-- transform element -->
<xsl:template match="a[p]">
	<title><xsl:value-of select="p"/></title>
</xsl:template>

<xsl:template match="div[@class]">
    <xsl:variable name="regex" select="'tree_item .*?level_([0-9]*)\s?(.*?)(Standard)?\s?jq(.*)$'"/>
    <xsl:variable name="div-class" select="@class"/>
	<div>
		<xsl:analyze-string select="@class" regex="{$regex}">
			<!-- tree_item level_2 topicStandard jqLeaf -->
			<!-- tree_item selected level_2 topicStandard jqLeaf -->
			<!-- tree_item level_2 jqLeaf -->
			<xsl:matching-substring>
				<xsl:attribute name="level">
					<xsl:value-of select="regex-group(1)"/>
				</xsl:attribute>
				<xsl:attribute name="position">
					<xsl:value-of select="regex-group(4)"/>
				</xsl:attribute>
				<xsl:attribute name="type">
					<xsl:choose>
						<xsl:when test="regex-group(2) != ''">
							<xsl:value-of select="regex-group(2)"/> 
						</xsl:when>
						<xsl:otherwise>unknown</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</xsl:matching-substring>
			<xsl:non-matching-substring>
				<error><xsl:value-of select="."/></error>
			</xsl:non-matching-substring>
		</xsl:analyze-string>
		<xsl:for-each select="node()">
			<xsl:apply-templates select="." />
		</xsl:for-each>
	</div>
</xsl:template>

<!-- delete element -->
<xsl:template match="a[img]" />

<xsl:template match="p[@class='navEndOfCourse']" />

<xsl:template match="ol">
	<xsl:for-each select="node()">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>

<xsl:template match="span">
	<xsl:for-each select="node()">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>


</xsl:stylesheet>