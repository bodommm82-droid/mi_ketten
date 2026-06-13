import { ConnectorConfig, DataConnect, QueryRef, QueryPromise, ExecuteQueryOptions, MutationRef, MutationPromise, DataConnectSettings } from 'firebase/data-connect';

export const connectorConfig: ConnectorConfig;
export const dataConnectSettings: DataConnectSettings;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;




export interface Challenge_Key {
  id: UUIDString;
  __typename?: 'Challenge_Key';
}

export interface Completion_Key {
  id: UUIDString;
  __typename?: 'Completion_Key';
}

export interface Couple_Key {
  id: UUIDString;
  __typename?: 'Couple_Key';
}

export interface CreateUserAccountData {
  user_insert: User_Key;
}

export interface CreateUserAccountVariables {
  name: string;
  email: string;
}

export interface GetCouplePointsData {
  couple?: {
    totalPoints: number;
    nickname?: string | null;
  };
}

export interface GetCouplePointsVariables {
  id: UUIDString;
}

export interface LogChallengeCompletionData {
  completion_insert: Completion_Key;
}

export interface LogChallengeCompletionVariables {
  challengeId: UUIDString;
  coupleId: UUIDString;
  comment?: string | null;
}

export interface Reward_Key {
  id: UUIDString;
  __typename?: 'Reward_Key';
}

export interface UpdateRewardRedemptionData {
  reward_update?: Reward_Key | null;
}

export interface UpdateRewardRedemptionVariables {
  id: UUIDString;
  isRedeemed: boolean;
}

export interface User_Key {
  id: UUIDString;
  __typename?: 'User_Key';
}

interface CreateUserAccountRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: CreateUserAccountVariables): MutationRef<CreateUserAccountData, CreateUserAccountVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: CreateUserAccountVariables): MutationRef<CreateUserAccountData, CreateUserAccountVariables>;
  operationName: string;
}
export const createUserAccountRef: CreateUserAccountRef;

export function createUserAccount(vars: CreateUserAccountVariables): MutationPromise<CreateUserAccountData, CreateUserAccountVariables>;
export function createUserAccount(dc: DataConnect, vars: CreateUserAccountVariables): MutationPromise<CreateUserAccountData, CreateUserAccountVariables>;

interface LogChallengeCompletionRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: LogChallengeCompletionVariables): MutationRef<LogChallengeCompletionData, LogChallengeCompletionVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: LogChallengeCompletionVariables): MutationRef<LogChallengeCompletionData, LogChallengeCompletionVariables>;
  operationName: string;
}
export const logChallengeCompletionRef: LogChallengeCompletionRef;

export function logChallengeCompletion(vars: LogChallengeCompletionVariables): MutationPromise<LogChallengeCompletionData, LogChallengeCompletionVariables>;
export function logChallengeCompletion(dc: DataConnect, vars: LogChallengeCompletionVariables): MutationPromise<LogChallengeCompletionData, LogChallengeCompletionVariables>;

interface GetCouplePointsRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: GetCouplePointsVariables): QueryRef<GetCouplePointsData, GetCouplePointsVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: GetCouplePointsVariables): QueryRef<GetCouplePointsData, GetCouplePointsVariables>;
  operationName: string;
}
export const getCouplePointsRef: GetCouplePointsRef;

export function getCouplePoints(vars: GetCouplePointsVariables, options?: ExecuteQueryOptions): QueryPromise<GetCouplePointsData, GetCouplePointsVariables>;
export function getCouplePoints(dc: DataConnect, vars: GetCouplePointsVariables, options?: ExecuteQueryOptions): QueryPromise<GetCouplePointsData, GetCouplePointsVariables>;

interface UpdateRewardRedemptionRef {
  /* Allow users to create refs without passing in DataConnect */
  (vars: UpdateRewardRedemptionVariables): MutationRef<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;
  /* Allow users to pass in custom DataConnect instances */
  (dc: DataConnect, vars: UpdateRewardRedemptionVariables): MutationRef<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;
  operationName: string;
}
export const updateRewardRedemptionRef: UpdateRewardRedemptionRef;

export function updateRewardRedemption(vars: UpdateRewardRedemptionVariables): MutationPromise<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;
export function updateRewardRedemption(dc: DataConnect, vars: UpdateRewardRedemptionVariables): MutationPromise<UpdateRewardRedemptionData, UpdateRewardRedemptionVariables>;

