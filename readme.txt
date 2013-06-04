//
// Overview
//
For an overview of this project please visit http://sanddragon.bl.uk

//
// SanddragonWidget Installation
//

1. Ensure that SanddragonImageService website has been installed and note down the url address.
2. Update the following values in the web.xml
	- ImageServer - http://[SanddragonImageService server]/[SanddragonImageService website]
	- ImageMetadataServer - http://[SanddragonImageService server]/[SanddragonImageService website]
	- SanddragonWidgetServer - http://[SanddragonWidget server]/[SanddragonWidget website]/
	- View1 - [Default JP2 to show, filename without the file extension]
3. Build the SanddragonWidget application using Java 7 and Maven. Deploy to Tomcat.
4. Note that if you install the SanddragonWidget on a different server from the SanddragonImageService you will get 
	cross site scripting dialog, to avoid this install the SanddragonWidget on the same server as the SanddragonImageService.

//
// Example Usage
//

If you want to view JP2 other than the default 
http://[SanddragonWidget server]/[SanddragonWidget website]/?page1=[JP2 filename without the file extension]

If you want to view 2 images side by side -
http://[SanddragonWidget server]/[SanddragonWidget website]/?page1=[JP2 filename without the file extension]&page2=[JP2 filename without the file extension]&numviews=2