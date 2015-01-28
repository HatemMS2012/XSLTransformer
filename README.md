# XSLTransformer
Simple PHP application for mapping XML files from one schema to another using XSLT.
To use the application, deploy it in your server root directory and type http://localhost/MyApps/abcd2edmPHP/ in your browser. 

At the home page you can upload your "XSLT" transformation schema and your source XML file (the one you'd like to conver) as shown in the screenshot below:

![Screenshot of the homepage](screenshots/home.png)

By clicking the convert button the source XML is converted and a screen apears where you can download/view the converted file in addition to the source XML and XSLT file (See below):


![Conversion results](screenshots/results.png)

To test the application, sample XML and XSLT files are provied in the [Examples](examples/) folder.
