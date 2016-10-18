<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}


</style>
</head>


<body>
<div class="container" style="margin-top: 20px;">
    <div class="row">
        
        <div class="col-lg-6 col-sm-6 col-12">
            <div class="jumbotron">
                <h1>Bootstrap File Input Demo</h1>
            </div>
        </div>
        
        <div class="col-lg-6 col-sm-6 col-12">
            <h4>Standard Button</h4>
            <label class="btn btn-primary">
                Browse&hellip; <input type="file" style="display: none;">
            </label>
        </div>
        <div class="col-lg-6 col-sm-6 col-12">
            <h4>Block-level Button
            <label class="btn btn-block btn-primary">
                Browse&hellip; <input type="file" style="display: none;">
            </label>
        </div>
        
        <div class="col-lg-6 col-sm-6 col-12">
            <h4>Button Groups</h4>
            <div class="btn-group">
                <a href="#" class="btn btn-default">Action 1</a>
                <a href="#" class="btn btn-default">Action 2</a>
                <label class="btn btn-primary">
                    Browse&hellip; <input type="file" style="display: none;">
                </label>
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 col-12">
            <h4>Input Groups</h4>
            <div class="input-group">
                <label class="input-group-btn">
                    <span class="btn btn-primary">
                        Browse&hellip; <input type="file" style="display: none;" multiple>
                    </span>
                </label>
                <input type="text" class="form-control" readonly>
            </div>
            <span class="help-block">
                Try selecting one or more files and watch the feedback
            </span>
        </div>
        
    </div>
</div>
</body>
<script type="text/javascript">
$(function() {

	  // We can attach the `fileselect` event to all file inputs on the page
	  $(document).on('change', ':file', function() {
	    var input = $(this),
	        numFiles = input.get(0).files ? input.get(0).files.length : 1,
	        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	    input.trigger('fileselect', [numFiles, label]);
	  });

	  // We can watch for our custom `fileselect` event like this
	  $(document).ready( function() {
	      $(':file').on('fileselect', function(event, numFiles, label) {

	          var input = $(this).parents('.input-group').find(':text'),
	              log = numFiles > 1 ? numFiles + ' files selected' : label;

	          if( input.length ) {
	              input.val(log);
	          } else {
	              if( log ) alert(log);
	          }

	      });
	  });
	  
	});

</script>

</html>

