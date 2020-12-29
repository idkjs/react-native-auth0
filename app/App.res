open ReactNative

let styles = {
  open Style
  StyleSheet.create({
    "container": style(
      ~flex=1.,
      ~justifyContent=#center,
      ~alignItems=#center,
      ~backgroundColor="#F5FCFF",
      (),
    ),
    "header": style(~fontSize=20., ~textAlign=#center, ~marginTop=10.->dp, ()),
  })
}

let auth0 = RNAuth0.client

@react.component
let make = () => {
  let (accessToken, setAccessToken) = React.useState(() => None)

  let onLogin = () => {
    open Js.Promise

    auth0["webAuth"]["authorize"](
      ~parameters=RNAuth0.authorizeParams(~scope="openid profile email", ()),
      (),
    )
    |> then_((credentials: RNAuth0.credentials) => {
      Js.log2("Log in credentials", credentials)
      Alert.alert(~title="AccessToken: " ++ credentials.accessToken, ())
      setAccessToken(_ => Some(credentials.accessToken))
      Js.Promise.resolve()
    })
    |> catch(error => Js.log(error) |> Js.Promise.resolve)
  }
  let onLogout = () => {
    open Js.Promise

    auth0["webAuth"]["clearSession"]()
    |> then_(result => {
      Js.log2("RESULT: ", result)
      Alert.alert(~title="Logged out!", ())
      setAccessToken(_ => None)
      Js.Promise.resolve()
    })
    |> catch(error => Js.log2("Log out cancelled", error) |> Js.Promise.resolve)
  }
  let loggedIn = accessToken->Belt.Option.isSome
  <View style={styles["container"]}>
    <Text style={styles["header"]}> {"Auth0Sample - Login"->React.string} </Text>
    <Text> {("You are " ++ {loggedIn ? " " : "not"} ++ " logged in.")->React.string} </Text>
    <Button
      onPress={_e =>
        loggedIn
          ? onLogout()->Js.Promise.resolve |> ignore
          : onLogin()->Js.Promise.resolve |> ignore}
      title={loggedIn ? "Log Out" : "Log In"}
    />
  </View>
}

let default = make
