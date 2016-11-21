# Where's My Bus? API

[![Build Status](https://travis-ci.org/WheresMyBus/api.svg?branch=master)](https://travis-ci.org/WheresMyBus/api)

## For Users

[User Documentation](https://github.com/WheresMyBus/android/wiki/User-Documentation)

## For Developers

[Developer Documentation](https://github.com/WheresMyBus/android/wiki/Developer-Documentation)

## API Reference

### [GET] /neighborhoods

#### Description

Returns a list of all neighborhoods.

#### Example Response

```
[
  {
    "id": 1,
    "name": "Admiral"
  },
  {
    "id": 2,
    "name": "Alki"
  },
  {
    "id": 3,
    "name": "Ballard"
  },
  ...
]
```

### [GET] /neighborhoods?filter={query}

#### Description

Returns a list of all neighborhoods where the name contains the given filter parameter. If the filter is blank, all neighborhoods will be returned.

#### Example Response

```
[
  {
    "id": 4,
    "name": "Beacon Hill"
  },
  {
    "id": 10,
    "name": "Capitol Hill"
  },
  {
    "id": 13,
    "name": "Crown Hill"
  },
  ...
]
```

### [GET] /neighborhoods/{id}

#### Description

Returns the neighborhood with the given id.

#### Example Response

```
{
  "id": 3,
  "name": "Ballard"
}
```

### [GET] /neighborhoods/{id}/alerts

#### Description

Returns a list of alerts for the neighborhood with the given id.

#### Example Response

```
[
  {
    "id": 1,
    "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
    "issues": "construction",
    "description": "Alert description goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "neighborhood_id": 1,
    "created_at": "2016-11-10T17:29:53.626Z"
  },
  ...
]
```

### [POST] /neighborhoods/{id}/alerts

#### Parameters

- `issues` : A string representing the type of issue
- `description` : Text for describing the issue more specifically
- `user_id` : The UUID for a given user

#### Description

Submits an alert about the neighborhood with the given id and returns the created alert.

#### Example Response

```
{
  "id": 1,
  "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
  "issues": "construction",
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "neighborhood_id": 1,
  "created_at": "2016-11-10T17:29:53.626Z"
}
```

### [GET] /neighborhood_alerts/{id}

#### Description

Returns the neighborhood alert with the given id.

#### Example Response

```
{
  "id": 1,
  "user_id": "50d1ce8e-a213-40a0-8228-587ea7fd604c",
  "issues": "construction",
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "neighborhood_id": 1,
  "created_at": "2016-11-10T17:29:53.626Z"
}
```

### [POST] /neighborhood_alerts/{id}/upvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits an upvote for the neighborhood alert with the given id and returns the vote.

#### Example Response

```
{
  "id": 1,
  "user_id": "2f815de9-0726-4af6-9fca-ab251a2cbf29",
  "value": "up"
}
```

### [POST] /neighborhood_alerts/{id}/downvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits a downvote for the neighborhood alert with the given id and returns the vote.

#### Example Response

```
{
  "id": 2,
  "user_id": "0b26919d-64df-4ad2-9f8b-b7feb9f289c5",
  "value": "down"
}
```

### [GET] /neighborhood_alerts/{id}/comments

#### Description

Returns a list of comments for the neighborhood alert with the given id.

#### Example Response

```
[
  {
    "id": 1,
    "user_id": "2af040ec-35de-49f5-9634-b3cd012799e3",
    "message": "Comment message goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "created_at": "2016-11-10T17:51:32.984Z"
  },
  ...
]
```

### [POST] /neighborhood_alerts/{id}/comments

#### Parameters

- `message` : The content of the comment
- `user_id` : The UUID for a given user

#### Description

Submits a comment about the neighborhood alert with the given id and returns the created comment.

#### Example Response

```
{
  "id": 1,
  "user_id": "2af040ec-35de-49f5-9634-b3cd012799e3",
  "message": "Comment message goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "created_at": "2016-11-10T17:51:32.984Z"
}
```

### [GET] /routes

#### Description

Returns a list of all routes.

#### Example Response

```
[
  {
    "id": "1_100300",
    "number": "917",
    "name": "Pacific to Algona to Auburn Station"
  },
  {
    "id": "1_100512",
    "number": "A Line",
    "name": "Federal Way TC/Tukwila International Blvd Link Sta"
  },
  {
    "id": "1_100212",
    "number": "37",
    "name": "Alaska Junction to Alki to Downtown Seattle"
  },
  ...
]
```

### [GET] /routes?filter={query}

#### Description

Returns a list of all routes where the number or name contains the given filter parameter. If the filter is blank, all routes will be returned.

#### Example Response

```
[
  {
    "id": "1_100214",
    "number": "372",
    "name": "UW Bothell Campus to University District"
  },
  {
    "id": "1_100215",
    "number": "373",
    "name": "Aurora Village TC to University District"
  },
  {
    "id": "1_100225",
    "number": "45",
    "name": "Loyal Heights to University District"
  },
  ...
]
```

### [GET] /routes/{id}

#### Description

Returns the route with the given id.

#### Example Response

```
{
  "id": "1_100224",
  "number": "44",
  "name": "Ballard - Montlake"
}
```

### [GET] /routes/{id}/alerts

#### Description

Returns a list of alerts for the route with the given id.

#### Example Response

```
[
  {
    "id": 1,
    "user_id": "1d5a07f3-e980-49b7-bf6c-005a02fe3e13",
    "issues": "construction",
    "description": "Alert description goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "route_id":"1_100224",
    "created_at": "2016-11-11T00:28:53.935Z"
  },
  ...
]
```

### [POST] /routes/{id}/alerts

#### Parameters

- `issues` : A string representing the type of issue
- `description` : Text for describing the issue more specifically
- `user_id` : The UUID for a given user

#### Description

Submits an alert about the route with the given id and returns the created alert.

#### Example Response

```
{
  "id": 1,
  "user_id": "1d5a07f3-e980-49b7-bf6c-005a02fe3e13",
  "issues": "construction",
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "route_id":"1_100224",
  "created_at": "2016-11-11T00:28:53.935Z"
}
```

### [GET] /route/{id}/bus_locations

#### Description

Returns the current locations of all buses on a given route.

#### Example Response

```
[
  {
    "lat": 47.61451379543677,
    "lon": -122.34447849787281
  },
  {
    "lat": 47.578342407575,
    "lon": -122.29356368385727
  },
  {
    "lat": 47.590622537417325,
    "lon": -122.29239670439664
  },
  ...
]
```

### [GET] /route_alerts/{id}

#### Description

Returns the route alert with the given id.

#### Example Response

```
{
  "id": 1,
  "user_id": "1d5a07f3-e980-49b7-bf6c-005a02fe3e13",
  "issues": "construction",
  "description": "Alert description goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "route_id":"1_100224",
  "created_at": "2016-11-11T00:28:53.935Z"
}
```

### [POST] /route_alerts/{id}/upvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits an upvote for the route alert with the given id and returns the vote.

#### Example Response

```
{
  "id": 5,
  "user_id": "26317c91-7914-4947-a0f3-987cac4036dc",
  "value": "up"
}
```

### [POST] /route_alerts/{id}/downvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits a downvote for the route alert with the given id and returns the vote.

#### Example Response

```
{
  "id": 6,
  "user_id": "8d77ec5e-924b-47ec-841d-529182d5c16c",
  "value": "down"
}
```

### [GET] /route_alerts/{id}/comments

#### Description

Returns a list of comments for the route alert with the given id.

#### Example Response

```
[
  {
    "id": 2,
    "user_id": "45c4fc97-40eb-4674-91e9-029abcc3aabc",
    "message": "Comment message goes here...",
    "upvotes": 0,
    "downvotes": 0,
    "created_at": "2016-11-10T19:07:11.769Z"
  },
  ...
]
```

### [POST] /route_alerts/{id}/comments

#### Parameters

- `message` : The content of the comment
- `user_id` : The UUID for a given user

#### Description

Submits a comment about the route alert with the given id and returns the created comment.

#### Example Response

```
{
  "id": 2,
  "user_id": "45c4fc97-40eb-4674-91e9-029abcc3aabc",
  "message": "Comment message goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "created_at": "2016-11-10T19:07:11.769Z"
}
```

### [GET] /comments/{id}

#### Description

Returns the comment with the given id.

#### Example Response

```
{
  "id": 2,
  "user_id": "45c4fc97-40eb-4674-91e9-029abcc3aabc",
  "message": "Comment message goes here...",
  "upvotes": 0,
  "downvotes": 0,
  "created_at": "2016-11-10T19:07:11.769Z"
}
```

### [POST] /comments/{id}/upvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits an upvote for the comment with the given id and returns the vote.

#### Example Response

```
{
  "id": 7,
  "user_id": "af7cc903-f821-4098-88dc-452378bc9bd6",
  "value": "up"
}
```

### [POST] /comments/{id}/downvote

#### Parameters

- `user_id` : The UUID for a given user

#### Description

Submits a downvote for the comment with the given id and returns the vote.

#### Example Response

```
{
  "id": 7,
  "user_id": "372d03de-3581-4f32-807f-8e38e759370c",
  "value": "down"
}
```
