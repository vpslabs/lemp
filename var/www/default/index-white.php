<!DOCTYPE html>
<html>
<head>
<title><?php echo $_SERVER['HTTP_HOST']; ?></title>
<link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<style>
    body {
        font-family: 'Open Sans', sans-serif;
        background: #fff;
        color: #000;
    }
    html,body {
        height: 100%;
    }
    body {
        display: table; 
        margin: 0 auto;
    }
    .container {  
        height: 100%;
        display: table-cell;   
        vertical-align: middle;    
    }
    .cent {
         height: 50px;
        width: 100%;
        background-color: none;      
     }
</style>
</head>
<body>
<div class="container">
    <div class="cent"><h1><?php echo $_SERVER['HTTP_HOST']; ?></h1></div>
</div>
</body>
</html>
