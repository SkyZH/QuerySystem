<!DOCTYPE html>
<html>

<head>
    <title>Query</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/roboto.min.css" rel="stylesheet">
    <link href="dist/css/material.min.css" rel="stylesheet">
    <link href="dist/css/ripples.min.css" rel="stylesheet">
    <link href="dist/css/jquery.dropdown.css" rel="stylesheet">


    <link href="main.css" rel="stylesheet">
    <link href="material-design.css" rel="stylesheet">



    <script src="dist/js/jquery.min.js"></script>
    <script src="main.js"></script>

    <script src="dist/js/jquery.nouislider.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/material.min.js"></script>
    <script src="dist/js/ripples.min.js"></script>
    <script src="dist/js/jquery.dropdown.js"></script>

    <script src="material-design.js"></script>

</head>

<body>

    <div class="header-panel shadow-z-2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-3">
                    <h1>Query System</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid main" style="overflow: visible;">
        <div class="row" style="overflow: visible;">
            <nav class="col-xs-3 menu">
                <ul>
                    <li class="active withripple" data-target="#query">Query</li>
                    <li class="withripple" data-target="#about">About</li>
                </ul>
            </nav>
            <div class="pages col-xs-9" style="overflow: visible;">
                <div class="col-xs-10" style="overflow: visible;">
                    <div class="well page active" style="overflow: visible;" id="query">
                        <h1 class="header">Query System</h1>
                        <!-- TODO: PHP Query -->
                        <div id="QueryResult">
                            <h4>Connecting...</h4>
                        </div>
                    </div>
                    <div class="well page" id="about">
                        <h1 class="header">About</h1>
                        <h4>= =~</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
