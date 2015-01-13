<?php
$abcd_2_edm_xsl_path = 'xml/MappingMapToEDM-1.0.xslt';

#Transform given XML file using a predetermined XSLT file
function convertABCD2EDM($abcd_file){
	
	$xml_2 = convertABCD2EDMUsingXLSFile($GLOBALS['abcd_2_edm_xsl_path'], $abcd_file);
	return   $xml_2->asXML();
}

#Transform given XML file using XSLT file as a parameter
function convertABCD2EDMUsingXLSFile($abcd_xls_file, $abcd_file){
	#1-Load the xml file
	$xml = new DOMDocument;
	$xml->load($abcd_file);
	#2-Load the XSLT scheme
	$xsl = new DOMDocument;
	$xsl->load($abcd_xls_file);
	#3-Create the XSTL processor
	$proc = new XSLTProcessor;
	$proc->importStyleSheet($xsl);

	#4-Apply the transformation
	$final_xml = $proc->transformToXML($xml);
	$xml_2 = new SimpleXMLElement($final_xml);

	return   $xml_2->asXML();
}

#Transform given XML file using a predefined XSLT and write the result to a file
function convertABCD2EDMAndWriteToFile($abcd_file, $edm_res_file){
	
	#Convert
	$xml_2 = convertABCD2EDM($abcd_file);

	#Write the results of the transformation into a file
	$fh = fopen($edm_res_file, 'w') or die("can't open file");
	fwrite($fh, $xml_2);
	fclose($fh);

}

#Transform given XML file using XSLT file as a parameter and write the result to a file
function convertABCD2EDMAndWriteToFileUsingXSLTFile($abcd_xsl_file, $abcd_xml_file, $edm_res_file){

	#Convert
	$xml_2 = convertABCD2EDMUsingXLSFile($abcd_xsl_file,$abcd_xml_file);

	#Write the results of the transformation into a file
	$fh = fopen($edm_res_file, 'w') or die("can't open file");
	fwrite($fh, $xml_2);
	fclose($fh);

}


		
// #Transform given XML file using XSL
// #1-Load the xml file
// $xml = new DOMDocument;
// $xml->load('xml/complete_ABCD_file_2.06_me.xml');

// #2-Load the XSLT scheme
// $xsl = new DOMDocument;
// $xsl->load('xml/MappingMapToEDM-1.0.xslt');

// #3-Create the XSTL processor
// $proc = new XSLTProcessor;
// $proc->importStyleSheet($xsl);

// #4-Apply the transformation
// $final_xml = $proc->transformToXML($xml);
// $xml_2 = new SimpleXMLElement($final_xml);

// echo $xml_2->asXML();
?>