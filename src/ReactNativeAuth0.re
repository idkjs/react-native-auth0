/* Please note: */
/* --- */
/* The Playground is still a work in progress */
/* ReScript / old Reason syntax should parse just */
/* fine (go to the "Settings" panel for toggling syntax). */

/* Feel free to play around and compile some */
/* ReScript code! */
[@unboxed]
type any =
  | Any('a): any;
type nonrec authorizeUrlParams = {
  responseType: string,
  redirectUri: string,
  state: string,
};
type nonrec metadata;
type nonrec createUserParams = {
  email: string,
  username: option(string),
  password: string,
  connection: string,
  metadata: option(metadata),
};
type nonrec createUserResponse = {
  [@bs.as "Id"]
  id: string,
  emailVerified: bool,
  email: string,
};
type nonrec exchangeResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  refreshToken: string,
  scope: option(string),
  tokenType: string,
};
type nonrec exchangeParams = {
  code: string,
  redirectUri: string,
  verifier: string,
};
type nonrec logoutParams = {
  federated: bool,
  clientId: option(string),
  returnTo: option(string),
};
type nonrec passwordRealmParams = {
  username: string,
  password: string,
  realm: string,
  audience: option(string),
  scope: option(string),
};
module PasswordRealmResponseTokenType = {
  type nonrec t = string;
  [@bs.inline]
  let bearer = "Bearer";
};
type nonrec passwordRealmResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  scope: string,
  tokenType: PasswordRealmResponseTokenType.t,
  refreshToken: option(string),
};
module Scopes = {
  type nonrec t = string;
  [@bs.inline]
  let openId = "openid";
  [@bs.inline]
  let profile = "profile";
  [@bs.inline]
  let email = "email";
  let joinWith: (array(t), t) => t =
    (arr, sep) => Js.Array.joinWith(sep, arr);
  let make: array(t) => t = arr => joinWith(arr, " ");
};
type nonrec refreshTokenResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  refreshToken: option(string),
  scope: option(string),
  tokenType: string,
};
type nonrec refreshTokenParams = {
  refreshToken: string,
  scope: option(string),
};
type nonrec revokeParams = {refreshToken: string};
type nonrec userInfoParams = {token: string};
type nonrec resetPasswordParams = {
  email: string,
  connection: string,
};
module PasswordlessWithEmailParamsSend = {
  type nonrec t = string;
  [@bs.inline]
  let link = "link";
  [@bs.inline]
  let code = "code";
};
type nonrec passwordlessWithEmailParamsSend = PasswordlessWithEmailParamsSend.t;
type nonrec authParams;

/* type metadata;*/
/* type logEvent = {*/
/*   eventName: string,*/
/*   metadata,*/
/* };*/

type nonrec passwordlessWithEmailParams = {
  email: string,
  send: option([ | `link | `code]),
  authParams: option(authParams),
};
type nonrec passwordlessWithSMSParams = {phoneNumber: string};
type nonrec loginWithEmailParams = {
  email: string,
  code: string,
  audience: option(string),
  scope: option(string),
};
type nonrec loginWithSMSParams = {
  phoneNumber: string,
  code: string,
  audience: option(string),
  scope: option(string),
};
module UserInfo = {
  type nonrec t('a) = {
    email: string,
    emailVerified: bool,
    familyName: string,
    givenName: string,
    name: string,
    nickname: string,
    picture: string,
    sub: string,
    updatedAt: string,
    customClaims: 'a,
  };
};
type nonrec auth('a) = {
  authorizeUrl: (~params: [@ns.namedArgLoc] authorizeUrlParams) => string,
  createUser:
    (~user: [@ns.namedArgLoc] createUserParams) =>
    Js.Promise.t(createUserResponse),
  exchange:
    (~params: [@ns.namedArgLoc] exchangeParams) =>
    Js.Promise.t(exchangeResponse),
  logoutUrl: (~params: [@ns.namedArgLoc] logoutParams) => string,
  passwordRealm:
    (~params: [@ns.namedArgLoc] passwordRealmParams) =>
    Js.Promise.t(passwordRealmResponse),
  refreshToken:
    (~params: [@ns.namedArgLoc] refreshTokenParams) =>
    Js.Promise.t(refreshTokenResponse),
  resetPassword:
    (~params: [@ns.namedArgLoc] resetPasswordParams) => Js.Promise.t(unit),
  revoke: (~params: [@ns.namedArgLoc] revokeParams) => Js.Promise.t(unit),
  userInfo:
    (~params: [@ns.namedArgLoc] userInfoParams) =>
    Js.Promise.t(UserInfo.t('a)),
  passwordlessWithEmail:
    (~params: [@ns.namedArgLoc] passwordlessWithEmailParams) =>
    Js.Promise.t(unit),
  passwordlessWithSMS:
    (~params: [@ns.namedArgLoc] passwordlessWithSMSParams) =>
    Js.Promise.t(any),
  loginWithEmail:
    (~params: [@ns.namedArgLoc] loginWithEmailParams) => Js.Promise.t(any),
  loginWithSMS:
    (~params: [@ns.namedArgLoc] loginWithSMSParams) => Js.Promise.t(any),
};
type nonrec identity;
type nonrec userMetadata;
type nonrec auth0User = {
  created_at: string,
  email: string,
  emailVerified: bool,
  identities: array(identity),
  last_ip: option(string),
  last_login: option(string),
  logins_count: int,
  name: string,
  nickname: string,
  picture: option(string),
  updated_at: string,
  userId: string,
  userMetadata: option(userMetadata),
};
type nonrec getUserParams = {id: string};
type nonrec patchUserParams = {
  id: string,
  metadata,
};
type nonrec users('a) = {
  getUser:
    (~parameters: [@ns.namedArgLoc] getUserParams) => Js.Promise.t(unit),
  patchUser:
    (~parameters: [@ns.namedArgLoc] patchUserParams) => Js.Promise.t(unit),
};
type nonrec credentials = {
  accessToken: string,
  idToken: string,
  refreshToken: option(string),
  expiresIn: int,
  scope: string,
  tokenType: string,
};
type nonrec authorizeParams;
[@bs.obj]
external authorizeParams:
  (~scope: [@ns.namedArgLoc] string=?, unit) => authorizeParams;
type nonrec webAuth = {
  authorize: (. authorizeParams, unit) => Js.Promise.t(credentials),
  clearSession: (. unit) => Js.Promise.t(unit),
};
type nonrec options = {
  domain: string,
  clientId: string,
};
type nonrec usersOptions = {
  baseUrl: string,
  token: string,
};

type nonrec auth0('a) = {
  auth: auth('a),
  webAuth,
  users: (~token: [@ns.namedArgLoc] string) => users('a),
};
type nonrec clientConfig = {
  domain: string,
  clientId: string,
};

[@bs.module "react-native-auth0"] [@bs.new]
external createClient: clientConfig => auth0('a) = "default";
