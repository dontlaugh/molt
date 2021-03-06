# Test script: return command

# NOTE: The semantics of return are a subset of those of standard TCL.

# Test syntax.  Note: TCL doesn't work this way, but until I implement
# the full return syntax, it doesn't matter.
test return-1.1 {result errors} {
    return foo bar
} -error {wrong # args: should be "return ?value?"}

# return the empty string
test return-2.1 {result command} -setup {
    proc a {} {
        return
    }
} -body {
    a
} -cleanup {
    rename a ""
} -ok {}

# return something else.
test return-2.2 {result command} -setup {
    proc a {} {
        return "howdy"
    }
} -body {
    a
} -cleanup {
    rename a ""
} -ok {howdy}
