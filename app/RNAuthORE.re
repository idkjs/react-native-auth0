// /* @unboxed*/
// /* type rec any = Any('a): any*/
// type nonrec authorizeUrlParams = {
//   responseType: string,
//   redirectUri: string,
//   state: string,
// };
// type nonrec metadata;
// type nonrec createUserParams = {
//   email: string,
//   username: option(string),
//   password: string,
//   connection: string,
//   metadata: option(metadata),
// };
// type nonrec createUserResponse = {
//   [@bs.as "Id"]
//   id: string,
//   emailVerified: bool,
//   email: string,
// };
// type nonrec exchangeResponse = {
//   accessToken: string,
//   expiresIn: int,
//   idToken: string,
//   refreshToken: string,
//   scope: option(string),
//   tokenType: string,
// };
// type nonrec exchangeParams = {
//   code: string,
//   redirectUri: string,
//   verifier: string,
// };
// type nonrec logoutParams = {
//   federated: bool,
//   clientId: option(string),
//   returnTo: option(string),
// };
// type nonrec passwordRealmParams = {
//   username: string,
//   password: string,
//   realm: string,
//   audience: option(string),
//   scope: option(string),
// };
// module PasswordRealmResponseTokenType = {
//   type nonrec t = string;
//   [@bs.inline]
//   let bearer = "Bearer";
// };
// type nonrec passwordRealmResponse = {
//   accessToken: string,
//   expiresIn: int,
//   idToken: string,
//   scope: string,
//   tokenType: PasswordRealmResponseTokenType.t,
//   refreshToken: option(string),
// };
// module Scopes = {
//   type nonrec t = string;
//   [@bs.inline]
//   let openId = "openid";
//   [@bs.inline]
//   let profile = "profile";
//   [@bs.inline]
//   let email = "email";
// };
// type nonrec refreshTokenResponse = {
//   accessToken: string,
//   expiresIn: int,
//   idToken: string,
//   refreshToken: option(string),
//   scope: option(string),
//   tokenType: string,
// };
// type nonrec refreshTokenParams = {
//   refreshToken: string,
//   scope: option(string),
// };
// type nonrec revokeParams = {refreshToken: string};
// type nonrec userInfoParams = {token: string};
// type nonrec resetPasswordParams = {
//   email: string,
//   connection: string,
// };
// module PasswordlessWithEmailParamsSend = {
//   type nonrec t = string;
//   [@bs.inline]
//   let link = "link";
//   [@bs.inline]
//   let code = "code";
// };
// type nonrec passwordlessWithEmailParamsSend = PasswordlessWithEmailParamsSend.t;
// type nonrec authParams;
// /* type rec passwordlessWithEmailParams_authParams = any*/

// /* type metadata;*/
// /* type logEvent = {*/
// /*   eventName: string,*/
// /*   metadata,*/
// /* };*/

