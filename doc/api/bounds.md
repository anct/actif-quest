## GET /api/bounds
Returns the bounds.

### Example

#### Request
```
GET /api/bounds?uid=d164e555-6879-49c0-8b02-07f228c3d5b2 HTTP/1.1
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
Content-Length: 131
Content-Type: application/json; charset=utf-8
ETag: "4c1d27a4932e52c83e1def5ee3ae7628"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 4b9c6b80-9a6b-48d4-951b-125d02ec20e2
X-Runtime: 0.011809
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "name": "地点1"
  },
  {
    "id": 2,
    "name": "地点2"
  },
  {
    "id": 3,
    "name": "地点3"
  },
  {
    "id": 4,
    "name": "地点4"
  },
  {
    "id": 5,
    "name": "地点5"
  }
]
```

## POST /api/bounds/:id/check_in
Returns 201 created.

### Example

#### Request
```
POST /api/bounds/1/check_in HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=f911f980-5e0c-4aa2-821d-fababd251460
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 26
Content-Type: application/json; charset=utf-8
ETag: "ef53803a5650b4facf818f7594daa1d8"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 851378e6-a867-4959-8b53-b8a6ae01d942
X-Runtime: 0.024320
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "地点11"
}
```
