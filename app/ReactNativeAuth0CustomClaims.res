

@unboxed
type rec any = Any('a): any
type rec authorizeUrlParams = {
  responseType: string,
  redirectUri: string,
  state: string,
}
type createUserParams<'a> = {
  email: string,
  username: option<string>,
  password: string,
  connection: string,
  metadata: option<'a>,
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
module PasswordRealmResponse_tokenType = {
  type t = string
  @bs.inline
  let bearer = "Bearer"
}
type passwordRealmResponse = {
  accessToken: string,
  expiresIn: int,
  idToken: string,
  scope: string,
  tokenType: PasswordRealmResponse_tokenType.t,
  refreshToken: option<string>,
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
type rec passwordlessWithEmailParams_authParams = any
type passwordlessWithEmailParams = {
  email: string,
  send: option<passwordlessWithEmailParamsSend>,
  authParams: option<passwordlessWithEmailParams_authParams>,
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
type userInfo_CustomClaims = any
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
type userInfo<'CustomClaims> = (userInfo_1, 'CustomClaims)
type auth_userInfo_CustomClaims = any
type auth<'a, 'CustomClaims> = {
  authorizeUrl: (~params: authorizeUrlParams) => string,
  createUser: (~user: createUserParams<'a>) => Js.Promise.t<unit>,
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
type auth0User<'a> = {
  created_at: string,
  email: string,
  emailVerified: bool,
  identities: array<any>,
  last_ip: option<string>,
  last_login: option<string>,
  logins_count: int,
  name: string,
  nickname: string,
  picture: option<string>,
  updated_at: string,
  userId: string,
  userMetadata: option<'a>,
}
type getUserParams = {id: string}
type patchUserParams<'a> = {
  id: string,
  metadata: 'a,
}
type users<'a> = {
  getUser: (~parameters: getUserParams) => Js.Promise.t<unit>,
  patchUser: (~parameters: patchUserParams<'a>) => Js.Promise.t<unit>,
}
type authorizeParams = {
  state: option<string>,
  nonce: option<string>,
  audience: option<string>,
  scope: option<string>,
  connection: option<string>,
  language: option<string>,
  prompt: option<string>,
}
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
  ) => Js.Promise.t<unit>,
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

type auth0<'a> = {
  auth: auth<'a, 'a>,
  webAuth: webAuth,
  users: (~token: string) => users<'a>,
}
type generatedAuth0Client = {
  "authorize": @bs.meth (unit => unit),
  "isAuthenticated": @bs.meth (bool => unit),
}
type t
@bs.module @bs.new external make: options => auth0<'a> = "react-native-auth0"
