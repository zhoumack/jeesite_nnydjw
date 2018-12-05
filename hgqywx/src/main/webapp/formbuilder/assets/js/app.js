define([
       "jquery" , "underscore" , "backbone"
       , "collections/snippets" , "collections/my-form-snippets"
       , "views/tab" , "views/my-form"
       , "text!data/constom.json","text!data/component.json", "text!data/input.json", "text!data/radio.json", "text!data/select.json", "text!data/buttons.json"
       , "text!templates/app/render.html",  "text!templates/app/about.html", 
], function(
  $, _, Backbone
  , SnippetsCollection, MyFormSnippetsCollection
  , TabView, MyFormView
  ,constomJSON,componentJSON, inputJSON, radioJSON, selectJSON, buttonsJSON
  , renderTab, aboutTab
){
  return {
    initialize: function(){

	  new TabView({
        title: "Constom"
        , collection: new SnippetsCollection(JSON.parse(constomJSON))
      });
	  new TabView({
	    title: "Component"
	    , collection: new SnippetsCollection(JSON.parse(componentJSON))
	  });
	  
      //Bootstrap tabs from json.
//      new TabView({
//        title: "Input"
//        , collection: new SnippetsCollection(JSON.parse(inputJSON))
//      });
      new TabView({
        title: "Radios / Checkboxes"
        , collection: new SnippetsCollection(JSON.parse(radioJSON))
      });
//      new TabView({
//        title: "Select"
//        , collection: new SnippetsCollection(JSON.parse(selectJSON))
//      });
//      new TabView({
//        title: "Buttons"
//        , collection: new SnippetsCollection(JSON.parse(buttonsJSON))
//      });
      new TabView({
        title: "Rendered"
        , content: renderTab
      });
      new TabView({
        title: "About"
        , content: aboutTab
      });

      //Make the first tab active!
      $("#components .tab-pane").first().addClass("active");
      $("#formtabs li").first().addClass("active");
      
     
      // Bootstrap "My Form" with 'Form Name' snippet.
      var initdata = [
          { "title" : "Form Name"
              , "fields": {
                "name" : {
                  "label"   : "Form Name"
                  , "type"  : "input"
                  , "value" : "Form Name"
                }
              }
            }
          ];
      var formid = $("#formid").val(); //如果id不空表示是修改
      if (formid) {
    	  var jstring = $("#formJsonObject").val();
    	  if (jstring) {
    		  initdata = JSON.parse(jstring);
		  }
    	  
//    	  console.log(sss);
	  }
      new MyFormView({
        title: "Original"
        , collection: new MyFormSnippetsCollection(initdata)
      });
    }
  }
});
