- Create MpesaSetting Model
```
php artisan make:model Mpesa/MpesaSetting -m 
```

# API
## Mpesa APIs
## Sandbox APIs
1. Generate Authorization token
- Method : GET
- Endpoind :  http://127.0.0.1:8000/api/v1/mpesa/generate-access-token
- Response: 
```
{
    "status": "true",
    "mpesa_data": {
        "access_token": "iH5xpH9E5WzabIXcZmGhJpx5NFbA",
        "expires_in": "3599"
    },
    "bs_64": "QkFmOGRvRXN4ejQydzVYR2VvTFVqR2s0dnc3ckdrNXk6Y2M2T1dxUXgzdGhoREFXMw=="
}
```
