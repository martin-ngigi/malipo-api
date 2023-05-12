<?php

namespace App\Http\Controllers;

use App\Models\Mpesa\MpesaSetting;
use Illuminate\Http\Request;

class MpesaController extends Controller
{
    //SANDBOX : https://sandbox.safaricom.co.ke
    //LIVE : https://api.safaricom.co.ke

    public function generateAccessToken(){
        $mpesaKeys=MpesaSetting::where('id', 1)->first();
        
        $consumer_key =$mpesaKeys->consumer_key; 
        $secret_key =$mpesaKeys->consumer_secret;
        $bsSecret = $consumer_key.":".$secret_key;
        $bs64String = base64_encode(utf8_encode($bsSecret));
        $sandbox_base_url =$mpesaKeys->sanbox_base_url;

        $curl = curl_init();
        curl_setopt_array($curl, array(
            ///
        CURLOPT_URL => $sandbox_base_url."/oauth/v1/generate?grant_type=client_credentials",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
          "Cache-Control: no-cache",
          "Accept: application/json",
          "Content-Type: application/json",
          "Authorization: Basic ".$bs64String,
        ),
      ));

      $response = curl_exec($curl);
      $err = curl_error($curl);
      curl_close($curl);
      
      $mpesa_response = json_decode($response);
      //$response = array('status'=>$statusCode!=null?'true':'false','mpesa_data'=>$statusCode,'bs_64'=>$bs64String);
      if($err){
        return response()->json([
            "message" => "Error occurred while generating access token.",
            "error"=> $err
        ]);
     }

      $response_data = response()->json([
        'status'=>$mpesa_response!=null?'true':'false',
        'mpesa_data'=>$mpesa_response,
        'bs_64'=>$bs64String,
      ]);
      return $response_data;

    }
}
