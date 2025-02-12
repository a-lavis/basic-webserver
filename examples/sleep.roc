app [main] { pf: platform "../platform/main.roc" }

import pf.Stdout
import pf.Task exposing [Task]
import pf.Http exposing [Request, Response]
import pf.Sleep

main : Request -> Task Response []
main = \_ ->

    # Let the user know we're sleeping
    {} <- Stdout.write "Sleeping for 1 second...\n" |> Task.await
    _ <- Stdout.flush |> Task.attempt

    # Sleep for 1 second
    {} <- Sleep.millis 1000 |> Task.await

    # Deplayed Http response
    body = Str.toUtf8 "Response delayed by 1 second\n"
    headers = []
    status = 200

    Task.ok { status, headers, body }

