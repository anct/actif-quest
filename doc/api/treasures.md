## GET /api/treasures
Returns 200 ok.

### Example

#### Request
```
GET /api/treasures?uid=919ebe3c-1295-4984-9e8d-2172f57c7874 HTTP/1.1
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
Content-Length: 776
Content-Type: application/json; charset=utf-8
ETag: "cccd314bd9173ee53823778f3f8383c7"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 97c02da5-9a7e-4a1a-8f65-0abcfff9c005
X-Runtime: 0.013449
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "name": "おたから1",
    "description": "こころがぴょんぴょんするおたから その1",
    "imageUrl": null,
    "bound": {
      "id": 1,
      "name": "地点1"
    }
  },
  {
    "id": 2,
    "name": "おたから2",
    "description": "こころがぴょんぴょんするおたから その2",
    "imageUrl": null,
    "bound": {
      "id": 2,
      "name": "地点2"
    }
  },
  {
    "id": 3,
    "name": "おたから3",
    "description": "こころがぴょんぴょんするおたから その3",
    "imageUrl": null,
    "bound": {
      "id": 3,
      "name": "地点3"
    }
  },
  {
    "id": 4,
    "name": "おたから4",
    "description": "こころがぴょんぴょんするおたから その4",
    "imageUrl": null,
    "bound": {
      "id": 4,
      "name": "地点4"
    }
  },
  {
    "id": 5,
    "name": "おたから5",
    "description": "こころがぴょんぴょんするおたから その5",
    "imageUrl": null,
    "bound": {
      "id": 5,
      "name": "地点5"
    }
  }
]
```

## GET /api/treasures/:id
Returns 200 ok.

### Example

#### Request
```
GET /api/treasures/1?uid=2b290f44-1d41-4bb2-bc4a-b464adea915c HTTP/1.1
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
Content-Length: 157
Content-Type: application/json; charset=utf-8
ETag: "6be4f62c09e855b176b19c7602c9557a"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 99348b59-2130-4d3d-a0c9-3fabf4bfe2e1
X-Runtime: 0.006486
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "おたから11",
  "description": "こころがぴょんぴょんするおたから その11",
  "imageUrl": null,
  "bound": {
    "id": 1,
    "name": "地点11"
  }
}
```

## POST /api/treasures/:id/take
Returns 201 created.

### Example

#### Request
```
POST /api/treasures/1/take HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: Token token=test_token
Content-Length: 40
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

uid=8410e423-ef72-41ae-9b5b-8e09fbafd8e0
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 157
Content-Type: application/json; charset=utf-8
ETag: "0b0ac6d452571b74c55497eb766d21d1"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 9bfe7193-0167-4d2b-991f-ec1e53f300d2
X-Runtime: 0.022107
X-XSS-Protection: 1; mode=block

{
  "id": 1,
  "name": "おたから26",
  "description": "こころがぴょんぴょんするおたから その26",
  "imageUrl": null,
  "bound": {
    "id": 1,
    "name": "地点26"
  }
}
```
