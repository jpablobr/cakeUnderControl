<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="maven.xsl"/>
  <xsl:import href="phpunit-pmd.xsl"/>
  <xsl:import href="errors.xsl"/>
  <xsl:import href="phpdoc.xsl"/>
  <xsl:import href="phpcs.xsl"/>
  <xsl:import href="phpunit.xsl"/>
  <xsl:import href="fittests.xsl"/>
  <xsl:import href="modifications.xsl"/>
  <xsl:import href="cvstagdiff.xsl"/>
  <xsl:import href="distributables.xsl"/>
  <xsl:import href="cakephp-simpletest.xsl"/>

  <xsl:output method="html"/>

  <xsl:variable name="cruisecontrol.list" select="."/>

  <xsl:template match="/">
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="errors"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="maven"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="pmd"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="checkstyle" /></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="phpdoc" /></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="unittests"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="cakephp-simpletest"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="modifications"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="cvstagdiff"/></p>
    <p><xsl:apply-templates select="$cruisecontrol.list" mode="distributables"/></p>

  </xsl:template>
</xsl:stylesheet>
