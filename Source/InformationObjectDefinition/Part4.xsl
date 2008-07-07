<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
<!--
  Program: GDCM (Grass Root DICOM). A DICOM library
  Module:  $URL: https://gdcm.svn.sourceforge.net/svnroot/gdcm/trunk/Source/InformationObjectDefinition/getelements.xsl $

  Copyright (c) 2006-2008 Mathieu Malaterre
  All rights reserved.
  See Copyright.txt or http://gdcm.sourceforge.net/Copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.
-->
<xsl:template match="text()" />
  <xsl:template match="informaltable">
	  <xsl:if test="tgroup/tbody/row/entry/para = 'SOP Class Name'">
    <xsl:apply-templates/>
	  </xsl:if>
  </xsl:template>

  <xsl:template match="para">
    <!--xsl:apply-templates/-->
  </xsl:template>

  <xsl:template match="tgroup">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="article">
    <xsl:variable name="section-number" select="'Table B.5-1STANDARD SOP CLASSES'"/>
    <xsl:variable name="section-anchor" select="para[starts-with(normalize-space(.),$section-number)]"/>
    <xsl:message><xsl:value-of select="$section-anchor"/></xsl:message>
    <sops>
	    <!--xsl:apply-templates select="article/sect1/sect2/informaltable"/-->
	    <!--xsl:apply-templates select="informaltable"/-->
	    <xsl:apply-templates select="sect1/sect2"/>
    </sops>
  </xsl:template>
 
  <xsl:template match="row">
    <!--xsl:apply-templates/-->
    <sop sopclassname="{entry[1]/para}" sopclassuid="{entry[2]/para}" spec="{entry[3]/para}" />
  </xsl:template>

  <!--
  <xsl:template match="entry">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="para">
    <xsl:value-of select="."/>
  </xsl:template>
  -->
 
  <xsl:template match="/">
    <xsl:apply-templates select="article"/>
 </xsl:template>
</xsl:stylesheet>

