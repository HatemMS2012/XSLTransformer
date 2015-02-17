<html>
<head>
<title>
ABCD to EDM Transformation Results
</title>
<link href="bootstrap-3.3.1-dist/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<script src="codemirror-4.12/lib/codemirror.js"></script>
<script src="codemirror-4.12/addon/edit/matchbrackets.js"></script>
<script src="codemirror-4.12/addon/edit/continuecomment.js"></script>
<script src="codemirror-4.12/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="codemirror-4.12/mode/xml/xml.js"></script>
<link rel="stylesheet" href="codemirror-4.12/theme/3024-day.css">
<link rel="stylesheet" href="codemirror-4.12/theme/eclipse.css">

<script type='text/javascript'>//<![CDATA[ 

window.onload = function () {
  
    var readOnlyCodeMirror = CodeMirror.fromTextArea(document.getElementById('transXML'), {
        mode: "xml",
        theme: "default",
        lineNumbers: true,
        readOnly: true
    });  

    readOnlyCodeMirror.setSize(560, 600);
  
    var editableCodeMirror = CodeMirror.fromTextArea(document.getElementById('orgXML'), {
        mode: "xml",
        theme: "default",
        lineNumbers: true,
        readOnly: true
        
    });
    editableCodeMirror.setSize(560, 600);

};

//]]>  

</script>


<?php include 'menu.php' ?>
</head>
<body>
</p>
</p>
</p>
<div class="container">
  <div class="page-header">

        <h1>Transformation Results</h1>
   </div>
<?php 
include("ABCD2EDM.php");
// Where the file is going to be placed
$uploaded_files_dir = "uploads/";
$uploaded_xslt_files_dir = "xslts/";

$target_xml_file_path = $uploaded_files_dir . basename( $_FILES['uploadedfile']['name']);
$target_xsl_file_path = $uploaded_xslt_files_dir . basename( $_FILES['uploadedXSLTFile']['name']);

//If an XSLT file is selected from the drop down menu ignore any uploaded files
$successfullUpload = false;

if( $_POST['selectedXSLTFile'] != "no"){
		
	$target_xsl_file_path = $_POST['selectedXSLTFile'];
	$successfullXSLTUpload = true;
}
//Otherwiese read the uploaded XSLT file and store it in the xslts folder
else{

	$successfullXSLTUpload = move_uploaded_file($_FILES['uploadedXSLTFile']['tmp_name'], $target_xsl_file_path);
}

//The name of the converted XMLfile
$target_converted = "output/". $_FILES['uploadedfile']['name']."_converted.xml";



//echo $target_xml_file_path."</br>";
$xml_file_type = $_FILES['uploadedfile']['type'];
$xsl_file_type = $_FILES['uploadedXSLTFile']['type'];

if($xml_file_type == "text/xml" && $xsl_file_type="text/xml"){
	
	if($successfullXSLTUpload  && move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_xml_file_path)) {
		//echo  "<p class=\"lead\"> INFO:";
		
				  
			  convertABCD2EDMAndWriteToFileUsingXSLTFile($target_xsl_file_path,$target_xml_file_path,$target_converted);


			  $orgXMLFile = file_get_contents ($target_xml_file_path);
			  $transXMLFile = file_get_contents ( $target_converted );

			  ?>
			  		
			  		<form class="form-inline" role="form">
			  			<div class="form-group">
			  				<label for="transXML">Transormed XML</label>
			  				<textarea class="form-control" id="transXML" name="transXML"><?php echo $transXMLFile;?></textarea>
			  			</div>
			  			<div class="form-group">
			  				<label for="orgXML">Original XML</label>
			  				<textarea class="form-control" id="orgXML" name="orgXML"><?php echo $orgXMLFile;?></textarea>
			  
			  			</div>
			  		</form>
			  
			  <?php 
			  echo "<div class=\"panel panel-default\">
		  	  <div class=\"panel-heading\">
    		  <h3 class=\"panel-title\">Download Section</h3>
  			  </div>
		   	  <div class=\"panel-body\">
		 	  The used <a target=\"_blank\" href= \"".$target_xsl_file_path."\">XSLT</a> file </br>
			  The orginal <a target=\"_blank\" href= \"".$target_xml_file_path."\"> XML</a> file </br>
			  The transformed <a target=\"_blank\" href=\"".$target_converted."\">XML</a> file</div></div>";
			  
			  
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
