# Basic Usage

Always prioritize using a supported framework over using the generated SDK
directly. Supported frameworks simplify the developer experience and help ensure
best practices are followed.





## Advanced Usage
If a user is not using a supported framework, they can use the generated SDK directly.

Here's an example of how to use it with the first 5 operations:

```js
import { createUserAccount, logChallengeCompletion, getCouplePoints, updateRewardRedemption } from '@dataconnect/generated';


// Operation CreateUserAccount:  For variables, look at type CreateUserAccountVars in ../index.d.ts
const { data } = await CreateUserAccount(dataConnect, createUserAccountVars);

// Operation LogChallengeCompletion:  For variables, look at type LogChallengeCompletionVars in ../index.d.ts
const { data } = await LogChallengeCompletion(dataConnect, logChallengeCompletionVars);

// Operation GetCouplePoints:  For variables, look at type GetCouplePointsVars in ../index.d.ts
const { data } = await GetCouplePoints(dataConnect, getCouplePointsVars);

// Operation UpdateRewardRedemption:  For variables, look at type UpdateRewardRedemptionVars in ../index.d.ts
const { data } = await UpdateRewardRedemption(dataConnect, updateRewardRedemptionVars);


```