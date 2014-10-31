## GET /api/users/:id
Returns the user.

### Example

#### Request
```
GET /api/users/1?uid=f5a14ce2-f880-4b53-8098-133083ea070a HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 219
Content-Type: application/json; charset=utf-8
ETag: "85979d50f3ab685010d8229bd93185b7"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: fe9208ee-2d14-4e7d-8859-01b991266453
X-Runtime: 0.056460
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "test_user1",
  "screenName": "てすとゆーざ1",
  "image": {
    "mdpi": null,
    "hdpi": null,
    "xhdpi": null,
    "xxhdpi": null,
    "xxxhdpi": null
  },
  "uid": "5ae14a74-2b86-42c6-9173-5e5c63d72acd",
  "authenticationToken": "test_token"
}
```

## POST /api/users
Returns the created user.

### Example

#### Request
```
POST /api/users HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 21
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

user[name]=izumin5210
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 220
Content-Type: application/json; charset=utf-8
ETag: "9bbf4450962fbbd1af0e8da6975fc38e"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 2a0010d6-a37d-47d3-adf8-21745f4384af
X-Runtime: 0.011326
X-XSS-Protection: 1; mode=block

{
  "id": 6,
  "name": "izumin5210",
  "screenName": "izumin5210",
  "image": {
    "mdpi": null,
    "hdpi": null,
    "xhdpi": null,
    "xxhdpi": null,
    "xxxhdpi": null
  },
  "uid": "4f525aee-ef54-407d-8bc0-31a012e86046",
  "authenticationToken": "1bvkZ47cped6TPzDtKYx"
}
```
