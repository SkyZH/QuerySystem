<!DOCTYPE html>

<html>
    <head>
        <title>Query System</title>

        <link rel="stylesheet" href="styles.css">
        <script src="./bower_components/jquery/dist/jquery.min.js"></script>        
        <link href="./bower_components/todc-bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./bower_components/todc-bootstrap/dist/css/todc-bootstrap.min.css" rel="stylesheet">
        <link href="./bower_components/todc-bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <script src="./bower_components/todc-bootstrap/dist/js/bootstrap.min.js"></script>
        <meta http-equiv="Access-Control-Allow-Origin" content="http://111.186.99.95:8080">
    </head>

    <body>
        <script src="main.js"></script> 

        <div id="selectForm" class = "QueryDiv Center">
            <form onchange="onChange()">
                <table class = "QueryTable table" border = "0px">
                    <tbody class = "TableTitleBar Center">
                        <tr class = "TableTitleRow Center">
                            <td colspan = "6">
                                <div>
                                    <h1 style = "text-align: left; width: 816px;" >Dashboard - Query System</h1>
                                </div>
                            </td>
                        </tr>
                        <tr class = "TableTitleRow">
                            <td class = "TableTitle">
                                <p>Level</p>
                            </td>
                            <td class = "TableTitle">
                                <p>Input Voltage</p><p class = "QueryTableTitleLight">(kV)</p>
                            </td>
                            <td class = "TableTitle">
                                <p>Rated Capacity</p><p class = "QueryTableTitleLight">(kVA)</p>
                            </td>
                            <td class = "TableTitle">
                                <p>Rated Current</p><p class = "QueryTableTitleLight">(A)</p>
                            </td>
                            <td class = "TableTitle">
                                <p>Rated Power</p><p class = "QueryTableTitleLight">(kW)</p>
                            </td>
                            <td class = "TableTitle">
                                <p>Weight</p><p class = "QueryTableTitleLight">(kg)</p>
                            </td>
                        </tr>
                        
                        <tr id = "FilterRow">
                            <td>
                                <select name="level">
                                    <option value="{level}=0">All</option>
                                    <option value="{level}=1">3</option>
                                    <option value="{level}=2">2</option>
                                </select>
                            </td>
                            <td>
                                <select name="inputvoltage">
                                    <option value="{inputvoltage}=0">All</option>
                                    <option value="{inputvoltage}=1">&lt;6kV</option>
                                    <option value="{inputvoltage}=2">&gt;6kV</option>
                                </select>
                            </td>
                            <td>
                                 <select name="ratedcapacity">
                                    <option value="{ratedcapacitymin}=0&{ratedcapacitymax}=100000">All</option>
                                    <option value="{ratedcapacitymin}=0&{ratedcapacitymax}=2000">&lt;2000</option>
                                    <option value="{ratedcapacitymin}=2000&{ratedcapacitymax}=3000">2000~3000</option>
                                    <option value="{ratedcapacitymin}=3000&{ratedcapacitymax}=4000">3000~4000</option>
                                    <option value="{ratedcapacitymin}=4000&{ratedcapacitymax}=5000">4000~5000</option>
                                    <option value="{ratedcapacitymin}=5000&{ratedcapacitymax}=6000">5000~6000</option>
                                    <option value="{ratedcapacitymin}=6000&{ratedcapacitymax}=7000">6000~7000</option>
                                    <option value="{ratedcapacitymin}=7000&{ratedcapacitymax}=8000">7000~8000</option>
                                    <option value="{ratedcapacitymin}=8000&{ratedcapacitymax}=9000">8000~9000</option>
                                    <option value="{ratedcapacitymin}=9000&{ratedcapacitymax}=10000">9000~10000</option>
                                    <option value="{ratedcapacitymin}=10000&{ratedcapacitymax}=11000">10000~11000</option>
                                    <option value="{ratedcapacitymin}=11000&{ratedcapacitymax}=12000">11000~12000</option>
                                    <option value="{ratedcapacitymin}=12000&{ratedcapacitymax}=13000">12000~13000</option>
                                    <option value="{ratedcapacitymin}=13000&{ratedcapacitymax}=14000">13000~14000</option>
                                    <option value="{ratedcapacitymin}=14000&{ratedcapacitymax}=15000">14000~15000</option>
                                    <option value="{ratedcapacitymin}=15000&{ratedcapacitymax}=1000000">&gt;15000</option>
                                </select>
                            </td>
                            <td>
                                <select name="ratedcurrent">
                                    <option value="{ratedcurrentmin}=0&{ratedcurrentmax}=1000000">All</option> 
                                    <option value="{ratedcurrentmin}=0&{ratedcurrentmax}=100">&lt;100</option>
                                    <option value="{ratedcurrentmin}=100&{ratedcurrentmax}=200">100~200</option>
                                    <option value="{ratedcurrentmin}=200&{ratedcurrentmax}=300">200~300</option>
                                    <option value="{ratedcurrentmin}=300&{ratedcurrentmax}=400">300~400</option>
                                    <option value="{ratedcurrentmin}=400&{ratedcurrentmax}=500">400~500</option>
                                    <option value="{ratedcurrentmin}=500&{ratedcurrentmax}=1000000">&gt;500</option>
                                </select>
                            </td>
                            <td>
                               <select name="ratedpower">
                                    <option value="{ratedpowermin}=0&{ratedpowermax}=100000">All</option>
                                    <option value="{ratedpowermin}=0&{ratedpowermax}=1000">&lt;1000</option>
                                    <option value="{ratedpowermin}=1000&{ratedpowermax}=2000">1000~2000</option>
                                    <option value="{ratedpowermin}=2000&{ratedpowermax}=3000">2000~3000</option>
                                    <option value="{ratedpowermin}=3000&{ratedpowermax}=4000">3000~4000</option>
                                    <option value="{ratedpowermin}=4000&{ratedpowermax}=5000">4000~5000</option>
                                    <option value="{ratedpowermin}=5000&{ratedpowermax}=6000">5000~6000</option>
                                    <option value="{ratedpowermin}=6000&{ratedpowermax}=7000">6000~7000</option>
                                    <option value="{ratedpowermin}=7000&{ratedpowermax}=8000">7000~8000</option>
                                    <option value="{ratedpowermin}=8000&{ratedpowermax}=9000">8000~9000</option>
                                    <option value="{ratedpowermin}=9000&{ratedpowermax}=10000">9000~10000</option>
                                    <option value="{ratedpowermin}=10000&{ratedpowermax}=11000">10000~11000</option>
                                    <option value="{ratedpowermin}=11000&{ratedpowermax}=12000">11000~12000</option>
                                    <option value="{ratedpowermin}=12000&{ratedpowermax}=13000">12000~13000</option>
                                    <option value="{ratedpowermin}=13000&{ratedpowermax}=1000000">&gt;13000</option>
                                </select>
                            </td>
                            <td>
                                <select name="weight">
                                    <option value="{weightmin}=0&{weightmax}=100000">All</option>
                                    <option value="{weightmin}=0&{weightmax}=2000">&lt;2000</option>
                                    <option value="{weightmin}=2000&{weightmax}=3000">2000~3000</option>
                                    <option value="{weightmin}=3000&{weightmax}=4000">3000~4000</option>
                                    <option value="{weightmin}=4000&{weightmax}=5000">4000~5000</option>
                                    <option value="{weightmin}=5000&{weightmax}=6000">5000~6000</option>
                                    <option value="{weightmin}=6000&{weightmax}=7000">6000~7000</option>
                                    <option value="{weightmin}=7000&{weightmax}=8000">7000~8000</option>
                                    <option value="{weightmin}=8000&{weightmax}=9000">8000~9000</option>
                                    <option value="{weightmin}=9000&{weightmax}=10000">9000~10000</option>
                                    <option value="{weightmin}=10000&{weightmax}=11000">10000~11000</option>
                                    <option value="{weightmin}=11000&{weightmax}=12000">11000~12000</option>
                                    <option value="{weightmin}=12000&{weightmax}=13000">12000~13000</option>
                                    <option value="{weightmin}=13000&{weightmax}=14000">13000~14000</option>
                                    <option value="{weightmin}=14000&{weightmax}=15000">14000~15000</option>
                                    <option value="{weightmin}=15000&{weightmax}=1000000">&gt;15000</option>
                                </select>
                            </td>
                        </tr>
                    
                        <tr>
                            <td colspan = "6">
                                <a href="javascript:ToggleFilter()" id="FilterLink">Hide Filter</a>
                            </td>
                        </tr>
                    </tbody>

                </form>
            </table>
            <table class = "QueryTable table" border = "0px" style = "margin-top: 248px;">
                 <tbody id="PraseData" class = "PraseTable" style = "align: center;">
                </tbody>
            </table>
        </div>
    </body>
</html>
