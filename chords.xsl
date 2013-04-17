<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="ChordML/@title"/>
                </title>
                <link href="styles.css" media="screen" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <xsl:apply-templates select="ChordsML/body/verse | ChordsML/body/chorus"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ChordsML/body/verse">
        <h2>Verse <xsl:value-of select="@n"/></h2>
        <xsl:apply-templates />     
        
    </xsl:template>

        <xsl:template match="ChordsML/body/chorus">
            <h2>
                <xsl:if test="not(line)">[</xsl:if>Chorus<xsl:if test="not(line)">]</xsl:if>
            </h2>
            
        <xsl:apply-templates />     
        
    </xsl:template>    
    <xsl:template match="line">
        
        <xsl:choose>
            <xsl:when test="@blank='true'">
                <p class="emptyLine">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
                
                
    <xsl:template match="c[@r]">
        <span class="chord">
            <span class="top">
                <xsl:value-of select="@r"/>
                <xsl:apply-templates select="@q"/>
                <xsl:apply-templates select="@n"/>
            </span>
            <xsl:apply-templates select="@b"/>
        </span>
    </xsl:template>
    
    <xsl:template match="@q">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="@n">
        <sup>
            <xsl:value-of select="."/>
        </sup>
    </xsl:template>
    
    <!-- This line needs to be written as a single line in order for line breaks not to be written in the wrong spot. --> 
    <xsl:template match="@b">/<span class="bass"><xsl:value-of select="."/></span></xsl:template>
</xsl:stylesheet>




