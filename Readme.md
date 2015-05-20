The hard skills
---------------

### Write a test

Traditionally, tests all go in a directory (folder) together,
but we'll ignore that, for the sake of simplicity.
Lets make a file called `passing_test.rb` Notice that it ends in `_test.rb`,
this is a common pattern, it's often used to identify which files contain tests.

Lets check out our `passing_test.rb` file now.

First, we `require 'minitest'`, this loads the code that is made for testing.

Then we group a bunch of tests together under an idea by creating a new class for them.
This class needs to inherit (the less than sign) from `Minitest::Test` in order
for it to be recognized as a test. Inheriting also gives our test the methods
that we will be using, like `assert_equals`. If Ruby can't find those methods
in our code, it will go look in `Minitest::Test`, and find them there,
because we inherited from it.

We write our first test by defining a method that begins with `test_`,
this is how Minitest knows that this method is intended to be a test.
When we run this code, it will execute that method for us, and tell us if it passes.


### Run the test

There's any number of ways to do this, but I just wrote a program to make it easier,
called `mrspec`. It runs `Minitest` tests, like the one we made, but uses pieces of
another testing tool, `rspec`, to accomplish this.

The dollar sign is meant to tell you that this command needs to be run this in the terminal.
The command we wrote is only the line with the dollar sign. Everything after that is output,
printed to our screen as the command was run.
You might have more output than I did, probably about documentation. That's okay.

```
$ gem install mrspec
Fetching: mrspec-0.0.1.gem (100%)
Successfully installed mrspec-0.0.1
1 gem installed
```

Now we can run our test:

```
$ mrspec passing_test.rb
.

Finished in 0.00072 seconds (files took 0.44439 seconds to load)
1 example, 0 failures
```

Nice, but lets spruce it up a bit. We can tell `mrspec` to give us prettier output
by editing a file `.rspec`, in our home directory, to look like this:

```
--colour
--format documentation
```

And now when we run it, it comes out in colour, and formatted nicely:

```
$ mrspec passing_test.rb

Passing
  it passes

Finished in 0.00055 seconds (files took 0.44247 seconds to load)
1 example, 0 failures
```


### Skipping a test

Sometimes you know a test is going to fail, but you don't want to deal with it right now.
Other times, you have a test that you defined, but haven't written any code inside of it yet.
In these cases, we can "skip" the test by calling the `skip` method from wihtin it:

```
$ mrspec skipped_test.rb

Skipped
  it skips (PENDING: skipped)

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Skipped it skips
     # skipped
     Failure/Error: skip
       Skipped, no message given
     # ./skipped_test.rb:5:in `test_it_skips'

Finished in 0.00063 seconds (files took 0.45003 seconds to load)
1 example, 0 failures, 1 pending
```

This will let us know to come back to it later, and fix it, write it, or delete it.


### A failing test

Sometimes your test does not do what you expected,
In this case, it will "fail". This is to let you know what happened and where,
so you can go figure out what you need to change to get it working :)

```
$ mrspec failing_test.rb

Failing
  it fails (FAILED - 1)

Failures:

  1) Failing it fails
     Failure/Error: assert_equal 1, 2
       Expected: 1
         Actual: 2
     # ./failing_test.rb:5:in `test_it_fails'

Finished in 0.00103 seconds (files took 0.64903 seconds to load)
1 example, 1 failure

Failed examples:

rspec /Users/josh/deleteme/how-to-test/failing_test.rb:4 # Failing it fails
```


### A test that errors

Our failure above wasn't broken, it just gave us a value that was different than we expected.
Sometimes, though, the code will actually be broken. In these cases, it raises an error.
mrspec will tell us it failed, and display the error to us.

Try to read these error messages, they are there to help you understand why this happened.

```
$ mrspec erroring_test.rb

Failing
  it errors (FAILED - 1)

