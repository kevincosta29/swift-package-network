# Swift Package Network Manager "KNetwork"

[![Swift](https://img.shields.io/badge/Swift-5.3_5.4_5.5-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.3_5.4_5.5-Orange?style=flat-square) 
[![Coverage](https://img.shields.io/badge/coverage-95.1%25-important)](https://img.shields.io/badge/coverage-95.1%25-important)
[![Platforms](https://img.shields.io/badge/iOS-15.0-blue)](https://img.shields.io/badge/iOS-15.0-blue)
[![Platforms](https://img.shields.io/badge/macOS-12.0-blue)](https://img.shields.io/badge/macOS-12.0-blue)

This Swift Package contains a manager for the network to create different API calls following using URLSession and async await to make these calls and avoid using completion blocks.

--- 

## Table of contents
* [Files](#files)
    * [KNetwork](#knetwork)
    * [KNetworkError](#knetworkerror)
    * [KEndpointProtocol](#kendpointprotocol)
    * [FactoryEndpoint](#factoryendpoint)
* [Example](#example)

---

## Files
The following sections describe the main idea of every file in the manager

### [KNetwork](https://github.com/kevincosta29/swift-package-network/blob/main/Sources/KNetwork/KNetwork.swift)

File that uses EndPoint extended from the protocol KEndpointProtocol and an URLSession. Inside the function `executeRequest(...)` it create an URLRequest and `await` technique to make the call.


### [KNetworkError](https://github.com/kevincosta29/swift-package-network/blob/main/Sources/KNetwork/KNetworkError.swift)

Simple Enum with different case to manage all the differents errors that can be using this KNetwork manager

### [KEndpointProtocol](https://github.com/kevincosta29/swift-package-network/blob/main/Sources/KNetwork/Endpoints/EndpointProtocol.swift)

Basic protocol that all EndPoints have to follow to use the KNetwork.

### [FactoryEndpoint](https://github.com/kevincosta29/swift-package-network/blob/main/Sources/KNetwork/Endpoints/FactoryEndpoint.swift)

Factory in charge to create an URLRequest from a KEndPointProtocol class.

---

## Example
The folder [Example](https://github.com/kevincosta29/swift-package-network/tree/main/Example) contains an example of how to use the package and how to make a call to a specific [API](https://rickandmortyapi.com).

This example is using the architecture MVVM, for that reason its necessary to follow all flow between `ContentView -> ViewModel -> DataSource -> Service -> KNetwork` to see how is making the request of the data and how it return to the scene.

In this example when the method `.onAppear {` of the file ContentView is called, calls to the function `viewModel.fetchDocuments()` of the ViewModel to create the request. The ViewModel use the DataSource and this use the Service. To make the call throw KNetwork.

> It's **very important** to implement a Service layer for each where we want to use this package. And in this Service layer we have managed the response from the KNetwork and the status code.