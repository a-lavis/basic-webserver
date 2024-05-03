module [line, write, flush]

import Effect
import Task exposing [Task]
import InternalTask

## Write the given string to [standard error](https://en.wikipedia.org/wiki/Standard_streams#Standard_error_(stderr)),
## followed by a newline.
##
## > To write to `stderr` without the newline, see [Stderr.write].
line : Str -> Task {} *
line = \str ->
    Effect.stderrLine str
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

## Write the given string to [standard error](https://en.wikipedia.org/wiki/Standard_streams#Standard_error_(stderr)).
##
## Most terminals will not actually display strings that are written to them until they receive a newline,
## so this may appear to do nothing until you write a newline!
##
## > To write to `stderr` with a newline at the end, see [Stderr.line].
write : Str -> Task {} *
write = \str ->
    Effect.stderrWrite str
    |> Effect.map (\_ -> Ok {})
    |> InternalTask.fromEffect

## Flush the [standard error](https://en.wikipedia.org/wiki/Standard_streams#Standard_error_(stderr)).
## This will cause any buffered output to be written out. This is typically to
## the terminal but may be captured and written to a file.
##
## This may fail if the buffered output could not be written due to I/O
## errors or EOF being reached.
flush : Task {} *
flush = Effect.stderrFlush |> Effect.map (\_ -> Ok {}) |> InternalTask.fromEffect