Failures:

  1) Failing it errors
     Failure/Error: zomg_wtf_bbq
     NameError:
       undefined local variable or method `zomg_wtf_bbq' for #<FailingTest:0x007fd52a198410>
     # ./erroring_test.rb:5:in `test_it_errors'

Finished in 0.00062 seconds (files took 0.62309 seconds to load)
1 example, 1 failure

Failed examples:

rspec /Users/josh/deleteme/how-to-test/erroring_test.rb:4 # Failing it errors
```


### Try it out

Go ahead and try defining a few tests yourself.
Try these ideas out and see if you can predict what they are going to do.
Try to come up with an explanation for how things work, such that your ability
to predict what will happen improves as you go :)

* Write a test that does each of the things we saw.
* What happens if you write two tests in the same class?
* What happens if you write two methods, but one doesn't begin with `test_`?
* What happens if you have multiple classes in the same file that inherit from `Minitest::Test`?
* What happens if you have a class with a `test_something` method, but it doesn't inherit from `Minitest::Test`?
* What happens if you have two files, and they each define a test in a class of the same name? (you'll have to run this with `$ mrspec first_test.rb second_test.rb`)
* What if you then make the test names the same?!
* What if you have a successful `assert_equal` before a `skip`?
* What about after a `skip`?
* What if it's an unsuccessful assertion? Will it be different before vs after?
* What if you have two unsuccessful assertions in the same method?
  Will it double fail or fail on the first? Or on the last one?
  Or maybe two wrongs make a right, and it passes?!?!
* If you have two assertions in a successful method, how many examples will it tell you that it ran?
* What if you put `10000.times { assert_equal 1, 1 }` in a test? What will that do?
* Try adding a method named `helper_method`, that just returns `1`. This isn't a test, because it doesn't start with `test_`,
  Now, make 2 tests like this: `assert_equal 1, helper_method`, and one like this: `assert_equal 2, helper_method`...
  What will happen?
* If you have 3 passing tests in a file, and you run them 10 times, will you see the same output every time?

Intro to TDD
------------

* What is TDD?
* Why is it useful? Why bother writing tests first?
* Why write the tests first?
* Write pseudo code to start your tests.
* Imagine how you want it to work.

The process
-----------

1. Think about what you want and why. Your goal is to understand what the code needs to do in order for it to satisfy the requirements.
2. Write an example of what it would look like to use the code. This will become your "acceptance test", you'll consider this code acceptable if your example works.
3. Now describe the different things it needs to do in human words. Write these down in comments.
4. Turn the example into a test by using `assert_equals` everywhere you expected something.
5. Turn each description into a unit test by placing underscores where the spaces are. Skip all of these by default.
6. Run the test, see how far you get along the acceptance test. Now go work on the unit test for this behaviour.
   * If you discover new things that the code needs to do, you can add more unit tests.
   * If you discover that it doesn't need to do one of these things, you can delete the unit test.
7. As you make your way through the acceptance test, you should wind up writing most/all of the unit tests, and the code to make them pass.
8. After your acceptance test passes, you may have some unit tests left over, go ahead and write the tests now, and then write the code that makes them work.

Watch me build a calculator in this way
---------------------------------------

I'll demonstrate what this looks like, you observe.
Your goal isn't to be able to write the code I write,
it's to be able to apply these ideas in a way that
leads you to writing code that guides you in the way mine guided me.


The calculator will need to do these things:

```
.new
#total
#add
#clear
#subtract
```

Your test doesn't have to look like mine,
but they need to help you understand what you're doing,
and guide you as you write code.

Your calculator doesn't have to look like mine,
but it needs to reasonably behave the way a calculator
would behave. You could take the names we came up with,
and write 5 different calculators that make them pass!
That's okay, there's not a right way to make the calculator,
but there is probably consistent ideas that we would converge
on, if we describe how a calculator works. As long as it
does these things, the code is good!


Now you build the calculator
----------------------------

Now try to do the same thing you watched me do!
The goal isn't to write the same code,
it's to use the same process :)
