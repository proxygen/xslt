<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <content>
            <xsl:apply-templates/>
        </content>
    </xsl:template>

    <xsl:template match="h1">
        <section>
            <sectionHeading>
				<xsl:value-of select="."/>
            </sectionHeading>
            <sectionContent>
                <xsl:for-each select="following-sibling::p">
                    <paragraph>
                        <xsl:value-of select="."/>
                    </paragraph>
                </xsl:for-each>
            </sectionContent>
        </section>
    </xsl:template>

    <xsl:template match="p"/>
</xsl:stylesheet>