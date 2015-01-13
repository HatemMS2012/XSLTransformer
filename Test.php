<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<?php include("menu.php"); ?> 
<?php

//Example string with multiple rows
$welcome_msg =<<< Welcome
Welcome to my first code in PHP \n
I am keen to learn this language
Welcome;
		
//Print out the string. Not that the dot is used for concatenation
echo $welcome_msg."</br>";

/* Here is the date function.
 * and also an exmaple of multiple comments
 */
$today = date("l-F-Y");
$today_str = "<h5> Today is: ".$today."</h5>";
echo  $today_str;


#Transform given XML file using XSL
#1-Load the xml file
$xml = new DOMDocument;
$xml->load('cermineExample.xml');

#2-Load the XSLT scheme
$xsl = new DOMDocument;
$xsl->load('MappingMapTosolrinput.xslt');

#3-Create the XSTL processor
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

#4-Apply the transformation
$final_xml = $proc->transformToXML($xml);
$xml_2 = new SimpleXMLElement($final_xml);

#echo $xml_2->asXML();

#Example: Trasfroming CERMINE XML file into Solr XML and printing out the results

#Display article title
$article_title = $xml_2->xpath('/add/doc/field[@name="article-title"]/text()');
list( , $title) = each($article_title);

echo "<h1>";
echo $title;
echo "</h1><p>";

#Display authors
$i= 1 ;
$article_authors = $xml_2->xpath('/add/doc/field[@name="author"]/text()');
while(list( , $author) = each($article_authors)) {

	echo $author;
	if ($i == 6) {
		break;
	}
	$i = $i+1;
	echo ", ";
	
}


#Display the abstract
$article_abstract = $xml_2->xpath('/add/doc/field[@name="abstract"]/text()');
list( , $abstract) = each($article_abstract);

echo "<h2> Abstract </h2>";
echo "<i>";
echo $abstract;
echo "</i><p>";

echo "<h2> References</h2>";

$result = $xml_2->xpath('/add/doc/field[@name="reference"]/text()');
echo "<ol>";
while(list( , $node) = each($result)) {
	
	echo "<li>";
	#echo $node->asXML();
	echo $node;
	echo "</li>";
}
echo "<ol>";
?>
</body>
</html>