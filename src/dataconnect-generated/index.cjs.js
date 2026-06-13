const { queryRef, executeQuery, validateArgsWithOptions, mutationRef, executeMutation, validateArgs, makeMemoryCacheProvider } = require('firebase/data-connect');

const connectorConfig = {
  connector: 'example',
  service: 'miketten',
  location: 'europe-central2'
};
exports.connectorConfig = connectorConfig;
const dataConnectSettings = {
  cacheSettings: {
    cacheProvider: makeMemoryCacheProvider()
  }
};
exports.dataConnectSettings = dataConnectSettings;

const createUserAccountRef = (dcOrVars, vars) => {
  const { dc: dcInstance, vars: inputVars} = validateArgs(connectorConfig, dcOrVars, vars, true);
  dcInstance._useGeneratedSdk();
  return mutationRef(dcInstance, 'CreateUserAccount', inputVars);
}
createUserAccountRef.operationName = 'CreateUserAccount';
exports.createUserAccountRef = createUserAccountRef;

exports.createUserAccount = function createUserAccount(dcOrVars, vars) {
  const { dc: dcInstance, vars: inputVars } = validateArgs(connectorConfig, dcOrVars, vars, true);
  return executeMutation(createUserAccountRef(dcInstance, inputVars));
}
;

const logChallengeCompletionRef = (dcOrVars, vars) => {
  const { dc: dcInstance, vars: inputVars} = validateArgs(connectorConfig, dcOrVars, vars, true);
  dcInstance._useGeneratedSdk();
  return mutationRef(dcInstance, 'LogChallengeCompletion', inputVars);
}
logChallengeCompletionRef.operationName = 'LogChallengeCompletion';
exports.logChallengeCompletionRef = logChallengeCompletionRef;

exports.logChallengeCompletion = function logChallengeCompletion(dcOrVars, vars) {
  const { dc: dcInstance, vars: inputVars } = validateArgs(connectorConfig, dcOrVars, vars, true);
  return executeMutation(logChallengeCompletionRef(dcInstance, inputVars));
}
;

const getCouplePointsRef = (dcOrVars, vars) => {
  const { dc: dcInstance, vars: inputVars} = validateArgs(connectorConfig, dcOrVars, vars, true);
  dcInstance._useGeneratedSdk();
  return queryRef(dcInstance, 'GetCouplePoints', inputVars);
}
getCouplePointsRef.operationName = 'GetCouplePoints';
exports.getCouplePointsRef = getCouplePointsRef;

exports.getCouplePoints = function getCouplePoints(dcOrVars, varsOrOptions, options) {
  
  const { dc: dcInstance, vars: inputVars, options: inputOpts } = validateArgsWithOptions(connectorConfig, dcOrVars, varsOrOptions, options, true, true);
  return executeQuery(getCouplePointsRef(dcInstance, inputVars), inputOpts && { fetchPolicy: inputOpts.fetchPolicy });
}
;

const updateRewardRedemptionRef = (dcOrVars, vars) => {
  const { dc: dcInstance, vars: inputVars} = validateArgs(connectorConfig, dcOrVars, vars, true);
  dcInstance._useGeneratedSdk();
  return mutationRef(dcInstance, 'UpdateRewardRedemption', inputVars);
}
updateRewardRedemptionRef.operationName = 'UpdateRewardRedemption';
exports.updateRewardRedemptionRef = updateRewardRedemptionRef;

exports.updateRewardRedemption = function updateRewardRedemption(dcOrVars, vars) {
  const { dc: dcInstance, vars: inputVars } = validateArgs(connectorConfig, dcOrVars, vars, true);
  return executeMutation(updateRewardRedemptionRef(dcInstance, inputVars));
}
;
