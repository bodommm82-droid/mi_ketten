# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetCouplePoints
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.getCouplePoints(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetCouplePointsData, GetCouplePointsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getCouplePoints(
  id: id,
);
GetCouplePointsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.getCouplePoints(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateUserAccount
#### Required Arguments
```dart
String name = ...;
String email = ...;
ExampleConnector.instance.createUserAccount(
  name: name,
  email: email,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserAccountData, CreateUserAccountVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createUserAccount(
  name: name,
  email: email,
);
CreateUserAccountData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String email = ...;

final ref = ExampleConnector.instance.createUserAccount(
  name: name,
  email: email,
).ref();
ref.execute();
```


### LogChallengeCompletion
#### Required Arguments
```dart
String challengeId = ...;
String coupleId = ...;
ExampleConnector.instance.logChallengeCompletion(
  challengeId: challengeId,
  coupleId: coupleId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For LogChallengeCompletion, we created `LogChallengeCompletionBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class LogChallengeCompletionVariablesBuilder {
  ...
   LogChallengeCompletionVariablesBuilder comment(String? t) {
   _comment.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.logChallengeCompletion(
  challengeId: challengeId,
  coupleId: coupleId,
)
.comment(comment)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<LogChallengeCompletionData, LogChallengeCompletionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.logChallengeCompletion(
  challengeId: challengeId,
  coupleId: coupleId,
);
LogChallengeCompletionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String challengeId = ...;
String coupleId = ...;

final ref = ExampleConnector.instance.logChallengeCompletion(
  challengeId: challengeId,
  coupleId: coupleId,
).ref();
ref.execute();
```


### UpdateRewardRedemption
#### Required Arguments
```dart
String id = ...;
bool isRedeemed = ...;
ExampleConnector.instance.updateRewardRedemption(
  id: id,
  isRedeemed: isRedeemed,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateRewardRedemption(
  id: id,
  isRedeemed: isRedeemed,
);
UpdateRewardRedemptionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
bool isRedeemed = ...;

final ref = ExampleConnector.instance.updateRewardRedemption(
  id: id,
  isRedeemed: isRedeemed,
).ref();
ref.execute();
```

