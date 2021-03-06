#  WildAid O-FISH iOS App

**This app is work-in-progress**

The [WildAid Marine Program](https://marine.wildaid.org/) work to protect vulnerable marine environments.

O-FISH (Officer Fishery Information Sharing Hub) is a multi-platform application that enables officers to browse and record boarding report data from their mobile devices.

This repo implements the iOS O-FISH app.

Details on installing all applications making up the solution can be found [here](http://wildaid.github.io/).

## Prerequisites

This is the iOS Mobile app for O-FISH. To build and use the app, you must first create and configure your serverless backend application using the [WildAid O-FISH MongoDB Realm repo](https://github.com/WildAid/o-fish-realm).

## Building and running the app

Set the Realm Application ID (find it for your app through the [MongoDB Realm UI](https://realm.mongodb.com)) in `o-fish/Helpers/Constant.swift`:

```
realm_app_id=your_app_id
```

To build:
- `pod install`
  - Note: you may need to resolve dependencies by doing `pod install --repo-update`
- Build/run in Xcode

To be able to login to the app once it is built, you need to create a user in your instance of the [O-FISH Realm App](https://github.com/WildAid/o-fish-realm).

