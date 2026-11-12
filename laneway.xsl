<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/school">
    <html>
      <head>
        <title>Laneway School</title>
        <link rel="stylesheet" href="laneway.css"/>
      </head>
      <body>
        <h1>Laneway School</h1>

        <!-- Trainers -->
        <h2>Trainers</h2>
        <xsl:for-each select="people/trainers/trainer">
          <div class="card">
            <span class="id"><xsl:value-of select="@id"/></span>
            <p class="name"><xsl:value-of select="name"/></p>
            <p><span class="label">Location: </span><xsl:value-of select="location"/></p>
            <p><span class="label">Teaches:</span></p>
            <ul>
              <!-- Find every course whose trainerRef matches this trainer's id -->
              <xsl:for-each select="//course[trainerRef = current()/@id]">
                <li><xsl:value-of select="name"/></li>
              </xsl:for-each>
            </ul>
          </div>
        </xsl:for-each>

        <!-- Students -->
        <h2>Students</h2>
        <xsl:for-each select="people/students/student">
          <div class="card">
            <span class="id"><xsl:value-of select="@id"/></span>
            <p class="name"><xsl:value-of select="name"/></p>
            <xsl:for-each select="enrolment">
              <p>
                <span class="label">Course: </span>
                <!-- Look up the course whose id matches this enrolment -->
                <xsl:value-of select="//course[@id = current()/@course]/name"/>
              </p>
              <p><span class="label">Since: </span><xsl:value-of select="@date"/></p>
            </xsl:for-each>
          </div>
        </xsl:for-each>

        <!-- Courses -->
        <h2>Courses</h2>
        <xsl:for-each select="courses/course">
          <div class="card">
            <span class="id"><xsl:value-of select="@id"/></span>
            <p class="name"><xsl:value-of select="name"/></p>
            <p><span class="label">Duration: </span><xsl:value-of select="duration"/>&#160;<xsl:value-of select="duration/@unit"/></p>
            <p>
              <span class="label">Trainer: </span>
              <!-- Look up the trainer whose id matches trainerRef -->
              <xsl:value-of select="//trainer[@id = current()/trainerRef]/name"/>
            </p>
          </div>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
