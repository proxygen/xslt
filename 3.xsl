<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- default copy -->
<xsl:template match="@*|node()">
	<xsl:copy>
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>


<xsl:template match="designerNavInner/module">
	<xsl:copy>
		<!-- <modulecount><xsl:value-of select="count(preceding-sibling::node()[local-name()='module']) + 1" /></modulecount> -->
		<xsl:apply-templates select="@*|node()"/>
	</xsl:copy>
</xsl:template>

<xsl:template match="designerNavInner/module/module">
	<xsl:copy>
		<xsl:variable name="modulecount" select="count(parent::node()/preceding-sibling::node()[local-name()='module']) + 1"/>
		<xsl:attribute name="modulecount">
			<xsl:value-of select="$modulecount" />
		</xsl:attribute>
		<!-- <xsl:apply-templates select="@*|node()"/> -->
		<xsl:choose>
			<xsl:when test="topic/title = 'Lecture'">
				<page>
					<xsl:attribute name="url">
						<xsl:text>module_</xsl:text>
						<xsl:value-of select='format-number($modulecount, "00")' />
						<xsl:text>/</xsl:text>
						<!--remove non-alphanumeric characters-->
						<xsl:value-of select="translate(title, translate(title, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', ''), '')" />
						<xsl:text>/concept_01/book01.html</xsl:text>
					</xsl:attribute>
				</page>
				<xsl:value-of select="" /><!--TODO-->
			</xsl:when>
			<xsl:when test="topic/title = 'Demonstration'">
				<xsl:variable name="title" select="substring(title,string-length('Demonstration') + 1)"/>
				<page>
					<xsl:attribute name="url">
						<xsl:text>module_</xsl:text>
						<xsl:value-of select='format-number($modulecount, "00")' />
						<xsl:text>/</xsl:text>
						<!--remove non-alphanumeric characters-->
						<xsl:value-of select="translate($title, translate($title, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', ''), '')" />
						<xsl:text>/exercise_01/book01.html</xsl:text>
					</xsl:attribute>
				</page>
			</xsl:when>
			<xsl:when test="topic/title = 'Exercise'">
				<xsl:variable name="title" select="substring(title,string-length('Exercise') + 1)"/>
				<page>
					<xsl:attribute name="url">
						<xsl:text>module_</xsl:text>
						<xsl:value-of select='format-number($modulecount, "00")' />
						<xsl:text>/</xsl:text>
						<!--remove non-alphanumeric characters-->
						<xsl:value-of select="translate($title, translate($title, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', ''), '')" />
						<xsl:text>/exercise_01/book01.html</xsl:text>
					</xsl:attribute>
				</page>
			</xsl:when>
			<xsl:when test="topic/title = 'Questions'">
				<page>
					<xsl:attribute name="url">
						<xsl:text>module_</xsl:text>
						<xsl:value-of select='format-number($modulecount, "00")' />
						<xsl:text>/prof/index.html</xsl:text>
					</xsl:attribute>
				</page>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates select="@*|node()"/></xsl:otherwise>
		</xsl:choose>
	</xsl:copy>
</xsl:template>

<xsl:template match="designerNavInner/module/topic[title='Introduction']">
	<topic>
		<xsl:variable name="modulecount" select="count(parent::node()/preceding-sibling::node()[local-name()='module']) + 1"/>
		<xsl:attribute name="modulecount">
			<xsl:value-of select="$modulecount" />
		</xsl:attribute>
		<page>
			<xsl:attribute name="url">
				<xsl:text>module_intro/module_</xsl:text>
				<xsl:value-of select='format-number($modulecount, "00")' />
				<xsl:text>_intro/book01.html</xsl:text>
			</xsl:attribute>
		</page>
	</topic>
</xsl:template>

<xsl:template match="designerNavInner/topic[title='Course Overview']">
	<topic>
		<xsl:copy-of select="title" />
		<page>
			<xsl:attribute name="url">
				<xsl:text>module_00/book01.html</xsl:text>
			</xsl:attribute>
		</page>
	</topic>
</xsl:template>

<xsl:template match="designerNavInner/unknown[title='Assessment']" />
</xsl:stylesheet>
<!-- module_00/book01.html -->
<!-- module_intro/module_12_intro/book01.html -->
<!-- module_06/prof/index.html -->
<!-- module_06/CheckingOutandModifyingCADDocuments/exercise_01/book01.html -->