// type nonrec passwordlessWithEmailParams = {
//   email: string,
//   send: option([ | `link | `code]),
//   authParams: option(authParams),
// };
// type nonrec passwordlessWithSMSParams = {phoneNumber: string};
// type nonrec loginWithEmailParams = {
//   email: string,
//   code: string,
//   audience: option(string),
//   scope: option(string),
// };
// type nonrec loginWithSMSParams = {
//   phoneNumber: string,
//   code: string,
//   audience: option(string),
//   scope: option(string),
// };
// type nonrec userInfo_1 = {
//   email: string,
//   emailVerified: bool,
//   familyName: string,
//   givenName: string,
//   name: string,
//   nickname: string,
//   picture: string,
//   sub: string,
//   updatedAt: string,
// };
// type nonrec auth = {
//   authorizeUrl: (~params: [@ns.namedArgLoc] authorizeUrlParams) => string,
//   createUser:
//     (~user: [@ns.namedArgLoc] createUserParams) => Js.Promise.t(unit),
//   exchange: (~params: [@ns.namedArgLoc] exchangeParams) => Js.Promise.t(unit),
//   logoutUrl: (~params: [@ns.namedArgLoc] logoutParams) => string,
//   passwordRealm:
//     (~params: [@ns.namedArgLoc] passwordRealmParams) => Js.Promise.t(unit),
//   refreshToken:
//     (~params: [@ns.namedArgLoc] refreshTokenParams) => Js.Promise.t(unit),
//   resetPassword:
//     (~params: [@ns.namedArgLoc] resetPasswordParams) => Js.Promise.t(unit),
//   revoke: (~params: [@ns.namedArgLoc] revokeParams) => Js.Promise.t(unit),
//   userInfo: (~params: [@ns.namedArgLoc] userInfoParams) => Js.Promise.t(unit),
//   passwordlessWithEmail:
//     (~params: [@ns.namedArgLoc] passwordlessWithEmailParams) =>
//     Js.Promise.t(unit),
//   passwordlessWithSMS:
//     (~params: [@ns.namedArgLoc] passwordlessWithSMSParams) =>
//     Js.Promise.t(unit),
//   loginWithEmail:
//     (~params: [@ns.namedArgLoc] loginWithEmailParams) => Js.Promise.t(unit),
//   loginWithSMS:
//     (~params: [@ns.namedArgLoc] loginWithSMSParams) => Js.Promise.t(unit),
// };
// type nonrec identity;
// type nonrec userMetadata;
// type nonrec auth0User = {
//   created_at: string,
//   email: string,
//   emailVerified: bool,
//   identities: array(identity),
//   last_ip: option(string),
//   last_login: option(string),
//   logins_count: int,
//   name: string,
//   nickname: string,
//   picture: option(string),
//   updated_at: string,
//   userId: string,
//   userMetadata: option(userMetadata),
// };
// type nonrec getUserParams = {id: string};
// type nonrec patchUserParams = {
//   id: string,
//   metadata,
// };
// type nonrec users('a) = {
//   getUser:
//     (~parameters: [@ns.namedArgLoc] getUserParams) => Js.Promise.t(unit),
//   patchUser:
//     (~parameters: [@ns.namedArgLoc] patchUserParams) => Js.Promise.t(unit),
// };
// /* type authorizeParams = {*/
// /*   state: option<string>,*/
// /*   nonce: option<string>,*/
// /*   audience: option<string>,*/
// /*   scope: option<string>,*/
// /*   connection: option<string>,*/
// /*   language: option<string>,*/
// /*   prompt: option<string>,*/
// /* }*/
// type nonrec authorizeParams;
// [@bs.obj]
// external authorizeParams:
//   (
//     ~state: [@ns.namedArgLoc] string=?,
//     ~nonce: [@ns.namedArgLoc] string=?,
//     ~audience: [@ns.namedArgLoc] string=?,
//     ~scope: [@ns.namedArgLoc] string=?,
//     ~connection: [@ns.namedArgLoc] string=?,
//     ~language: [@ns.namedArgLoc] string=?,
//     ~prompt: [@ns.namedArgLoc] string=?,
//     unit
//   ) =>
//   authorizeParams;
// type nonrec authorizeOptions = {ephemeralSession: option(bool)};
// type nonrec clearSessionParams = {federated: bool};
// type nonrec credentials = {
//   accessToken: string,
//   idToken: string,
//   refreshToken: option(string),
//   expiresIn: int,
//   scope: string,
//   tokenType: string,
// };
// type nonrec webAuth = {
//   authorize:
//     (
//       ~parameters: [@ns.namedArgLoc] authorizeParams,
//       ~options: [@ns.namedArgLoc] option(authorizeOptions)=?,
//       unit
//     ) =>
//     Js.Promise.t(credentials),
//   clearSession:
//     (~parameters: [@ns.namedArgLoc] option(clearSessionParams)=?, unit) =>
//     Js.Promise.t(unit),
// };
// type  webAuth2 = {
//   authorize:
//     (
//       ~parameters: authorizeParams,
//       ~options: option(authorizeOptions)=?,
//       unit
//     ) =>
//     Js.Promise.t(credentials),
//   clearSession:
//     (~parameters: option(clearSessionParams)=?, unit) =>
//     Js.Promise.t(unit),
// };
// type nonrec options = {
//   domain: string,
//   clientId: string,
// };
// type nonrec usersOptions = {
//   baseUrl: string,
//   token: string,
// };

