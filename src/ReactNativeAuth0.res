@unboxed
type rec any = Any('a): any
type rec authorizeUrlParams = {
  responseType: string,
  redirectUri: string,
  state: string,
}
type metadata
type createUserParams = {
  email: string,
  username: option<string>,
  password: string,
  connection: string,
  metadata: option<metadata>,
}
type createUserResponse = {
  @bs.as("Id")
  id: string,
  emailVerified: bool,
  email: string,
}
type exchangeResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  refreshToken: string,
  scope: option<string>,
  tokenType: string,
}
type exchangeParams = {
  code: string,
  redirectUri: string,
  verifier: string,
}
type logoutParams = {
  federated: bool,
  clientId: option<string>,
  returnTo: option<string>,
}
type passwordRealmParams = {
  username: string,
  password: string,
  realm: string,
  audience: option<string>,
  scope: option<string>,
}
module PasswordRealmResponseTokenType = {
  type t = string
  @bs.inline
  let bearer = "Bearer"
}
type passwordRealmResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  scope: string,
  tokenType: PasswordRealmResponseTokenType.t,
  refreshToken: option<string>,
}
module Scopes = {
  type t = string
  @bs.inline
  let openId = "openid"
  @bs.inline
  let profile = "profile"
  @bs.inline
  let email = "email"
  let joinWith: (array<t>, t) => t = (arr, sep) =>
  Js.Array.joinWith(sep, arr)
  let make: array<t> => t = arr => joinWith(arr, " ")
}
type rec refreshTokenResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  refreshToken: option<string>,
  scope: option<string>,
  tokenType: string,
}
type refreshTokenParams = {
  refreshToken: string,
  scope: option<string>,
}
type revokeParams = {refreshToken: string}
type userInfoParams = {token: string}
type resetPasswordParams = {
  email: string,
  connection: string,
}
module PasswordlessWithEmailParamsSend = {
  type t = string
  @bs.inline
  let link = "link"
  @bs.inline
  let code = "code"
}
type passwordlessWithEmailParamsSend = PasswordlessWithEmailParamsSend.t
type rec authParams
/**
 * Log an event
 * @param {string} eventName
 * @param {[key: string]: string} metadata
 */
// type metadata;
// type logEvent = {
//   eventName: string,
//   metadata,
// };

type passwordlessWithEmailParams = {
  email: string,
  send: option<[#link | #code]>,
  authParams: option<authParams>,
}
type passwordlessWithSMSParams = {phoneNumber: string}
type loginWithEmailParams = {
  email: string,
  code: string,
  audience: option<string>,
  scope: option<string>,
}
type loginWithSMSParams = {
  phoneNumber: string,
  code: string,
  audience: option<string>,
  scope: option<string>,
}
module UserInfo = {
  type t<'a> = {
    email: string,
    emailVerified: bool,
    familyName: string,
    givenName: string,
    name: string,
    nickname: string,
    picture: string,
    sub: string,
    updatedAt: string,
    customClaims:'a
  }
}
type auth<'a> = {
  authorizeUrl: (~params: authorizeUrlParams) => string,
  createUser: (~user: createUserParams) => Js.Promise.t<createUserResponse>,
  exchange: (~params: exchangeParams) => Js.Promise.t<exchangeResponse>,
  logoutUrl: (~params: logoutParams) => string,
  passwordRealm: (~params: passwordRealmParams) => Js.Promise.t<passwordRealmResponse>,
  refreshToken: (~params: refreshTokenParams) => Js.Promise.t<refreshTokenResponse>,
  resetPassword: (~params: resetPasswordParams) => Js.Promise.t<unit>,
  revoke: (~params: revokeParams) => Js.Promise.t<unit>,
  userInfo: (~params: userInfoParams) => Js.Promise.t<UserInfo.t<'a>>,
  passwordlessWithEmail: (~params: passwordlessWithEmailParams) => Js.Promise.t<unit>,
  passwordlessWithSMS: (~params: passwordlessWithSMSParams) => Js.Promise.t<any>,
  loginWithEmail: (~params: loginWithEmailParams) => Js.Promise.t<any>,
  loginWithSMS: (~params: loginWithSMSParams) => Js.Promise.t<any>,
}
type identity
type userMetadata
type auth0User = {
  created_at: string,
  email: string,
  emailVerified: bool,
  identities: array<identity>,
  last_ip: option<string>,
  last_login: option<string>,
  logins_count: int,
  name: string,
  nickname: string,
  picture: option<string>,
  updated_at: string,
  userId: string,
  userMetadata: option<userMetadata>,
}
type getUserParams = {id: string}
type patchUserParams = {
  id: string,
  metadata: metadata,
}
type users<'a> = {
  getUser: (~parameters: getUserParams) => Js.Promise.t<unit>,
  patchUser: (~parameters: patchUserParams) => Js.Promise.t<unit>,
}
type credentials = {
  accessToken: string,
  idToken: string,
  refreshToken: option<string>,
  expiresIn: int,
  scope: string,
  tokenType: string,
}
type authorizeParams
@bs.obj
external authorizeParams: (~scope: string=?, unit) => authorizeParams = ""
type webAuth = {
  authorize: (. authorizeParams, unit) => Js.Promise.t<credentials>,
  clearSession: (. unit )=> Js.Promise.t<unit>,
}
type options = {
  domain: string,
  clientId: string,
}
type usersOptions = {
  baseUrl: string,
  token: string,
}

type auth0<'a> = {
  auth: auth<'a>,
  webAuth: webAuth,
  users: (~token: string) => users<'a>,
}
type clientConfig = {
  domain: string,
  clientId: string,
}

@bs.module("react-native-auth0") @bs.new
external createClient: clientConfig => auth0<'a> = "default"
