<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:abcd="http://www.tdwg.org/schemas/abcd/2.06" xmlns:biocase="http://www.biocase.org/schemas/protocol/1.3" xmlns:efg="http://www.synthesys.info/ABCDEFG/1.0" xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:europeana="http://www.europeana.eu/schemas/ese/" xmlns:ore="http://www.openarchives.org/ore/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/">
<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>

<xsl:template match="/">

	<regnet-document>
		
			<edm:ProvidedCHO>
				<dc:identifier> <xsl:value-of select="concat(abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SourceInstitutionID,' - ',abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SourceID,' - ',abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:UnitID)" /> </dc:identifier>
				<dc:title>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString"/>
				</dc:title>
				<dc:description>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Notes"/>
				</dc:description>
				<dc:description>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus"/>
				</dc:description>
				<dc:date>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Identifications/abcd:Identification/abcd:Date"/>
				</dc:date>
				<dc:source>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title"/>
				</dc:source>
				<dc:type>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:RecordBasis"/>
				</dc:type>
				<dcterms:spatial>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:Country/abcd:Name"/>
				</dcterms:spatial>
				<dcterms:spatial>
					<xsl:value-of select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit/abcd:Gathering/abcd:AreaDetail"/>
				</dcterms:spatial>
			</edm:ProvidedCHO>
			
			
			 <xsl:for-each select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit">
				
				<MyUnit>
				
				<dc:identifier>
				
					<xsl:if test="abcd:SourceInstitutionID">
						<xsl:value-of select="concat(abcd:SourceInstitutionID,' - ')"/>
					</xsl:if>
					
					<xsl:if test="abcd:SourceID">
						<xsl:value-of select="concat(abcd:SourceID, ' - ')"/>
					</xsl:if>
					
					<xsl:if test="abcd:UnitID">
						<xsl:value-of select="abcd:UnitID"/>
					</xsl:if>
				</dc:identifier>
				
				<dcterms:provenance>
					<xsl:value-of select="abcd:SpecimenUnit/abcd:History/abcd:PreviousUnitsText"/>
				
				</dcterms:provenance>
				<dc:title>
					<xsl:value-of select="concat(abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString,' - ',abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypifiedName/abcd:FullScientificNameString,' - ',abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/abcd:MineralRockIdentified/abcd:InformalNameString,' - ',abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/abcd:MineralRockIdentified/abcd:ClassifiedName/abcd:FullScientificNameString,' - ',abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/abcd:MineralRockIdentified/abcd:NameAddendum,' - ',abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/abcd:MineralRockIdentified/abcd:VarietalNameString)" />
				</dc:title>
				
				
				<dc:contributor>
				
					<xsl:value-of select="abcd:Gathering/abcd:Agents/abcd:GatheringAgent/abcd:AgentText"/>
					
					<xsl:value-of select="abcd:GatheringAgent/abcd:Person/abcd:FullName"/>
					
					<xsl:value-of select="abcd:Gathering/abcd:Agents/abcd:GatheringAgentsText"/>
					
					<xsl:value-of select="abcd:Identifications/abcd:Identification/abcd:Identifiers/abcd:Identifier/abcd:PersonName/abcd:FullName"/>
				
				</dc:contributor>
				
				<xsl:if test="abcd:KindOfUnit">
					<dc:description>
						<xsl:value-of select="abcd:KindOfUnit"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:SpecimenUnit/abcd:Preparations/abcd:Preparation/abcd:PreparationType">
					<dc:description>
						<xsl:value-of select="abcd:SpecimenUnit/abcd:Preparations/abcd:Preparation/abcd:PreparationType"/>
					</dc:description>
					
				</xsl:if>
				
				<xsl:if test="abcd:SpecimenUnit/abcd:Marks/abcd:Mark/abcd:MarkText">
					<dc:description>
						<xsl:value-of select="abcd:SpecimenUnit/abcd:Marks/abcd:Mark/abcd:MarkText"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:Gathering/abcd:Notes">
					<dc:description>
						<xsl:value-of select="abcd:Gathering/abcd:Notes"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:Sex">
					<dc:description>
						<xsl:value-of select="abcd:Sex"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:Age">
					<dc:description>
						<xsl:value-of select="abcd:Age"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:Notes">					
					<dc:description>
						<xsl:value-of select="abcd:Notes"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus">
					<dc:description>
						<xsl:value-of select="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus"/>
					</dc:description>
				</xsl:if>
	
				<xsl:if test="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PartOfOrganism">					
					<dc:description>
						<xsl:value-of select="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PartOfOrganism"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PreservationMode/abcd:PreservationModeText">	
					<dc:description>
						<xsl:value-of select="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PreservationMode/abcd:PreservationModeText"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitWeight">	
					<dc:description>
						<xsl:value-of select="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitWeight"/>
					</dc:description>
				</xsl:if>
				
				<xsl:if test="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Pseudomorph">
					<dc:description>
						<xsl:value-of select="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Pseudomorph"/>
					</dc:description>
				</xsl:if>
				<xsl:if test="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Twinning">
					<dc:description>
						<xsl:value-of select="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Twinning"/>
					</dc:description>
				</xsl:if>
				
				
				 <xsl:for-each select="abcd:MultiMediaObjects/abcd:MultiMediaObject">
				 
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
			
			  </MyUnit>
			  
   			</xsl:for-each>
   	</regnet-document>
	</xsl:template>
</xsl:stylesheet>
