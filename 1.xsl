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

<xsl:template match="div[@class='designerNavInner'][@style]">
	<designerNavInner>
		<xsl:for-each select="node()">
			<xsl:apply-templates select="." />
		</xsl:for-each>
	</designerNavInner>
</xsl:template>

<xsl:template match="div[@class][@id]">
    <xsl:variable name="regex" select="'tree_item .*?level_([0-9]*)\s?(.*?)(Standard)?\s?jq(.*)$'"/>
    <xsl:variable name="div-class" select="@class"/>
    <xsl:variable name="div-self" select="."/>
	<xsl:analyze-string select="$div-class" regex="{$regex}">
		<xsl:matching-substring>
			<xsl:variable name="div-type">
				<xsl:choose>
					<xsl:when test="regex-group(2) != ''">
						<xsl:value-of select="regex-group(2)"/>
					</xsl:when>
					<xsl:otherwise>unknown</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:element name="{$div-type}">
				<xsl:attribute name="level">
					<xsl:value-of select="regex-group(1)"/>
				</xsl:attribute>
				<xsl:attribute name="position">
					<xsl:value-of select="regex-group(4)"/>
				</xsl:attribute>
<!-- 					<xsl:attribute name="type">
					<xsl:value-of select="$div-type"/>
				</xsl:attribute> -->
				<xsl:for-each select="$div-self/node()">
					<xsl:apply-templates select="." />
				</xsl:for-each>
			</xsl:element>
		</xsl:matching-substring>
		<xsl:non-matching-substring>
			<xsl:for-each select="$div-self/node()">
				<xsl:copy>
					<xsl:apply-templates select="." />
				</xsl:copy>
			</xsl:for-each>
		</xsl:non-matching-substring>
	</xsl:analyze-string>
</xsl:template>

<!-- delete element -->
<xsl:template match="a[img]" />

<xsl:template match="p[@class='navEndOfCourse']">
</xsl:template>

<xsl:template match="div[@style='display:none']">
	<xsl:for-each select="node()">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>

<xsl:template match="ol">
	<xsl:for-each select="node()">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>

<xsl:template match="span">
	<!-- <span><xsl:value-of select="local-name()"/></span> -->
	<xsl:for-each select="node()">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>


</xsl:stylesheet>