<?php
    $data = file_get_contents('php://input');

    $handle= fopen('validation.txt', 'w');

    fwrite($handle, $data);

    if($amount >100)
    {
        $response  = array(
            'ResultCode' => 0 ,
            'ResultDesc' =>'Accepted'
        );

        $json_response = json_encode($response);

        header('Content-type: application/json');
        echo $json_response;
    }
    ?>