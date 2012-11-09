<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- default copy -->
<xsl:template match="@*|node()">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>


<xsl:template match="designerNavInner/module">
	<xsl:copy>
		<modulecount><xsl:value-of select="count(preceding-sibling::node()[local-name()='module']) + 1" /></modulecount>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="designerNavInner/module/module">
	<xsl:copy>
		<xsl:attribute name="modulecount">
			<xsl:value-of select="count(preceding-sibling::node()[local-name()='modulecount']) + 1" />
		</xsl:attribute>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>