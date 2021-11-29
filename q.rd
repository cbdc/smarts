<resource schema="smarts">
  <meta name="title">SMARTS catalogs</meta>
  <meta name="creationDate">2021-04-18T01:02:03</meta>
  <meta name="description">
      The Open Universe SMARTS optical catalog.
  </meta>
  <meta name="creator.name">Bonning et al.</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">Optical sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">optical</meta>
  </meta>

  <meta name="source">
    Bonning et al., 2012, ApJ, 756, 13
  </meta>

  <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="ID">
    <index columns="ra,dec"/>

    <column name="ID" type="text"
        ucd="meta.id;meta.main"
        tablehead="ID" verbLevel="1"
        description="ID"
        required="True"/>

    <column name="ra" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="ra" verbLevel="1"
      description="Right ascension (J2000) of the object"
      required="True"/>

    <column name="dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="dec" verbLevel="1"
      description="Declination (J2000) of the object"
      required="True"/>

    <column name="Freq" type="real"
      unit="Hz" ucd="em.freq"
      tablehead="Frequency" verbLevel="1"
      description="Frequency"
      required="True"/>

    <column name="Flux" type="real"
      unit="erg sec-1 cm-2" ucd="phot.flux.density;em.X-ray"
      tablehead="Flux" verbLevel="1"
      description="Flux"
      required="True"/>

    <column name="Flux_err" type="real"
      unit="erg sec-1 cm-2" ucd="stat.error;phot.flux.density;em.X-ray"
      tablehead="Flux_err" verbLevel="1"
      description="Flux error"
      required="True"/>

    <column name="MJD" type="double precision"
      unit="MJD" ucd="time.start"
      tablehead="MJD" verbLevel="1"
      description="observation time"
      required="True"/>

  </table>

  <data id="import">
    <sources>smarts.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">SMARTS catalog</meta>
    <meta name="shortName">smarts cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <!--publish render="scs.xml" sets="ivo_managed"/-->
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>
