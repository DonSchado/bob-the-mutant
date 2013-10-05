## This is a mutation of Bob from exercism.io

Bob was a lackadaisical teenager, who used to live in the harmless land of [Excercism.io](https://github.com/kytrinyx/exercism.io)

But then the [**MUTANTS**](https://github.com/mbj/mutant) came ... and everything we knew, had changed ...


### About

This example proofs that 100% code coverage can be very misleading. Run all the specs with ```rake```:

![fabulous](/img/fabulous.png)

Cool, everything is working and the generated report confirms a coverage of 100.0%.

You can take a detailed look with ```open coverage/index.html```.

![coverage](/img/coverage.png)

If you look at the specs, only the _Bob_ class has some reasonable tests to ensure the functionality of Bob. But Bob uses the _Statement_ class which holds most of the "business logic" (what is covered through the specs from Bob).

Now run the mutation tester with ```rake spec:mutant```.
The Output should look like this:

- Subjects:  6
- Mutations: 97
- Kills:     63
- Runtime:   7.61s
- Killtime:  7.37s
- Overhead:  3.08%
- **Coverage:  64.95%**
- **Alive:     34**

_Woah!_ There are 34 mutants alive which our test suite wasn't able to kill.
This means that the implementation could be changed, but the tests won't recognize it.

More concrete? The easiest thing mutant did for example:

![mutation](/img/mutation.png)

Wow, even something that raises an exception is not covered by tests. That's pretty bad, isn't it?
(To be fair, since _Bob_ integrates the _Statement_ class, this will be covered, but in isolation it won't, because there are no corresponding tests for _Statement_.)

### Now what?

Look at the output what mutant change and **KILL ALL THE MUTANTS!**

Write some specs to kill the mutations on the statement class, or feel free to refactor everything.

