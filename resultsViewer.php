<html>

<head>
<link rel="stylesheet" href="http://codemirror.net/lib/codemirror.css">
<script src="codemirror-4.12/lib/codemirror.js"></script>
<script src="codemirror-4.12/addon/edit/matchbrackets.js"></script>
<script src="codemirror-4.12/addon/edit/continuecomment.js"></script>
<script src="codemirror-4.12/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="codemirror-4.12/mode/xml/xml.js"></script>
<link rel="stylesheet" href="codemirror-4.12/theme/3024-day.css">
<link rel="stylesheet" href="codemirror-4.12/theme/eclipse.css">


<!-- Bootstrap core CSS -->
<link href="bootstrap-3.3.1-dist/dist/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="bootstrap-3.3.1-dist/dist/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/assets/css/docs.css"
	rel="stylesheet">
<link
	href="bootstrap-3.3.1-dist/dist/assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/css/bootstrap.min.css"
	rel="stylesheet">


<script type='text/javascript'>//<![CDATA[ 

window.onload = function () {
  
    var readOnlyCodeMirror = CodeMirror.fromTextArea(document.getElementById('transXML'), {
        mode: "xml",
        theme: "default",
        lineNumbers: true,
        readOnly: true
    });  

    readOnlyCodeMirror.setSize(500, 600);
  
    var editableCodeMirror = CodeMirror.fromTextArea(document.getElementById('orgXML'), {
        mode: "xml",
        theme: "default",
        lineNumbers: true,
        readOnly: true
        
    });
    editableCodeMirror.setSize(500, 600);

};

//]]>  

</script>

<?php include 'menu.php' ?>;

</head>

<body>
	<div class="container">
		<div class="page-header">
			<h1>XSLT-based Transformer</h1>
		</div>
		<p class="lead">
Transformation Results

<?php

$orgXMLFile = file_get_contents ( 'examples/ABCDEx.xml' );
$transXMLFile = file_get_contents ( 'examples/ABCDEx.xml' );
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

</body>
</html>
