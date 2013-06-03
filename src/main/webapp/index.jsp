<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
	<title></title>
	<link href="resources/css/screen.css" media="screen" rel="stylesheet" type="text/css" />   
	<link href="resources/css/SanddragonWidget.print.css" rel="stylesheet" type="text/css" media="print"  />
	<link href="resources/css/SanddragonWidget.css" media="screen" rel="stylesheet" type="text/css" />   
	<script type="text/javascript" src="resources/js/drag.js">
	    /**************************************************
	    * dom-drag.js
	    * 09.25.2001
	    * www.youngpup.net
	    * Script featured on Dynamic Drive (http://www.dynamicdrive.com) 12.08.2005
	    * License terms found here - http://www.dynamicdrive.com/notice.htm
	    **************************************************/
	</script>
	<script type="text/javascript" src="resources/js/fade.js"></script>
	<script type="text/javascript" src="resources/js/spin.js"></script>
	<script type="text/javascript" src="resources/js/SanddragonWidget.js"></script>
	<script type="text/javascript" src="resources/js/OpenSeadragon.debug.js"></script>
	        
    <script type="text/javascript">
        var ImageServer = "";
        var ImageMetadataServer = "";
        var SanddragonWidgetServer = "";
        var screenWidth = 0;
        var screenHeight = 0;

        function maximiseWindow() {
            top.window.moveTo(0, 0);
            top.window.resizeTo(screen.width, screen.height);

            if (document.all)
            { top.window.resizeTo(screen.availWidth, screen.availHeight); }
            else if (document.layers || document.getElementById) {
                if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
                    top.window.outerHeight = top.screen.availHeight;
                    top.window.outerWidth = top.screen.availWidth;
                }
            }
        }

        function setScreenSize() {
            var verticalMargin = 3;
            var horizontalMargin = 5; // 30;

            if (typeof (window.innerWidth) == 'number') {
                //Non-IE
                screenWidth = window.innerWidth - horizontalMargin;
                screenHeight = window.innerHeight - verticalMargin;
            } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
                //IE 6+ in 'standards compliant mode'
                screenWidth = document.documentElement.clientWidth - horizontalMargin;
                screenHeight = document.documentElement.clientHeight - verticalMargin;
            } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
                //IE 4 compatible
                screenWidth = document.body.clientWidth - horizontalMargin;
                screenHeight = document.body.clientHeight - verticalMargin;
            }
        }

        if (!Array.prototype.indexOf) {
            Array.prototype.indexOf = function (elt) {
                var len = this.length;

                var from = Number(arguments[1]) || 0;
                from = (from < 0)
                ? Math.ceil(from)
                : Math.floor(from);
                if (from < 0)
                    from += len;

                for (; from < len; from++) {
                    if (from in this &&
                        this[from] === elt)
                        return from;
                }
                return -1;
            };
        }

        var Item = null;
        var view1 = null;
        var view2 = null;
        var page1 = null;
        var page2 = null;
        var rotate1 = null;
        var rotate2 = null;

        var NumViews = 1;
        var AsBook = true;

        this.init = function () {
            ImageServer = document.getElementById("ImageServer").value;
            ImageMetadataServer = document.getElementById("ImageMetadataServer").value;
            SanddragonWidgetServer = document.getElementById("SanddragonWidgetServer").value;
            setScreenSize();

            document.getElementById("view1").style.width = document.getElementById("view2").style.width = screenWidth + "px";
            document.getElementById("view1").style.height = document.getElementById("view2").style.height = screenHeight + "px";

            page1 = document.getElementById("Page1").value;
            page2 = document.getElementById("Page2").value;

            rotate1 = document.getElementById("Rotate1").value;
            rotate2 = document.getElementById("Rotate2").value;

            NumViews = parseInt(document.getElementById("NumViews").value);

            view1 = new SanddragonWidget("view1", document.getElementById("Region1").value, document.getElementById("ParentView").value, document.getElementById("Landscape").value);
            view1.init("left", NumViews);

            if (document.getElementById("Maximise").value == "true") {
                maximiseWindow();
            }
            else {
                view2 = new SanddragonWidget("view2", document.getElementById("Region2").value, document.getElementById("ParentView").value);
                view2.init("right", NumViews);
            }
            setViews(parseInt(document.getElementById("Width1").value), parseInt(document.getElementById("Height1").value), parseInt(document.getElementById("JP2Levels1").value), document.getElementById("Rotate1").value,
                    parseInt(document.getElementById("Width2").value), parseInt(document.getElementById("Height2").value), parseInt(document.getElementById("JP2Levels2").value), document.getElementById("Rotate2").value);
        }

        function setViews(width1, height1, jp2levels1, rotate1, width2, height2, jp2levels2, rotate2) {
            if (NumViews == 2) {
                document.getElementById("view1").style.width = document.getElementById("view2").style.width = screenWidth / 2 - 4 + "px";
            }
            else {
                document.getElementById("view1").style.width = document.getElementById("view2").style.width = screenWidth + "px";
                document.getElementById("view2").style.display = "none";
            }


            if (page1 == "") {
                view1.updateImage(null);
            }
            else {
                view1.updateImage(page1,
                    rotate1,
                    width1,
                    height1,
                    jp2levels1);
            }

            if (NumViews == 2) {
                document.getElementById("view2").style.display = "block";
                if (page2 == "") {
                    view2.updateImage(null);
                }
                else {
                    view2.updateImage(page2,
                    rotate2,
                    width2,
                    height2,
                    jp2levels2);
                }
            }
        }

        Seadragon.Utils.addEvent(window, "load", init);
    </script>    
    <style type="text/css">
        #pages
        {
            clear:both;
            position:relative;
        }
        #view1
        {
            float:left;
            width: 100px;
            height: 100px;
            background-color: black;
            border: 1px solid black;
            color: white;   /* for error messages, etc. */
        }
        #view2
        {
            float:left;
            margin-left:5px;
            width: 100px;
            height: 100px;
            background-color: black;
            border: 1px solid black;
            color: white;   /* for error messages, etc. */
            display:none;
        }            
        #download1
        {
            float:left;
        }
        #download2
        {
            display:none;
            float:left;
        }
    </style>    
