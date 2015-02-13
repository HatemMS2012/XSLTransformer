<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:abcdefg="http://www.synthesys.info/ABCDEFG/1.0" xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:europeana="http://www.europeana.eu/schemas/ese/" xmlns:ore="http://www.openarchives.org/ore/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:abcd="http://www.tdwg.org/schemas/abcd/2.06">
<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>

<xsl:template match="/">

	<regnet-document>
		<section name="EDM">
			<edm:ProvidedCHO>
				<dc:identifier> <xsl:value-of select="concat(section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SourceInstitutionID,' - ',section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SourceID,' - ',section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:UnitID)" /> </dc:identifier>
				<dc:title>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString"/>
				</dc:title>
				<dc:description>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Notes"/>
				</dc:description>
				<dc:description>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus"/>
				</dc:description>
				<dc:date>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Date"/>
				</dc:date>
				<dc:source>
					<xsl:value-of select="section/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title"/>
				</dc:source>
				<dc:type>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:RecordBasis"/>
				</dc:type>
				<dcterms:spatial>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Country/abcd:Name"/>
				</dcterms:spatial>
				<dcterms:spatial>
					<xsl:value-of select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:AreaDetail"/>
				</dcterms:spatial>
			</edm:ProvidedCHO>
			
			 <xsl:for-each select="section/abcd:DataSet/abcd:Units/abcd:Unit/abcd:MultiMediaObjects/abcd:MultiMediaObject">
			 
			 	<edm:WebResource>
			 		<xsl:attribute name="rdf:about">
			 		    <xsl:value-of select="abcd:FileURI" />
  					</xsl:attribute>
				 <dc:description>
				 		<xsl:value-of select="abcd:Comment" />
				 </dc:description>
				  <dc:format>
				  		<xsl:value-of select="abcd:Format" />
				  </dc:format>
				  <dc:rights>
				  		<xsl:value-of select="abcd:IPR/abcd:Licenses/abcd:License/abcd:Text" />
				  </dc:rights>
				  <edm:rights>
				  <xsl:attribute name="rdf:resource">
			 		    <xsl:value-of select="abcd:IPR/abcd:Licenses/abcd:License/abcd:URI" />
  					</xsl:attribute>
				  </edm:rights>
				  	
			 	</edm:WebResource>
			 </xsl:for-each>
   		</section>
   	</regnet-document>
	</xsl:template>
</xsl:stylesheet>
