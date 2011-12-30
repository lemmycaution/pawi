//= require ./ace/ace
//= require ./ace/mode-html
//= require ./ace/theme-pawi

$(document).ready(function(){


	var t = $("#pawi_page_body").length > 0 ? "page" : 
					$("#pawi_widget_body").length > 0 ? "widget" : false;
	
	if(t){
	
		$("#pawi_"+t+"_body_input").append($("<div id=\"pawi_"+t+"_body_ace\"></div>"));
		$("#pawi_"+t+"_body").hide();
	
		window.editor = ace.edit("pawi_"+t+"_body_ace");

		var HtmlMode = require("ace/mode/html").Mode;
		editor.getSession().setMode(new HtmlMode());


		editor.setTheme("ace/theme/pawi");
	
		editor.getSession().setValue($("#pawi_"+t+"_body").val());
	
		editor.getSession().on('change', function(){
		  $("#pawi_"+t+"_body").val(editor.getSession().getValue());
		});

		editor.renderer.setHScrollBarAlwaysVisible(false);
		
	}
});