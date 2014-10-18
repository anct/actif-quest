## GET /api/achievements
Returns the achievements.

### Example

#### Request
```
GET /api/achievements?uid=1ce3421b-653b-4085-8a7e-3a1f5ff1d571 HTTP/1.1
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
Content-Length: 766
Content-Type: application/json; charset=utf-8
ETag: "e039edc8d1e33a44c8fb96eb56bb4787"
Set-Cookie: request_method=GET; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: b6fe8f12-d947-4971-b19d-16b85132ad57
X-Runtime: 0.054651
X-XSS-Protection: 1; mode=block

[
  {
    "id": 1,
    "name": "実績 その1",
    "condition": "ほげほげ1したら取得できるで",
    "description": "こころぴょん",
    "icon": null
  },
  {
    "id": 2,
    "name": "実績 その2",
    "condition": "ほげほげ2したら取得できるで",
    "description": "こころぴょんぴょん",
    "icon": null
  },
  {
    "id": 3,
    "name": "実績 その3",
    "condition": "ほげほげ3したら取得できるで",
    "description": "こころぴょんぴょんぴょん",
    "icon": null
  },
  {
    "id": 4,
    "name": "実績 その4",
    "condition": "ほげほげ4したら取得できるで",
    "description": "こころぴょんぴょんぴょんぴょん",
    "icon": null
  },
  {
    "id": 5,
    "name": "実績 その5",
    "condition": "ほげほげ5したら取得できるで",
    "description": "こころぴょんぴょんぴょんぴょんぴょん",
    "icon": null
  }
]
```
