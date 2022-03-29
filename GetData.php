<?php
switch ($_POST['mainSelect']) {
    case "Задание 1":
        include 'processor.php';

        echo "<table border=1>";
		foreach ($data as $arr) {
			echo '<tr>';	
			foreach($arr as $key => $value) {
				echo '<td>'.$value.'</td>';
				}			
			}
			echo '</tr>';
        break;
    case "Задание 2":
        include 'software.php';

        // function definition to convert array to xml
        function array_to_xml( $data, &$xml_data ) {
            foreach( $data as $key => $value ) {
                if( is_array($value) ) {
                    if( is_numeric($key) ){
                        $key = 'item'.$key; //dealing with <0/>..<n/> issues
                    }
                    $subnode = $xml_data->addChild($key);
                    array_to_xml($value, $subnode);
                } else {
                    $xml_data->addChild("$key",htmlspecialchars("$value"));
                }
             }
        }
        
        // creating object of SimpleXMLElement
        $xml_data = new SimpleXMLElement('<?xml version="1.0"?><data></data>');
        
        // function call to convert array to xml
        array_to_xml($data,$xml_data);
        
        //saving generated xml file; 
        echo $xml_data->asXML();
        
        break;
    case "Задание 3":
        include 'guarantee.php';
        echo json_encode($data);
        break;
}
