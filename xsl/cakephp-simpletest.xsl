<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/" mode="Cakephp-simpletest" >
    <table class="result" align="center">
      <thead>
        <tr>
          <th colspan="4">
            Cakephp Unit Tests: (<xsl:value-of select="count(//run//pass|//run//fail)" />)
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th colspan="4">
            Total Pass case(s): (<xsl:value-of select="count(//run//pass)" />)
          </th>
        </tr>
        <tr>
          <th colspan="4">
            Total Fail case(s): (<xsl:value-of select="count(//run//fail)" />)
          </th>
        </tr>
        <tr>
          <th colspan="4">
            Total Exception(s): (<xsl:value-of select="count(//run//exception)"
/>)
          </th>
        </tr>
      </tbody>
    </table>
  </xsl:template>

</xsl:stylesheet>