// type auth0Client = {
//   auth,
//   webAuth,
// };
// [@bs.module "react-native-auth0"] [@bs.new]
// external createClient: options => auth0Client = "default";
// /* @bs.deriving(abstract)*/
// /* type authorizeParamsJs = {*/
// /*   @bs.optional*/
// /*   state: string,*/
// /*   @bs.optional*/
// /*   nonce: string,*/
// /*   @bs.optional*/
// /*   audience: string,*/
// /*   @bs.optional*/
// /*   scope: string,*/
// /*   @bs.optional*/
// /*   connection: string,*/
// /*   @bs.optional*/
// /*   language: string,*/
// /*   @bs.optional*/
// /*   prompt: string,*/
// /* }*/
// /* type authorizeParamsObj*/
// /* @bs.obj*/
// /* external authorizeParamsObj: (*/
// /*   ~state: string=?,*/
// /*   ~nonce: string=?,*/
// /*   ~audience: string=?,*/
// /*   ~scope: string=?,*/
// /*   ~connection: string=?,*/
// /*   ~language: string=?,*/
// /*   ~prompt: string=?,*/
// /*   unit,*/
// /* ) => authorizeParamsObj = ""*/
// /* type auth0Client = {*/
// /*   "authorize": (*/
// /*     @bs.meth ~parameters: authorizeParamsObj,*/
// /*     ~options: option<authorizeOptions>=?,*/
// /*     unit,*/
// /*   ) => Js.Promise.t<credentials>,*/
// /*   //   "isAuthenticated": @bs.meth (bool => unit),*/
// /*   "clearSession": (~parameters: option<clearSessionParams>=?, unit) => Js.Promise.t<unit>,*/
// /* }*/
// /* type*/
// type nonrec webAuthClient;
// /* @bs.module("react-native-auth0")*/
// /* external webAuthClient: webAuth = "WebAuth"*/
// /* type authClient*/
// /* @bs.module("react-native-auth0")*/
// /* external authClient: auth =>authClient= "Auth"*/

// /* type auth0Client = {*/
// /*   auth: authClient,*/
// /*   webAuth: webAuthClient,*/
// /*   //   users: (~token: string) => users<'a>,*/
// /* }*/
// /* let auth0Client = {*/
// /*   auth: authClient,*/
// /*   webAuth: webAuthClient,*/
// /*   //   users: (~token: string) => users<'a>,*/
// /* }*/
// /* type auth0Client = {"auth": _auth}*/
// type nonrec t;
// [@bs.module "react-native-auth0"] [@bs.new]
// external rnAuth0: options => t = "default";

// [@bs.module "react-native-auth0"]
// external webAuthClient:  webAuth = "WebAuth";
// [@bs.module "react-native-auth0"] external authClient: (t, auth) = "Auth";

// /* @bs.send*/
// /* external createClient: (t, options) => auth0 = ""*/

// /* let createClient = options => createClient(rnAuth0, options)*/

// [@bs.module "react-native-auth0"] [@bs.new]
// external createClient: options => = "default";
// let options: options = {
//   clientId: "GDuiq4x1reJXs8a6yDXgqJcNAc8QBOjX",
//   domain: "klik.eu.auth0.com",
// };
// let client = rnAuth0(options);
// let webAuthClient = webAuthClient(client);
// /* let client = createClient(credentials)*/
// /* let credentials = client.authorize(*/
// /*   ~parameters=authorizeParams(~scope=[Scopes.openId, Scopes.profile, Scopes.email], ()),*/
// /* )*/
