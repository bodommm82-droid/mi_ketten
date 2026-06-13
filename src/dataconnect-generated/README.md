# Generated TypeScript README
This README will guide you through the process of using the generated JavaScript SDK package for the connector `example`. It will also provide examples on how to use your generated SDK to call your Data Connect queries and mutations.

***NOTE:** This README is generated alongside the generated SDK. If you make changes to this file, they will be overwritten when the SDK is regenerated.*

# Table of Contents
- [**Overview**](#generated-javascript-readme)
- [**Accessing the connector**](#accessing-the-connector)
  - [*Connecting to the local Emulator*](#connecting-to-the-local-emulator)
- [**Queries**](#queries)
  - [*GetCouplePoints*](#getcouplepoints)
- [**Mutations**](#mutations)
  - [*CreateUserAccount*](#createuseraccount)
  - [*LogChallengeCompletion*](#logchallengecompletion)
  - [*UpdateRewardRedemption*](#updaterewardredemption)

# Accessing the connector
A connector is a collection of Queries and Mutations. One SDK is generated for each connector - this SDK is generated for the connector `example`. You can find more information about connectors in the [Data Connect documentation](https://firebase.google.com/docs/data-connect#how-does).

You can use this generated SDK by importing from the package `@dataconnect/generated` as shown below. Both CommonJS and ESM imports are supported.

You can also follow the instructions from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#set-client).

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig } from '@dataconnect/generated';

const dataConnect = getDataConnect(connectorConfig);
```

## Connecting to the local Emulator
By default, the connector will connect to the production service.

To connect to the emulator, you can use the following code.
You can also follow the emulator instructions from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#instrument-clients).

```typescript
import { connectDataConnectEmulator, getDataConnect } from 'firebase/data-connect';
import { connectorConfig } from '@dataconnect/generated';

const dataConnect = getDataConnect(connectorConfig);
connectDataConnectEmulator(dataConnect, 'localhost', 9399);
```

After it's initialized, you can call your Data Connect [queries](#queries) and [mutations](#mutations) from your generated SDK.

# Queries

There are two ways to execute a Data Connect Query using the generated Web SDK:
- Using a Query Reference function, which returns a `QueryRef`
  - The `QueryRef` can be used as an argument to `executeQuery()`, which will execute the Query and return a `QueryPromise`
- Using an action shortcut function, which returns a `QueryPromise`
  - Calling the action shortcut function will execute the Query and return a `QueryPromise`

The following is true for both the action shortcut function and the `QueryRef` function:
- The `QueryPromise` returned will resolve to the result of the Query once it has finished executing
- If the Query accepts arguments, both the action shortcut function and the `QueryRef` function accept a single argument: an object that contains all the required variables (and the optional variables) for the Query
- Both functions can be called with or without passing in a `DataConnect` instance as an argument. If no `DataConnect` argument is passed in, then the generated SDK will call `getDataConnect(connectorConfig)` behind the scenes for you.

Below are examples of how to use the `example` connector's generated functions to execute each query. You can also follow the examples from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#using-queries).

## GetCouplePoints
You can execute the `GetCouplePoints` query using the following action shortcut function, or by calling `executeQuery()` after calling the following `QueryRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
getCouplePoints(vars: GetCouplePointsVariables, options?: ExecuteQueryOptions): QueryPromise<GetCouplePointsData, GetCouplePointsVariables>;

interface GetCouplePointsRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: GetCouplePointsVariables): QueryRef<GetCouplePointsData, GetCouplePointsVariables>;
}
export const getCouplePointsRef: GetCouplePointsRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `QueryRef` function.
```typescript
getCouplePoints(dc: DataConnect, vars: GetCouplePointsVariables, options?: ExecuteQueryOptions): QueryPromise<GetCouplePointsData, GetCouplePointsVariables>;

interface GetCouplePointsRef {
  ...
  (dc: DataConnect, vars: GetCouplePointsVariables): QueryRef<GetCouplePointsData, GetCouplePointsVariables>;
}
export const getCouplePointsRef: GetCouplePointsRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the getCouplePointsRef:
```typescript
const name = getCouplePointsRef.operationName;
console.log(name);
```

### Variables
The `GetCouplePoints` query requires an argument of type `GetCouplePointsVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface GetCouplePointsVariables {
  id: UUIDString;
}
```
### Return Type
Recall that executing the `GetCouplePoints` query returns a `QueryPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `GetCouplePointsData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface GetCouplePointsData {
  couple?: {
    totalPoints: number;
    nickname?: string | null;
  };
}
```
### Using `GetCouplePoints`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, getCouplePoints, GetCouplePointsVariables } from '@dataconnect/generated';

// The `GetCouplePoints` query requires an argument of type `GetCouplePointsVariables`:
const getCouplePointsVars: GetCouplePointsVariables = {
  id: ..., 
};

// Call the `getCouplePoints()` function to execute the query.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await getCouplePoints(getCouplePointsVars);
// Variables can be defined inline as well.
const { data } = await getCouplePoints({ id: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await getCouplePoints(dataConnect, getCouplePointsVars);

console.log(data.couple);

// Or, you can use the `Promise` API.
getCouplePoints(getCouplePointsVars).then((response) => {
  const data = response.data;
  console.log(data.couple);
});
```

### Using `GetCouplePoints`'s `QueryRef` function

```typescript
import { getDataConnect, executeQuery } from 'firebase/data-connect';
import { connectorConfig, getCouplePointsRef, GetCouplePointsVariables } from '@dataconnect/generated';

// The `GetCouplePoints` query requires an argument of type `GetCouplePointsVariables`:
const getCouplePointsVars: GetCouplePointsVariables = {
  id: ..., 
};

// Call the `getCouplePointsRef()` function to get a reference to the query.
const ref = getCouplePointsRef(getCouplePointsVars);
// Variables can be defined inline as well.
const ref = getCouplePointsRef({ id: ..., });

// You can also pass in a `DataConnect` instance to the `QueryRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = getCouplePointsRef(dataConnect, getCouplePointsVars);

// Call `executeQuery()` on the reference to execute the query.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeQuery(ref);

console.log(data.couple);

// Or, you can use the `Promise` API.
executeQuery(ref).then((response) => {
  const data = response.data;
  console.log(data.couple);
});
```

# Mutations

There are two ways to execute a Data Connect Mutation using the generated Web SDK:
- Using a Mutation Reference function, which returns a `MutationRef`
  - The `MutationRef` can be used as an argument to `executeMutation()`, which will execute the Mutation and return a `MutationPromise`
- Using an action shortcut function, which returns a `MutationPromise`
  - Calling the action shortcut function will execute the Mutation and return a `MutationPromise`

The following is true for both the action shortcut function and the `MutationRef` function:
- The `MutationPromise` returned will resolve to the result of the Mutation once it has finished executing
- If the Mutation accepts arguments, both the action shortcut function and the `MutationRef` function accept a single argument: an object that contains all the required variables (and the optional variables) for the Mutation
- Both functions can be called with or without passing in a `DataConnect` instance as an argument. If no `DataConnect` argument is passed in, then the generated SDK will call `getDataConnect(connectorConfig)` behind the scenes for you.

Below are examples of how to use the `example` connector's generated functions to execute each mutation. You can also follow the examples from the [Data Connect documentation](https://firebase.google.com/docs/data-connect/web-sdk#using-mutations).

## CreateUserAccount
You can execute the `CreateUserAccount` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
createUserAccount(vars: CreateUserAccountVariables): MutationPromise<CreateUserAccountData, CreateUserAccountVariables>;

interface CreateUserAccountRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: CreateUserAccountVariables): MutationRef<CreateUserAccountData, CreateUserAccountVariables>;
}
export const createUserAccountRef: CreateUserAccountRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
createUserAccount(dc: DataConnect, vars: CreateUserAccountVariables): MutationPromise<CreateUserAccountData, CreateUserAccountVariables>;

interface CreateUserAccountRef {
  ...
  (dc: DataConnect, vars: CreateUserAccountVariables): MutationRef<CreateUserAccountData, CreateUserAccountVariables>;
}
export const createUserAccountRef: CreateUserAccountRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the createUserAccountRef:
```typescript
const name = createUserAccountRef.operationName;
console.log(name);
```

### Variables
The `CreateUserAccount` mutation requires an argument of type `CreateUserAccountVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface CreateUserAccountVariables {
  name: string;
  email: string;
}
```
### Return Type
Recall that executing the `CreateUserAccount` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `CreateUserAccountData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface CreateUserAccountData {
  user_insert: User_Key;
}
```
### Using `CreateUserAccount`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, createUserAccount, CreateUserAccountVariables } from '@dataconnect/generated';

// The `CreateUserAccount` mutation requires an argument of type `CreateUserAccountVariables`:
const createUserAccountVars: CreateUserAccountVariables = {
  name: ..., 
  email: ..., 
};

// Call the `createUserAccount()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await createUserAccount(createUserAccountVars);
// Variables can be defined inline as well.
const { data } = await createUserAccount({ name: ..., email: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await createUserAccount(dataConnect, createUserAccountVars);

console.log(data.user_insert);

// Or, you can use the `Promise` API.
createUserAccount(createUserAccountVars).then((response) => {
  const data = response.data;
  console.log(data.user_insert);
});
```

### Using `CreateUserAccount`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, createUserAccountRef, CreateUserAccountVariables } from '@dataconnect/generated';

// The `CreateUserAccount` mutation requires an argument of type `CreateUserAccountVariables`:
const createUserAccountVars: CreateUserAccountVariables = {
  name: ..., 
  email: ..., 
};

// Call the `createUserAccountRef()` function to get a reference to the mutation.
const ref = createUserAccountRef(createUserAccountVars);
// Variables can be defined inline as well.
const ref = createUserAccountRef({ name: ..., email: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = createUserAccountRef(dataConnect, createUserAccountVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.user_insert);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.user_insert);
});
```

## LogChallengeCompletion
You can execute the `LogChallengeCompletion` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
logChallengeCompletion(vars: LogChallengeCompletionVariables): MutationPromise<LogChallengeCompletionData, LogChallengeCompletionVariables>;

interface LogChallengeCompletionRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: LogChallengeCompletionVariables): MutationRef<LogChallengeCompletionData, LogChallengeCompletionVariables>;
}
export const logChallengeCompletionRef: LogChallengeCompletionRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
logChallengeCompletion(dc: DataConnect, vars: LogChallengeCompletionVariables): MutationPromise<LogChallengeCompletionData, LogChallengeCompletionVariables>;

interface LogChallengeCompletionRef {
  ...
  (dc: DataConnect, vars: LogChallengeCompletionVariables): MutationRef<LogChallengeCompletionData, LogChallengeCompletionVariables>;
}
export const logChallengeCompletionRef: LogChallengeCompletionRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the logChallengeCompletionRef:
```typescript
const name = logChallengeCompletionRef.operationName;
console.log(name);
```

### Variables
The `LogChallengeCompletion` mutation requires an argument of type `LogChallengeCompletionVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface LogChallengeCompletionVariables {
  challengeId: UUIDString;
  coupleId: UUIDString;
  comment?: string | null;
}
```
### Return Type
Recall that executing the `LogChallengeCompletion` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `LogChallengeCompletionData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface LogChallengeCompletionData {
  completion_insert: Completion_Key;
}
```
### Using `LogChallengeCompletion`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, logChallengeCompletion, LogChallengeCompletionVariables } from '@dataconnect/generated';

// The `LogChallengeCompletion` mutation requires an argument of type `LogChallengeCompletionVariables`:
const logChallengeCompletionVars: LogChallengeCompletionVariables = {
  challengeId: ..., 
  coupleId: ..., 
  comment: ..., // optional
};

// Call the `logChallengeCompletion()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await logChallengeCompletion(logChallengeCompletionVars);
// Variables can be defined inline as well.
const { data } = await logChallengeCompletion({ challengeId: ..., coupleId: ..., comment: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await logChallengeCompletion(dataConnect, logChallengeCompletionVars);

console.log(data.completion_insert);

// Or, you can use the `Promise` API.
logChallengeCompletion(logChallengeCompletionVars).then((response) => {
  const data = response.data;
  console.log(data.completion_insert);
});
```

### Using `LogChallengeCompletion`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, logChallengeCompletionRef, LogChallengeCompletionVariables } from '@dataconnect/generated';

// The `LogChallengeCompletion` mutation requires an argument of type `LogChallengeCompletionVariables`:
const logChallengeCompletionVars: LogChallengeCompletionVariables = {
  challengeId: ..., 
  coupleId: ..., 
  comment: ..., // optional
};

// Call the `logChallengeCompletionRef()` function to get a reference to the mutation.
const ref = logChallengeCompletionRef(logChallengeCompletionVars);
// Variables can be defined inline as well.
const ref = logChallengeCompletionRef({ challengeId: ..., coupleId: ..., comment: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = logChallengeCompletionRef(dataConnect, logChallengeCompletionVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.completion_insert);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.completion_insert);
});
```

## UpdateRewardRedemption
You can execute the `UpdateRewardRedemption` mutation using the following action shortcut function, or by calling `executeMutation()` after calling the following `MutationRef` function, both of which are defined in [dataconnect-generated/index.d.ts](./index.d.ts):
```typescript
updateRewardRedemption(vars: UpdateRewardRedemptionVariables): MutationPromise<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;

interface UpdateRewardRedemptionRef {
  ...
  /* Allow users to create refs without passing in DataConnect */
  (vars: UpdateRewardRedemptionVariables): MutationRef<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;
}
export const updateRewardRedemptionRef: UpdateRewardRedemptionRef;
```
You can also pass in a `DataConnect` instance to the action shortcut function or `MutationRef` function.
```typescript
updateRewardRedemption(dc: DataConnect, vars: UpdateRewardRedemptionVariables): MutationPromise<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;

interface UpdateRewardRedemptionRef {
  ...
  (dc: DataConnect, vars: UpdateRewardRedemptionVariables): MutationRef<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;
}
export const updateRewardRedemptionRef: UpdateRewardRedemptionRef;
```

If you need the name of the operation without creating a ref, you can retrieve the operation name by calling the `operationName` property on the updateRewardRedemptionRef:
```typescript
const name = updateRewardRedemptionRef.operationName;
console.log(name);
```

### Variables
The `UpdateRewardRedemption` mutation requires an argument of type `UpdateRewardRedemptionVariables`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:

```typescript
export interface UpdateRewardRedemptionVariables {
  id: UUIDString;
  isRedeemed: boolean;
}
```
### Return Type
Recall that executing the `UpdateRewardRedemption` mutation returns a `MutationPromise` that resolves to an object with a `data` property.

The `data` property is an object of type `UpdateRewardRedemptionData`, which is defined in [dataconnect-generated/index.d.ts](./index.d.ts). It has the following fields:
```typescript
export interface UpdateRewardRedemptionData {
  reward_update?: Reward_Key | null;
}
```
### Using `UpdateRewardRedemption`'s action shortcut function

```typescript
import { getDataConnect } from 'firebase/data-connect';
import { connectorConfig, updateRewardRedemption, UpdateRewardRedemptionVariables } from '@dataconnect/generated';

// The `UpdateRewardRedemption` mutation requires an argument of type `UpdateRewardRedemptionVariables`:
const updateRewardRedemptionVars: UpdateRewardRedemptionVariables = {
  id: ..., 
  isRedeemed: ..., 
};

// Call the `updateRewardRedemption()` function to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await updateRewardRedemption(updateRewardRedemptionVars);
// Variables can be defined inline as well.
const { data } = await updateRewardRedemption({ id: ..., isRedeemed: ..., });

// You can also pass in a `DataConnect` instance to the action shortcut function.
const dataConnect = getDataConnect(connectorConfig);
const { data } = await updateRewardRedemption(dataConnect, updateRewardRedemptionVars);

console.log(data.reward_update);

// Or, you can use the `Promise` API.
updateRewardRedemption(updateRewardRedemptionVars).then((response) => {
  const data = response.data;
  console.log(data.reward_update);
});
```

### Using `UpdateRewardRedemption`'s `MutationRef` function

```typescript
import { getDataConnect, executeMutation } from 'firebase/data-connect';
import { connectorConfig, updateRewardRedemptionRef, UpdateRewardRedemptionVariables } from '@dataconnect/generated';

// The `UpdateRewardRedemption` mutation requires an argument of type `UpdateRewardRedemptionVariables`:
const updateRewardRedemptionVars: UpdateRewardRedemptionVariables = {
  id: ..., 
  isRedeemed: ..., 
};

// Call the `updateRewardRedemptionRef()` function to get a reference to the mutation.
const ref = updateRewardRedemptionRef(updateRewardRedemptionVars);
// Variables can be defined inline as well.
const ref = updateRewardRedemptionRef({ id: ..., isRedeemed: ..., });

// You can also pass in a `DataConnect` instance to the `MutationRef` function.
const dataConnect = getDataConnect(connectorConfig);
const ref = updateRewardRedemptionRef(dataConnect, updateRewardRedemptionVars);

// Call `executeMutation()` on the reference to execute the mutation.
// You can use the `await` keyword to wait for the promise to resolve.
const { data } = await executeMutation(ref);

console.log(data.reward_update);

// Or, you can use the `Promise` API.
executeMutation(ref).then((response) => {
  const data = response.data;
  console.log(data.reward_update);
});
```