</head>

<body class="document">
    <form id="form1">
        <input type="hidden" id="ImageServer" value="${initParam.ImageServer}" />
        <input type="hidden" id="ImageMetadataServer" value="${initParam.ImageMetadataServer}" />
        <input type="hidden" id="SanddragonWidgetServer" value="${initParam.SanddragonWidgetServer}" />
        <input type="hidden" id="NumViews" value="${empty param.NumViews ? 1 : param.NumViews}" />
        <input type="hidden" id="ShowMetadata" />
        <input type="hidden" id="OrderViewType" value="p" />  
        <input type="hidden" id="Maximise" value="${empty param.maximise ? false : param.maximise}" />  
        <input type="hidden" id="Landscape" value="${param.landscape}" />  
        <input type="hidden" id="Region1" value="${param.region1}" />  
        <input type="hidden" id="Region2" value="${param.region2}" />  
        <input type="hidden" id="ContentHeight" value="${param.contentheight}" />  
        <input type="hidden" id="AspectRatio" value="${param.aspectratio}" />  
        <input type="hidden" id="ParentView" value="${param.parentview}" />  
        <input type="hidden" id="ImageSwitch" value="${param.imageswitch}" />  
        <input type="hidden" id="Page1" value="${empty param.page1 ? initParam.view1 : param.page1}" />  
        <input type="hidden" id="Page2" value="${empty param.page2 ? initParam.view2 : param.page2}" />  
        <input type="hidden" id="Rotate1" value="${empty param.rotate1 ? 0 : param.rotate1}" />  
        <input type="hidden" id="Rotate2" value="${empty param.rotate2 ? 0 : param.rotate2}" />  
        <input type="hidden" id="Width1" value="${param.width1}" />  
        <input type="hidden" id="Height1" value="${param.height1}" />  
        <input type="hidden" id="JP2Levels1" value="${param.jp2Levels1}" />  
        <input type="hidden" id="Width2" value="${param.width2}" />  
        <input type="hidden" id="Height2" value="${param.height2}" />  
        <input type="hidden" id="JP2Levels2" value="${param.jp2Levels2}" />  
	    <div id="pages">
	        <div class="bl-viewer" id="view1">
	        </div>
	        <div class="bl-viewer" id="view2">
	        </div>
	    </div>
    </form>
</body>
</html>
