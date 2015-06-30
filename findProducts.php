<?php
    $level = (string)$_GET["a"];
	$input = (string)$_GET["c"];
	$capacitymin = (string)$_GET["d"];
	$capacitymax = (string)$_GET["e"];
	$currentmin = (string)$_GET["f"];
	$currentmax = (string)$_GET["g"];
	$motorpowermin = (string)$_GET["h"];
	$motorpowermax = (string)$_GET["i"];
	$weightmin = (string)$_GET["j"];
	$weightmax = (string)$_GET["k"];

    $page = intval($_GET['p']);

    $sqlCommandHeader = "select * from productname where ";

    $sqlCommand = "";
    if($level <> "0") $sqlCommand .= "c_id = " . $level . " and ";

	if($input == "1") $sqlCommand .= "p_input <= 6.0 and ";
	if($input == "2") $sqlCommand .= "p_input >= 6.0 and ";

    $sqlCommand .= "(p_capacity between " . $capacitymin . " and " . $capacitymax . ") and ";
	$sqlCommand .= "(p_current between " . $currentmin . " and " . $currentmax . ") and ";
    $sqlCommand .= "(p_motorpower between " . $motorpowermin . " and " . $motorpowermax . ") and ";
    $sqlCommand .= "(p_weight between " . $weightmin . " and " . $weightmax . ") ";

    $con = mysql_connect("localhost","query","query123");
	if (!$con)
	{
		die('Could not connect: ' . mysql_error());
	}

	mysql_select_db("product", $con);

    $__page_start =  $page * 20;
    $__page_end = $__page_start + 20;

    $sqlCommandEnd = " LIMIT ".$__page_start." , ".$__page_end;

    $result = mysql_query($sqlCommandHeader.$sqlCommand.$sqlCommandEnd, $con);

	for($i = $__page_start; $i < $__page_end; $i++)
	{
        $row = mysql_fetch_array($result);
        if($row)
        {
            echo "<tr><td>" ."<a href=http://baidu.com>". $row['p_name']. "</a>". "</td>";
            echo "<td>" . $row['p_input'] . "</td>";
            echo "<td>" . $row['p_capacity'] . "</td>";
            echo "<td>" . $row['p_current'] . "</td>";
            echo "<td>" . $row['p_motorpower'] . "</td>";
            echo "<td>" . $row['p_weight'] . "</td></tr>";
        }
        else {
            break;
        }
	}
    if($row && $page == 0)echo "<tr><td colspan = '6'><div id = 'PageDiv' class = 'pgDown'></div></td></tr>";
    else if($row && $page <> 0)echo "<tr><td colspan = '6'><div id = 'PageDiv' class = 'pgUp pgDown'></div></td></tr>";
    else if($page<>0)echo "<tr><td colspan = '6'><div id = 'PageDiv' class = 'pgUp'></div></td></tr>";
    else echo "<tr><td colspan = '6'><div id = 'PageDiv'></div></td></tr>";
    mysql_free_result($result);

    $sqlCommandHeader = "select count(*) as sum from productname where ";
    $result = mysql_query($sqlCommandHeader.$sqlCommand, $con);
    $row = mysql_fetch_array($result);
    $productCount = $row["sum"];
    echo "<script> MaxProduct = ".$productCount."</script>";
    mysql_free_result($result);
	mysql_close($con);
?>
