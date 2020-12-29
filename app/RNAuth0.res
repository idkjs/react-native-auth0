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
  authorize: (authorizeParams, unit) => Js.Promise.t<credentials>,
  clearSession: unit => Js.Promise.t<unit>,
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
  //   auth: auth,
//   authorize: (authorizeParams, unit) => Js.Promise.t<credentials>,
  webAuth: webAuth,
  //   users: (~token: string) => users<'a>,
}
type user = {.}
type generatedAuth0Client = {
  authorize: unit => Js.Promise.t<unit>,
  isAuthenticated: unit => bool,
  /* isAuthenticated: unit => Js.Promise.t(bool), */
  loginWithRedirect: unit => Js.Promise.t<unit>,
  handleRedirectCallback: unit => Js.Promise.t<unit>,
  getUser: unit => Js.Promise.t<user>,
  loginWithPopup: unit => Js.Promise.t<unit>,
  getTokenSilently: unit => Js.Promise.t<unit>,
}
type generatedAuth0Client2 = {
  "authorize": @bs.meth (unit => unit),
  "isAuthenticated": @bs.meth (bool => unit),
}

type clientOptions = {
  domain: string,
  clientId: string,
//   "redirectUri": string,
//   "responseType": string,
//   "scope": string,
}

@bs.module("react-native-auth0") @bs.new
external createClient: clientOptions => 'a = "default"
// @bs.module("react-native-auth0") @bs.new
// external createClient: options => auth0 = "default"
let options: clientOptions = {
  clientId: "GDuiq4x1reJXs8a6yDXgqJcNAc8QBOjX",
  domain: "klik.eu.auth0.com",
//   "scope":"openid profile email"
}

let client = createClient(options)

let onLogin = setAccessToken => {
  open Js.Promise

  client["webAuth"]["authorize"](authorizeParams(~scope="openid profile email", ()), ())
  |> then_((credentials: credentials) => {
    ReactNative.Alert.alert(~title="AccessToken: " ++ credentials.accessToken, ())
    setAccessToken(_ => Some(credentials.accessToken))
    Js.Promise.resolve()
  })
  |> catch(error => Js.log(error) |> Js.Promise.resolve)
}
  let onLogout = (setAccessToken) => {
    open Js.Promise

    client["webAuth.clearSession"]()
    |> then_(result => {
      Js.log2("RESULT: ", result)
      ReactNative.Alert.alert(~title="Logged out!", ())
      setAccessToken(_ => None)
      Js.Promise.resolve()
    })
    |> catch(error => Js.log2("Log out cancelled", error) |> Js.Promise.resolve)
  }
type result<'a, 'b> =
  | Ok('a)
  | Error('b)

type myPayload = {data: string}

type myPayloadResults<'errorType> = array<result<myPayload, 'errorType>>

let payloadResults: myPayloadResults<string> = [
  Ok({data: "hi"}),
  Ok({data: "bye"}),
  Error("Something wrong happened!")
]
