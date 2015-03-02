<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:abcd="http://www.tdwg.org/schemas/abcd/2.06"
	xmlns:biocase="http://www.biocase.org/schemas/protocol/1.3" xmlns:efg="http://www.synthesys.info/ABCDEFG/1.0"
	xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:europeana="http://www.europeana.eu/schemas/ese/"
	xmlns:ore="http://www.openarchives.org/ore/terms/" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:dcterms="http://purl.org/dc/terms/">
	
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes" />

	<xsl:template match="/">

		<europeana:metadata>

			<!-- if no unit owner is given europeana:dataProvider /DataSets/DataSet/Metadata/Owners/Owner/Organisation/Name/Representation/Text -->
			<xsl:for-each select="abcd:DataSets/abcd:DataSet/abcd:Units/abcd:Unit">

				<rdf:RDF>

					<edm:ProvidedCHO>

						<xsl:if test="abcd:SourceInstitutionID">
							<dc:identifier>
								<xsl:value-of select="abcd:SourceInstitutionID" />
							</dc:identifier>
						</xsl:if>

						<xsl:if test="abcd:SourceID">
							<dc:identifier>
								<xsl:value-of select="abcd:SourceID" />
							</dc:identifier>
						</xsl:if>

						<xsl:if test="abcd:UnitID">
							<dc:identifier>
								<xsl:value-of select="abcd:UnitID" />
							</dc:identifier>
						</xsl:if>




						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString">
							<dc:title>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Result/abcd:TaxonIdentified/abcd:ScientificName/abcd:FullScientificNameString" />
							</dc:title>
						</xsl:if>

						<xsl:if
							test="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypifiedName/abcd:FullScientificNameString">
							<dc:title>
								<xsl:value-of
									select="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypifiedName/abcd:FullScientificNameString" />
							</dc:title>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:InformalNameString">
							<dc:title>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:InformalNameString" />
							</dc:title>
						</xsl:if>
						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:ClassifiedName/efg:FullScientificNameString">
							<dc:title>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:ClassifiedName/efg:FullScientificNameString" />
							</dc:title>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:NameAddendum">
							<dc:title>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:NameAddendum" />
							</dc:title>
						</xsl:if>


						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:VarietalNameString">
							<dc:title>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Result/abcd:Extension/efg:MineralRockIdentified/efg:VarietalNameString" />
							</dc:title>
						</xsl:if>

					
				
						<xsl:if
							test="abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title">
							<dc:source>
								<xsl:value-of
									select="abcd:DataSets/abcd:DataSet/abcd:Metadata/abcd:Description/abcd:Representation/abcd:Title" />
							</dc:source>
						</xsl:if>

						<xsl:if test="abcd:Identifications/abcd:Identification/abcd:Date">
							<dc:date>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Date" />
							</dc:date>
						</xsl:if>



						<xsl:if
							test="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:LowerValue">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Altitude:',abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:LowerValue)" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:LowerValue/abcd:accuracyGathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:LowerValue/abcd:accuracy">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:LowerValue/abcd:accuracy" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UpperValue">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UpperValue" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UpperValue/abcd:accuracy">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Altitude/abcd:MeasurementOrFactAtomised/abcd:UpperValue/abcd:accuracy" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:AreaDetail">
							<dcterms:spatial>
								<xsl:value-of select="abcd:Gathering/abcd:AreaDetail" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:Aspect/abcd:Ordination">
							<dcterms:spatial>
								<xsl:value-of select="abcd:Gathering/abcd:Aspect/abcd:Ordination" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:Aspect/abcd:Text">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Aspect:',abcd:Gathering/abcd:Aspect/abcd:Text)" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if test="abcd:Gathering/abcd:Biotope/abcd:Name">
							<dcterms:spatial>
								<xsl:value-of select="abcd:Gathering/abcd:Biotope/abcd:Name" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:Biotope/abcd:Text">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Biotope:',abcd:Gathering/abcd:Biotope/abcd:Text)" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:Country/abcd:Name">
							<dcterms:spatial>
								<xsl:value-of select="abcd:Gathering/abcd:Country/abcd:Name" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:Depth/abcd:MeasurementOrFactAtomised/abcd:LowerValue">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Depth:',abcd:Gathering/abcd:Depth/abcd:MeasurementOrFactAtomised/abcd:LowerValue)" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:Depth/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Depth/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:LowerValue">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Height:',abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:LowerValue)" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:UnitOfMeasurement" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:UpperValue">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:Height/abcd:MeasurementOrFactAtomised/abcd:UpperValue" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if test="abcd:Gathering/abcd:LocalityText">
							<dcterms:spatial>
								<xsl:value-of select="abcd:Gathering/abcd:LocalityText" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:NamedAreas/abcd:NamedArea/abcd:AreaClass">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('(',abcd:Gathering/abcd:NamedAreas/abcd:NamedArea/abcd:AreaClass,')')" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:NamedAreas/abcd:NamedArea/abcd:AreaName">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:NamedAreas/abcd:NamedArea/abcd:AreaName" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:NearNamedPlaces/abcd:NamedPlaceRelation/abcd:NearNamedPlace">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:NearNamedPlaces/abcd:NamedPlaceRelation/abcd:NearNamedPlace" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinateMethod">
							<dcterms:spatial>
								<xsl:value-of
									select="abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinateMethod" />
							</dcterms:spatial>
						</xsl:if>


						<xsl:if
							test="abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:CoordinateErrorDistanceInMeters">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Longitude: ',abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:CoordinateErrorDistanceInMeters)" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:SpatialDatum">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('(',abcd:Gathering/abcd:SiteCoordinateSets/abcd:SiteCoordinates/abcd:CoordinatesLatLong/abcd:SpatialDatum,')')" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Stratigraphy/abcd:BiostratigraphicTerms/abcd:BiostratigraphicTerm/abcd:Term">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Stratigraphy:',abcd:Gathering/abcd:Stratigraphy/abcd:BiostratigraphicTerms/abcd:BiostratigraphicTerm/abcd:Term)" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Stratigraphy/abcd:ChronostratigraphicTerms/abcd:ChronostratigraphicTerm/abcd:Term">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Stratigraphy:',abcd:Gathering/abcd:Stratigraphy/abcd:ChronostratigraphicTerms/abcd:ChronostratigraphicTerm/abcd:Term)" />
							</dcterms:spatial>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Stratigraphy/abcd:LithostratigraphicTerms/abcd:LithostratigraphicTerm/abcd:Term">
							<dcterms:spatial>
								<xsl:value-of
									select="concat('Stratigraphy:',abcd:Gathering/abcd:Stratigraphy/abcd:LithostratigraphicTerms/abcd:LithostratigraphicTerm/abcd:Term)" />
							</dcterms:spatial>
						</xsl:if>




						<xsl:if
							test="abcd:Owner/abcd:Organisation/abcd:Name/abcd:Representation/abcd:Text">
							<europeana:dataProvider>

								<xsl:value-of
									select="abcd:Owner/abcd:Organisation/abcd:Name/abcd:Representation/abcd:Text" />
							</europeana:dataProvider>

						</xsl:if>






						<xsl:if test="abcd:SpecimenUnit/abcd:History/abcd:PreviousUnitsText">
							<dcterms:provenance>
								<xsl:value-of
									select="abcd:SpecimenUnit/abcd:History/abcd:PreviousUnitsText" />

							</dcterms:provenance>
						</xsl:if>



						<xsl:if test="abcd:RecordBasis">
							<dc:type>
								<xsl:value-of select="abcd:RecordBasis" />
							</dc:type>
						</xsl:if>

						<xsl:if
							test="abcd:Gathering/abcd:Agents/abcd:GatheringAgent/abcd:AgentText">
							<dc:contributor>

								<xsl:value-of
									select="abcd:Gathering/abcd:Agents/abcd:GatheringAgent/abcd:AgentText" />

							</dc:contributor>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Identifiers/abcd:IdentifiersText">
							<dc:contributor>
								<xsl:value-of
									select="concat('role: identifier',abcd:Identifications/abcd:Identification/abcd:Identifiers/abcd:IdentifiersText)" />
							</dc:contributor>
						</xsl:if>

						<xsl:if test="abcd:GatheringAgent/abcd:Person/abcd:FullName">
							<dc:contributor>
								<xsl:value-of
									select="concat('role:collector',abcd:GatheringAgent/abcd:Person/abcd:FullName)" />
							</dc:contributor>
						</xsl:if>

						<xsl:if test="abcd:Gathering/abcd:Agents/abcd:GatheringAgentsText">
							<dc:contributor>
								<xsl:value-of
									select="concat('role:collector',abcd:Gathering/abcd:Agents/abcd:GatheringAgentsText)" />
							</dc:contributor>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Identifiers/abcd:Identifier/abcd:PersonName/abcd:FullName">
							<dc:contributor>
								<xsl:value-of
									select="concat('role:identifier',abcd:Identifications/abcd:Identification/abcd:Identifiers/abcd:Identifier/abcd:PersonName/abcd:FullName)" />
							</dc:contributor>
						</xsl:if>

						<xsl:if test="abcd:CollectorsFieldNumber">
							<dc:contributor>
								<xsl:value-of select="abcd:CollectorsFieldNumber" />
							</dc:contributor>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/Date/abcd:ISODateTimeBegin">
							<dc:contributor>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/Date/abcd:ISODateTimeBegin" />
							</dc:contributor>
						</xsl:if>

						<xsl:if test="abcd:Gathering/abcd:Code">
							<dc:contributor>
								<xsl:value-of select="abcd:Gathering/abcd:Code" />

							</dc:contributor>


						</xsl:if>


						<xsl:if test="abcd:Gathering/abcd:DateTime/abcd:DateText">
							<dc:date>
								<xsl:value-of select="abcd:Gathering/abcd:DateTime/abcd:DateText" />
							</dc:date>
						</xsl:if>

						<xsl:if
							test="abcd:Identifications/abcd:Identification/abcd:Date/abcd:DateText">
							<dc:date>
								<xsl:value-of
									select="abcd:Identifications/abcd:Identification/abcd:Date/abcd:DateText" />
							</dc:date>
						</xsl:if>


						<xsl:if test="abcd:KindOfUnit">
							<dc:description>
								<xsl:value-of select="abcd:KindOfUnit" />
							</dc:description>
						</xsl:if>

						<xsl:if
							test="abcd:SpecimenUnit/abcd:Preparations/abcd:Preparation/abcd:PreparationType">
							<dc:description>
								<xsl:value-of
									select="abcd:SpecimenUnit/abcd:Preparations/abcd:Preparation/abcd:PreparationType" />
							</dc:description>

						</xsl:if>

						<xsl:if test="abcd:SpecimenUnit/abcd:Marks/abcd:Mark/abcd:MarkText">
							<dc:description>
								<xsl:value-of
									select="abcd:SpecimenUnit/abcd:Marks/abcd:Mark/abcd:MarkText" />
							</dc:description>
						</xsl:if>

						<xsl:if test="abcd:Gathering/abcd:Notes">
							<dc:description>
								<xsl:value-of select="abcd:Gathering/abcd:Notes" />
							</dc:description>
						</xsl:if>

						<xsl:if test="abcd:Sex">
							<dc:description>
								<xsl:value-of select="abcd:Sex" />
							</dc:description>
						</xsl:if>

						<xsl:if test="abcd:Age">
							<dc:description>
								<xsl:value-of select="abcd:Age" />
							</dc:description>
						</xsl:if>

						<xsl:if test="abcd:Notes">
							<dc:description>
								<xsl:value-of select="abcd:Notes" />
							</dc:description>
						</xsl:if>

						<xsl:if
							test="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus">
							<dc:description>
								<xsl:value-of
									select="abcd:SpecimenUnit/abcd:NomenclaturalTypeDesignations/abcd:NomenclaturalTypeDesignation/abcd:TypeStatus" />
							</dc:description>
						</xsl:if>

						<xsl:if
							test="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PartOfOrganism">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PartOfOrganism" />
							</dc:description>
						</xsl:if>
						
						<xsl:if
							test="abcd:UnitExtension/efg:PalaeontologicalUnit/efg:PartOfOrganism">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/efg:PalaeontologicalUnit/efg:PartOfOrganism" />
							</dc:description>
						</xsl:if>

						<xsl:if
							test="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PreservationMode/abcd:PreservationModeText">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/abcd:PalaeontologicalUnit/abcd:PreservationMode/abcd:PreservationModeText" />
							</dc:description>
						</xsl:if>
						
						<xsl:if
							test="abcd:UnitExtension/efg:PalaeontologicalUnit/efg:PreservationMode/efg:PreservationModeText">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/efg:PalaeontologicalUnit/efg:PreservationMode/efg:PreservationModeText" />
							</dc:description>
						</xsl:if>
						


						<xsl:if
							test="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitWeight">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitWeight" />
							</dc:description>
						</xsl:if>
						<xsl:if
							test="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitWeight">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitWeight" />
							</dc:description>
						</xsl:if>

						<xsl:if
							test="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Pseudomorph">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Pseudomorph" />
							</dc:description>
						</xsl:if>
						
						<xsl:if
							test="abcd:UnitExtension/efg:MineralogicalUnit/efg:CrystalForm/efg:Pseudomorph">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/efg:MineralogicalUnit/efg:CrystalForm/efg:Pseudomorph" />
							</dc:description>
						</xsl:if>
						
						<xsl:if
							test="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Twinning">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/abcd:MineralogicalUnit/abcd:CrystalForm/abcd:Twinning" />
							</dc:description>
						</xsl:if>
						
						<xsl:if
							test="abcd:UnitExtension/efg:MineralogicalUnit/efg:CrystalForm/efg:Twinning">
							<dc:description>
								<xsl:value-of
									select="abcd:UnitExtension/efg:MineralogicalUnit/efg:CrystalForm/efg:Twinning" />
							</dc:description>
						</xsl:if>
					</edm:ProvidedCHO>


					<xsl:if
						test="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision">

						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>
					
					
					<xsl:if
						test="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision">

						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>

					<xsl:if
						test="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>


					<xsl:if
						test="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronoStratigraphicDivision" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:ChronostratigraphicAttributions/abcd:ChronostratigraphicAttribution/abcd:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName">
						<dcterms:temporal>
							<xsl:value-of
								select="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:ChronostratigraphicAttributions/efg:ChronostratigraphicAttribution/efg:ChronostratigraphicName" />
						</dcterms:temporal>
					</xsl:if>
					
					<xsl:if test="abcd:UnitReferences/abcd:UnitReference/abcd:TitleCitation">
						<dcterms:isReferencedBy>
							<xsl:value-of
								select="abcd:UnitReferences/abcd:UnitReference/abcd:TitleCitation" />
						</dcterms:isReferencedBy>
					</xsl:if>

					<xsl:if test="abcd:UnitReferences/abcd:UnitReference/abcd:URI">
						<dcterms:isReferencedBy>
							<xsl:value-of select="abcd:UnitReferences/abcd:UnitReference/abcd:URI" />
						</dcterms:isReferencedBy>
					</xsl:if>

					<xsl:if
						test="abcd:UnitReferences/abcd:UnitReference/abcd:CitationDetail">
						<dcterms:isReferencedBy>
							<xsl:value-of
								select="abcd:UnitReferences/abcd:UnitReference/abcd:CitationDetail" />
						</dcterms:isReferencedBy>
					</xsl:if>


					<xsl:if
						test="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member">

						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:EarthScienceSpecimen/abcd:UnitStratigraphicDetermination/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member" />
						</dcterms:medium>
					</xsl:if>

					<xsl:if
						test="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member">

						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/efg:EarthScienceSpecimen/efg:UnitStratigraphicDetermination/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Formation">

						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Formation" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Formation">

						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Formation" />
						</dcterms:medium>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:UnitHostRock/abcd:HostRockStratigraphy/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/efg:UnitHostRock/efg:HostRockStratigraphy/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Formation">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Formation" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Formation">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Formation" />
						</dcterms:medium>
					</xsl:if>
					<xsl:if
						test="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/abcd:AllocthonousMaterial/abcd:OriginalStratigraphy/abcd:StratigraphicAttributions/abcd:LithostratigraphicAttributions/abcd:LithostratigraphicAttribution/abcd:Member" />
						</dcterms:medium>
					</xsl:if>
					
					<xsl:if
						test="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member">
						<dcterms:medium>
							<xsl:value-of
								select="abcd:UnitExtension/efg:AllocthonousMaterial/efg:OriginalStratigraphy/efg:StratigraphicAttributions/efg:LithostratigraphicAttributions/efg:LithostratigraphicAttribution/efg:Member" />
						</dcterms:medium>
					</xsl:if>

					<xsl:for-each select="abcd:MultiMediaObjects/abcd:MultiMediaObject">


						<edm:WebResource>
							<xsl:attribute name="rdf:about">
				 		    	<xsl:value-of select="abcd:FileURI" />
	  						</xsl:attribute>


							<xsl:if test="abcd:Comment">
								<dc:description>
									<xsl:value-of select="abcd:Comment" />
								</dc:description>
							</xsl:if>

							<dc:format>
								<xsl:value-of select="abcd:Format" />
							</dc:format>

							<edm:rights>
								<xsl:attribute name="rdf:resource">
				 		    			<xsl:value-of
									select="abcd:IPR/abcd:Licenses/abcd:License/abcd:URI" />
	  							</xsl:attribute>

							</edm:rights>

							<xsl:if test="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:Text">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:Text" />
								</dc:rights>
							</xsl:if>

							<xsl:if
								test="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:Details">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:Details" />
								</dc:rights>
							</xsl:if>

							<xsl:if test="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:URI">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:IPRDeclarations/abcd:IPRDeclaration/abcd:URI" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Copyrights/abcd:Copyright/abcd:Text">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Copyrights/abcd:Copyright/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Copyrights/abcd:Copyright/abcd:Details">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Copyrights/abcd:Copyright/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Copyrights/abcd:Copyright/abcd:URI">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Copyrights/abcd:Copyright/abcd:URI" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Licenses/abcd:License/abcd:Text">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Licenses/abcd:License/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Licenses/abcd:License/abcd:Details">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Licenses/abcd:License/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:Text">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if
								test="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:Details">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:URI">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:TermsOfUseStatements/abcd:TermsOfUse/abcd:URI" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:Text">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:Details">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:URI">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Disclaimers/abcd:Disclaimer/abcd:URI" />
								</dc:rights>
							</xsl:if>
							<xsl:if
								test="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:Text">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if
								test="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:Details">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:URI">
								<dc:rights>
									<xsl:value-of
										select="IPR/abcd:Acknowledgements/abcd:Acknowledgement/abcd:URI" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Citations/abcd:Citation/abcd:Text">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Citations/abcd:Citation/abcd:Text" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Citations/abcd:Citation/abcd:Details">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Citations/abcd:Citation/abcd:Details" />
								</dc:rights>
							</xsl:if>
							<xsl:if test="IPR/abcd:Citations/abcd:Citation/abcd:URI">
								<dc:rights>
									<xsl:value-of select="IPR/abcd:Citations/abcd:Citation/abcd:URI" />
								</dc:rights>
							</xsl:if>






							<europeana:isShownAt>
								<xsl:value-of select="abcd:ProductURI" />
							</europeana:isShownAt>

							<europeana:isShownBy>
								<xsl:value-of select="abcd:FileURI" />
							</europeana:isShownBy>

							<europeana:rights>
								<xsl:value-of select="abcd:IPR/abcd:Licenses/abcd:License/abcd:URI" />
							</europeana:rights>
							<europeana:type>
								<xsl:value-of select="abcd:Format" />
							</europeana:type>

						</edm:WebResource>

					</xsl:for-each>

				</rdf:RDF>

			</xsl:for-each>
		</europeana:metadata>
	</xsl:template>
</xsl:stylesheet>
