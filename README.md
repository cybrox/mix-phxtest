# phx.test
Mix task for running specific tests via `mix test` (ex_unit) and `mix watch` ([extension](https://github.com/lpil/mix-test.watch)) fast.   

Let's admit it, we're all lazy and running specific tests in a [phoenix](https://github.com/phoenixframework/phoenix) project can be a bit of a hassle when specifying the full path. I for one, would prefer to strip the boilerplate text from the command. So, here's a fitting library.

```
# Stop doing this
$ mix test test/myapp_web/controllers/resource_controller.exs:12

# Start doing this
$ mix phx.test c resource 12
```

Just add `phx.test` as a dependency to your project via [hex.pm](https://hex.pm)    
```
{:phxtest, "~> 0.1.0", only: [:dev, :test]}
```

### Usage
```
Usage: mix phx.test <type> <name> [line]
       mix phx.watch <type> <name> [line]

type:  c - controller (/test/myapp_web/controllers/)
       v - view       (/test/myapp_web/views/)
       p - plug       (/test/myapp_web/plug/)
       w - web        (/test/myapp_web/)
       l - lib        (/test/myapp/)

name:  The name of your file, you can add additional
       subdirectories here, if needed.

line:  The line of the test, if you only want to execute
       a single test. This is optional.
       

idea:  The phx.test and phx.watch are just aliases that
       perform simple string interpolation. The commands
       you are generating are composed like this:
       $ mix phx.test c user 12
       $ mix test /test/controllers/user_controller_test.exs:12
```
