# mix phxtest
Mix task for running specific tests in your [phoenix](https://github.com/phoenixframework/phoenix) project via `mix test` (ex_unit) and `mix watch` ([mix-test.watch](https://github.com/lpil/mix-test.watch)) more conveniently.   

Let's admit it, we're all lazy and running specific tests in a phoenix project can be a bit of a hassle when specifying the full path. I for one, would prefer to strip the boilerplate text from the command. So, here's a fitting library.

```
# Stop doing this
$ mix test test/myapp_web/controllers/resource_controller.exs:12

# Start doing this
$ mix phxtest c resource 12
```

Just add `mix_phxtest` as a dependency to your project via [hex.pm](https://hex.pm/packages/mix_phxtest)    
```
{:mix_phxtest, "~> 0.2.1", only: [:test]}
```

### Usage
```
Usage: mix phxtest <type> <name> [line]
       mix phxwatch <type> <name> [line]

type:  c - controller (/test/myapp_web/controllers/)
       v - view       (/test/myapp_web/views/)
       p - plug       (/test/myapp_web/plug/)
       w - web        (/test/myapp_web/)
       l - lib        (/test/myapp/)

name:  The name of your file, you can add additional
       subdirectories here, if needed.

line:  The line of the test, if you only want to execute
       a single test. This is optional.
       

idea:  The phx.test and phxwatch are just aliases that
       perform simple string interpolation. The commands
       you are generating are composed like this:
       $ mix phxtest c user 12
       $ mix test /test/controllers/user_controller_test.exs:12
```

Hint: You can access nested tests by putting the path in the name parameter:
```
$ mix phxtest c device/mobile 11

# Will become
$ mix test test/myapp_web/controllers/device/mobile_controller_test.exs:11
```
