<html>
<head>
<title>
ABCD to EDM Transformation Results
</title>
<link href="bootstrap-3.3.1-dist/dist/css/bootstrap.min.css" rel="stylesheet">
<?php include 'menu.php' ?>;
</head>
<body>
<div class="container">
  <div class="page-header">
        <h1>Transformation Results</h1>
   </div>
<?php 
include("ABCD2EDM.php");
// Where the file is going to be placed
$uploaded_files_dir = "uploads/";
$target_xml_file_path = $uploaded_files_dir . basename( $_FILES['uploadedfile']['name']);

$target_xsl_file_path = $uploaded_files_dir . basename( $_FILES['uploadedXSLTFile']['name']);


$target_converted = "output/". $_FILES['uploadedfile']['name']."_EDM.xml";



//echo $target_xml_file_path."</br>";
$xml_file_type = $_FILES['uploadedfile']['type'];
$xsl_file_type = $_FILES['uploadedXSLTFile']['type'];

if( $xml_file_type == "text/xml" && $xsl_file_type="text/xml"){
	
	if(move_uploaded_file($_FILES['uploadedXSLTFile']['tmp_name'], $target_xsl_file_path) && move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_xml_file_path)) {
		//echo  "<p class=\"lead\"> INFO:";
		echo "<div class=\"panel panel-default\">
		  	  <div class=\"panel-heading\">
    		  <h3 class=\"panel-title\">Transformation Information</h3>
  			  </div>
		   	  <div class=\"panel-body\">
		 	  Your <a target=\"_blank\" href= \"".$target_xsl_file_path."\"> xslt file </a> has been uploaded successfully </br>
			  Your <a target=\"_blank\" href= \"".$target_xml_file_path."\"> xml file </a> has been uploaded successfully </br>
			  click <a target=\"_blank\" href=\"".$target_converted."\">here</a> to see the converted file</div></div>";
	
			  convertABCD2EDMAndWriteToFileUsingXSLTFile($target_xsl_file_path,$target_xml_file_path,$target_converted);

		
	} else{
		echo "<span class=\"label label-danger\">There was an error uploading the file, please try again!</span>";
	}
}
else{
	echo "<h3> <span class=\"label label-danger\">File type is not supported: <b>".$xml_file_type."</span> </b> </h3>";
}

?>
</div>
</body>
</html>
