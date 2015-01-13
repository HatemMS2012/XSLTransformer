<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ABCD to EDM</title>
<!-- Bootstrap core CSS -->


<link href="bootstrap-3.3.1-dist/dist/assets/css/bootstrap.css"	rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/assets/css/docs.css" 	rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
<link href="bootstrap-3.3.1-dist/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!-- Fixed navbar -->
    <?php include 'menu.php' ?>;
    <!-- Begin page content -->
	<div class="container">
		<div class="page-header">
			<h1>XSLT-based Transformer</h1>
		</div>
		<p class="lead">
			This simple webpage can be used to convert an XML from one schema to anther schema based 
			on a given XSLT transfomration schema 
			
		<form class="form-horizontal" action="uploader.php" method="post" enctype="multipart/form-data">
			<div class="control-group">
				<label class="control-label" for="uploadedXSLTFile">Upload XSLT</label>
				<div class="controls">
					<input type="file" id="uploadedXSLTFile" name="uploadedXSLTFile" size="150" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="uploadedfile">Upload XML</label>
				<div class="controls">
					<input type="file" id="uploadedfile" name="uploadedfile" size="150" />
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input class="btn btn-primary" type="submit" value="Convert">
				</div>
			</div>
		</form>
	</div>
</body>
</html>


