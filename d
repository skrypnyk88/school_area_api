
[1mFrom:[0m /home/julia/.rvm/gems/ruby-2.4.0/gems/rspec-core-3.5.4/lib/rspec/core/example_group.rb @ line 590 RSpec::Core::ExampleGroup.run:

    [1;34m582[0m: [32mdef[0m [1;36mself[0m.[1;34mrun[0m(reporter=[1;34;4mRSpec[0m::[1;34;4mCore[0m::[1;34;4mNullReporter[0m)
    [1;34m583[0m:   [32mreturn[0m [32mif[0m [1;34;4mRSpec[0m.world.wants_to_quit
    [1;34m584[0m:   reporter.example_group_started([1;36mself[0m)
    [1;34m585[0m: 
    [1;34m586[0m:   should_run_context_hooks = descendant_filtered_examples.any?
    [1;34m587[0m:   [32mbegin[0m
    [1;34m588[0m:     run_before_context_hooks(new([31m[1;31m'[0m[31mbefore(:context) hook[1;31m'[0m[31m[0m)) [32mif[0m should_run_context_hooks
    [1;34m589[0m:     result_for_this_group = run_examples(reporter)
 => [1;34m590[0m:     results_for_descendants = ordering_strategy.order(children).map { |child| child.run(reporter) }.all?
    [1;34m591[0m:     result_for_this_group && results_for_descendants
    [1;34m592[0m:   [32mrescue[0m [1;34;4mPending[0m::[1;34;4mSkipDeclaredInExample[0m => ex
    [1;34m593[0m:     for_filtered_examples(reporter) { |example| example.skip_with_exception(reporter, ex) }
    [1;34m594[0m:     [1;36mtrue[0m
    [1;34m595[0m:   [32mrescue[0m [1;34;4mSupport[0m::[1;34;4mAllExceptionsExceptOnesWeMustNotRescue[0m => ex
    [1;34m596[0m:     for_filtered_examples(reporter) { |example| example.fail_with_exception(reporter, ex) }
    [1;34m597[0m:     [1;34;4mRSpec[0m.world.wants_to_quit = [1;36mtrue[0m [32mif[0m reporter.fail_fast_limit_met?
    [1;34m598[0m:     [1;36mfalse[0m
    [1;34m599[0m:   [32mensure[0m
    [1;34m600[0m:     run_after_context_hooks(new([31m[1;31m'[0m[31mafter(:context) hook[1;31m'[0m[31m[0m)) [32mif[0m should_run_context_hooks
    [1;34m601[0m:     reporter.example_group_finished([1;36mself[0m)
    [1;34m602[0m:   [32mend[0m
    [1;34m603[0m: [32mend[0m

