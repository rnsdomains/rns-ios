<p align="middle">
    <img src="https://www.rifos.org/assets/img/logo.svg" alt="logo" height="100" >
</p>
<h3 align="middle"><code>rns-ios</code></h3>
<p align="middle">
    RNS iOS SDK
</p>
<p align="middle">
    <a href="https://developers.rsk.co/rif/rns/libs/iOS/">
      <img src="https://img.shields.io/badge/-docs-brightgreen" alt="docs" />
    </a>
</p>

Implementation for resolvers for the RIF Name Service, available for iOS.

```
pod "Rns"
```

RNS is available through CocoaPods. To install it, simpy add the following line to your Podfile:

## Usage

You will need access to a running rsk node that can made calls to the JSON-RPC. For this we have our public nodes available for you, that are already configured in our `Info.plist` file. 

You can just create your resolver with the default constructor if you are going to use mainnet.

```swift
 let resolver = new RnsResolver();
```

Or you can use another constructor if you want to use a personal node.

```swift
let resolver = new RnsResolver(nodeDir: "http://your.node.org", publicResolverAddress:"RSK_ADDRES_TO_YOUR_RESOLVER");
```

Then you can start using your resolver. As you can see in this example [RNS iOS Sample App](https://github.com/rnsdomains/rns-ios-sampleapp).
