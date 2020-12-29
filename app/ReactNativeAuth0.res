// @unboxed
// type rec any = Any('a): any
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
// type rec passwordlessWithEmailParams_authParams = any
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
type userInfo_1 = {
  email: string,
  emailVerified: bool,
  familyName: string,
  givenName: string,
  name: string,
  nickname: string,
  picture: string,
  sub: string,
  updatedAt: string,
}
type auth = {
  authorizeUrl: (~params: authorizeUrlParams) => string,
  createUser: (~user: createUserParams) => Js.Promise.t<unit>,
  exchange: (~params: exchangeParams) => Js.Promise.t<unit>,
  logoutUrl: (~params: logoutParams) => string,
  passwordRealm: (~params: passwordRealmParams) => Js.Promise.t<unit>,
  refreshToken: (~params: refreshTokenParams) => Js.Promise.t<unit>,
  resetPassword: (~params: resetPasswordParams) => Js.Promise.t<unit>,
  revoke: (~params: revokeParams) => Js.Promise.t<unit>,
  userInfo: (~params: userInfoParams) => Js.Promise.t<unit>,
  passwordlessWithEmail: (~params: passwordlessWithEmailParams) => Js.Promise.t<unit>,
  passwordlessWithSMS: (~params: passwordlessWithSMSParams) => Js.Promise.t<unit>,
  loginWithEmail: (~params: loginWithEmailParams) => Js.Promise.t<unit>,
  loginWithSMS: (~params: loginWithSMSParams) => Js.Promise.t<unit>,
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
// type authorizeParams = {
//   state: option<string>,
//   nonce: option<string>,
//   audience: option<string>,
//   scope: option<string>,
//   connection: option<string>,
//   language: option<string>,
//   prompt: option<string>,
// }

type authorizeParams
@bs.obj
external authorizeParams: (
  ~state: string=?,
  ~nonce: string=?,
  ~audience: string=?,
  ~scope: string=?,
  ~connection: string=?,
  ~language: string=?,
  ~prompt: string=?,
  unit,
) => authorizeParams = ""
type authorizeOptions = {ephemeralSession: option<bool>}
type clearSessionParams = {federated: bool}
type credentials = {
  accessToken: string,
  idToken: string,
  refreshToken: option<string>,
  expiresIn: int,
  scope: string,
  tokenType: string,
}
type webAuth = {
  authorize: (
    ~parameters: authorizeParams,
    ~options: option<authorizeOptions>=?,
    unit,
  ) => Js.Promise.t<credentials>,
  clearSession: (~parameters: option<clearSessionParams>=?, unit) => Js.Promise.t<unit>,
}
type options = {
  domain: string,
  clientId: string,
}
type usersOptions = {
  baseUrl: string,
  token: string,
}

type auth0 = {
  auth: auth,
  webAuth: webAuth,
  //   users: (~token: string) => users<'a>,
}

// @bs.deriving(abstract)
// type authorizeParamsJs = {
//   @bs.optional
//   state: string,
//   @bs.optional
//   nonce: string,
//   @bs.optional
//   audience: string,
//   @bs.optional
//   scope: string,
//   @bs.optional
//   connection: string,
//   @bs.optional
//   language: string,
//   @bs.optional
//   prompt: string,
// }
// type authorizeParamsObj
// @bs.obj
// external authorizeParamsObj: (
//   ~state: string=?,
//   ~nonce: string=?,
//   ~audience: string=?,
//   ~scope: string=?,
//   ~connection: string=?,
//   ~language: string=?,
//   ~prompt: string=?,
//   unit,
// ) => authorizeParamsObj = ""
// type auth0Client = {
//   "authorize": (
//     @bs.meth ~parameters: authorizeParamsObj,
//     ~options: option<authorizeOptions>=?,
//     unit,
//   ) => Js.Promise.t<credentials>,
//   //   "isAuthenticated": @bs.meth (bool => unit),
//   "clearSession": (~parameters: option<clearSessionParams>=?, unit) => Js.Promise.t<unit>,
// }
// type
type webAuthClient
// @bs.module("react-native-auth0")
// external webAuthClient: webAuth = "WebAuth"
// type authClient
// @bs.module("react-native-auth0")
// external authClient: auth =>authClient= "Auth"

// type auth0Client = {
//   auth: authClient,
//   webAuth: webAuthClient,
//   //   users: (~token: string) => users<'a>,
// }
// let auth0Client = {
//   auth: authClient,
//   webAuth: webAuthClient,
//   //   users: (~token: string) => users<'a>,
// }
// type auth0Client = {"auth": _auth}
type t
@bs.module("react-native-auth0") @bs.new
external rnAuth0: options => t = "default"

@bs.module("react-native-auth0")
external webAuthClient: (t)=>webAuth = "WebAuth"
@bs.module("react-native-auth0")@bs.new
external authClient: (t,auth) = "Auth"


// @bs.send
// external createClient: (t, options) => auth0 = ""

// let createClient = options => createClient(rnAuth0, options)

@bs.module("react-native-auth0") @bs.new
external createClient: options =>auth0 = "default"
let options: options = {
  clientId: "GDuiq4x1reJXs8a6yDXgqJcNAc8QBOjX",
  domain: "klik.eu.auth0.com",
}
let client = createClient(options)
// let webAuthClient = webAuthClient(client)
// let client = createClient(credentials)
// let credentials = client.authorize(
//   ~parameters=authorizeParams(~scope=[Scopes.openId, Scopes.profile, Scopes.email], ()),
// )
