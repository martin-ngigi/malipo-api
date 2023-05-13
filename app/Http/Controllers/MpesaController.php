<?php

namespace App\Http\Controllers;

use App\Models\Mpesa\MpesaSetting;
use App\Models\Mpesa\MpesaSTKPush;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

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
      if($err){
        return response()->json([
            "message" => "Error occurred while generating access token.",
            "error"=> $err,
            "status" => "false"
        ]);
     }

     // json response
     /***
      $response_data = response()->json([
        'status'=>$mpesa_response!=null?'true':'false',
        'mpesa_data'=>$mpesa_response,
        'bs_64'=>$bs64String,
      ]);
      */

      //array response
      $response_data = array(
        'status' => $mpesa_response!=null?true:false,
        'mpesa_data'=>$mpesa_response,
        //'bs_64'=>$bs64String
      );

      //return entire array
      return $response_data;

      //return only the access_token
      // return $response_data['mpesa_data']->access_token;

    }

     // Generate a base64  password using the Safaricom PassKey and the Business ShortCode to be used in the Mpesa Transaction
     public function lipaNaMpesaPassword(){
      $mpesaKeys=MpesaSetting::where('id', 1)->first();
      $mpesa_shortcode = $mpesaKeys->business_short_code;
      $passkey = $mpesaKeys->safaricom_passkey;

      $timestamp = Carbon::rawParse('now')->format('YmdHms');

      return base64_encode($mpesa_shortcode.$passkey.$timestamp);
     }

    public function simulateSTKPush(Request $request){

      $mpesaKeys=MpesaSetting::where('id', 1)->first();
      
      $gen_access_token_response = $this->generateAccessToken();
      $access_token = $gen_access_token_response['mpesa_data']->access_token; // get access_token from generateAccessToken() method
      $till_number =$mpesaKeys->till_number;
      $account_ref ="DevWainaina";
      $base_url =$mpesaKeys->sanbox_base_url;
      $timestamp = Carbon::rawParse('now')->format('YmdHms');
      $initiatorNumber = $request->user_number;
      $amount = $request->amount;
      $password=$this->lipaNaMpesaPassword();

      
       $fields=  [
          "BusinessShortCode" =>  $till_number,
          "Password" => $password,
          "Timestamp" => $timestamp,
          "TransactionType" => "CustomerPayBillOnline",
          "Amount" => $amount,
          "PartyA" => $initiatorNumber,
          "PartyB" =>  $till_number,
          "PhoneNumber" => $initiatorNumber,
          "CallBackURL" => "https://mydomain.com/path",
          "AccountReference" => $account_ref,
          "TransactionDesc" => "Wainaina" 
       ];
    
      $curl = curl_init();
            
      $headers = [
        "Cache-Control: no-cache",
        "Accept: application/json",
        "Content-Type: application/json",
        "Authorization: Bearer ".$access_token,
      ];

      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $base_url."/mpesa/stkpush/v1/processrequest");
      curl_setopt($ch, CURLOPT_POST, true);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

      $result = curl_exec($ch);
      $err = curl_error($curl);

      if($err){
        return response()->json([
          "message" => "Error occurred while generating stk push token.",
          "status" => "false",
          "error" => $err
        ]);
      }
      curl_close($ch);

      $mpesa_response_data = json_decode($result);

      $message = array(
        'status'=>$mpesa_response_data!=null?true:false,
        'message' => 'Received Mpesa response ...',
        'data'=>$mpesa_response_data,
        // 'was_stk_sent' => $mpesa_response_data->ResponseCode == "0" ?true : false
      );

      //save to db... But first convert to Array so as to extract the required data.
      $mpesa_response_data = (array)$mpesa_response_data;

      MpesaSTKPush::create([
        'merchant_request_id' => $mpesa_response_data['MerchantRequestID'],
        'checkout_request_id' =>  $mpesa_response_data['CheckoutRequestID']
      ]);


      return $message;
          
      
    }

    public function queryTransaction(Request $request){

    $checkoutRequestId = $request->checkout_request_id;

    $gen_access_token_response = $this->generateAccessToken();
    $access_token = $gen_access_token_response['mpesa_data']->access_token; // get access_token from generateAccessToken() method
    $password = $this->lipaNaMpesaPassword();
    $timestamp = Carbon::rawParse('now')->format('YmdHms');

    $mpesaKeys=MpesaSetting::where('id', 1)->first();
    $till_number =$mpesaKeys->till_number;
    $sandbox_base_url =$mpesaKeys->sanbox_base_url;




    $post_data = [
      'BusinessShortCode' => $till_number,
      'Password' => $password,
      'Timestamp' => $timestamp,
      'CheckoutRequestID' => $checkoutRequestId
    ];

    $url = "/mpesa/stkpushquery/v1/query";

    $curl = curl_init();
            
    $headers = [
      "Cache-Control: no-cache",
      "Accept: application/json",
      "Content-Type: application/json",
      "Authorization: Bearer ".$access_token,
    ];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $sandbox_base_url.$url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($post_data));

    $result = curl_exec($ch);
    $err = curl_error($curl);

    if($err){
      return response()->json([
        "message" => "Error occurred while obtaining query transaction status.",
        "status" => "false",
        "error" => $err
      ]);
    }
    curl_close($ch);

    $mpesa_response_data = json_decode($result);

    $message = array(
      'status'=>$mpesa_response_data!=null?true:false,
      'message' => 'Received Mpesa response ...',
      'data'=>$mpesa_response_data,
      // 'was_stk_sent' => $mpesa_response_data->ResponseCode == "0" ?true : false
    );

    return $message;


    }
    



}
