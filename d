=> [32m#<ActionDispatch::TestResponse:0x0000000305dd38[0m
 @cache_control[32m=[0m{},
 @committed[32m=[0m[1;36mtrue[0m,
 @cv[32m=[0m
  [32m#<MonitorMixin::ConditionVariable:0x0000000305db30[0m
   @cond[32m=[0m[32m#<Thread::ConditionVariable:0x0000000305dae0[0m[32m>[0m,
   @monitor[32m=[0m[32m#<ActionDispatch::TestResponse:0x0000000305dd38[0m ...[32m>[0m[32m>[0m,
 @header[32m=[0m
  {[31m[1;31m"[0m[31mX-Frame-Options[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mSAMEORIGIN[1;31m"[0m[31m[0m,
   [31m[1;31m"[0m[31mX-XSS-Protection[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m1; mode=block[1;31m"[0m[31m[0m,
   [31m[1;31m"[0m[31mX-Content-Type-Options[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mnosniff[1;31m"[0m[31m[0m,
   [31m[1;31m"[0m[31mContent-Type[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mapplication/json; charset=utf-8[1;31m"[0m[31m[0m},
 @mon_count[32m=[0m[1;34m0[0m,
 @mon_mutex[32m=[0m[32m#<Thread::Mutex:0x0000000305dbf8[0m[32m>[0m,
 @mon_owner[32m=[0m[1;36mnil[0m,
 @request[32m=[0m
  [32m#<ActionController::TestRequest:0x0000000305df18[0m
   @custom_param_parsers[32m=[0m
    {[33m:xml[0m=>
      [32m#<Proc:0x0000000305de28@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/actionpack-5.0.2/lib/action_controller/test_case.rb:54 (lambda)>[0m},
   @env[32m=[0m
    {[31m[1;31m"[0m[31mrack.version[1;31m"[0m[31m[0m=>[[1;34m1[0m, [1;34m3[0m],
     [31m[1;31m"[0m[31mrack.input[1;31m"[0m[31m[0m=>[32m#<StringIO:0x0000000305e120[0m[32m>[0m,
     [31m[1;31m"[0m[31mrack.errors[1;31m"[0m[31m[0m=>[32m#<StringIO:0x0000000300f368[0m[32m>[0m,
     [31m[1;31m"[0m[31mrack.multithread[1;31m"[0m[31m[0m=>[1;36mtrue[0m,
     [31m[1;31m"[0m[31mrack.multiprocess[1;31m"[0m[31m[0m=>[1;36mtrue[0m,
     [31m[1;31m"[0m[31mrack.run_once[1;31m"[0m[31m[0m=>[1;36mfalse[0m,
     [31m[1;31m"[0m[31mREQUEST_METHOD[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mGET[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mSERVER_NAME[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mexample.org[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mSERVER_PORT[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m80[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mQUERY_STRING[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mrack.url_scheme[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mhttp[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mHTTPS[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31moff[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mSCRIPT_NAME[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mCONTENT_LENGTH[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m0[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mHTTP_HOST[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mtest.host[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mREMOTE_ADDR[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m0.0.0.0[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mHTTP_USER_AGENT[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mRails Testing[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.parameter_filter[1;31m"[0m[31m[0m=>[[33m:password[0m],
     [31m[1;31m"[0m[31maction_dispatch.redirect_filter[1;31m"[0m[31m[0m=>[],
     [31m[1;31m"[0m[31maction_dispatch.secret_token[1;31m"[0m[31m[0m=>[1;36mnil[0m,
     [31m[1;31m"[0m[31maction_dispatch.secret_key_base[1;31m"[0m[31m[0m=>
      [31m[1;31m"[0m[31m042f57ba6e5fbef80a4c1325501293cd6343a48ddba8c0fabd1bf083b36751f817f3e4e6f4ea2819c0fc662090425b748ba05db0b8950dd5ecde1d420bed4ce0[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.show_exceptions[1;31m"[0m[31m[0m=>[1;36mfalse[0m,
     [31m[1;31m"[0m[31maction_dispatch.show_detailed_exceptions[1;31m"[0m[31m[0m=>[1;36mtrue[0m,
     [31m[1;31m"[0m[31maction_dispatch.logger[1;31m"[0m[31m[0m=>
      [32m#<ActiveSupport::Logger:0x000000038c9f08[0m
       @default_formatter[32m=[0m
        [32m#<Logger::Formatter:0x000000038c9b70[0m @datetime_format[32m=[0m[1;36mnil[0m[32m>[0m,
       @formatter[32m=[0m
        [32m#<ActiveSupport::Logger::SimpleFormatter:0x0000000351d170[0m
         @datetime_format[32m=[0m[1;36mnil[0m,
         @thread_key[32m=[0m[31m[1;31m"[0m[31mactivesupport_tagged_logging_tags:27846840[1;31m"[0m[31m[0m[32m>[0m,
       @level[32m=[0m[1;34m0[0m,
       @local_levels[32m=[0m
        [32m#<Concurrent::Map:0x000000038c96e8 entries=0 default_proc=nil>[0m,
       @logdev[32m=[0m
        [32m#<Logger::LogDevice:0x000000038c9b20[0m
         @dev[32m=[0m
          [32m#<File:/home/mykhailo/Desktop/Rails/school_area_api/log/test.log>[0m,
         @filename[32m=[0m[1;36mnil[0m,
         @mon_count[32m=[0m[1;34m0[0m,
         @mon_mutex[32m=[0m[32m#<Thread::Mutex:0x000000038c9940[0m[32m>[0m,
         @mon_owner[32m=[0m[1;36mnil[0m,
         @shift_age[32m=[0m[1;36mnil[0m,
         @shift_period_suffix[32m=[0m[1;36mnil[0m,
         @shift_size[32m=[0m[1;36mnil[0m[32m>[0m,
       @progname[32m=[0m[1;36mnil[0m[32m>[0m,
     [31m[1;31m"[0m[31maction_dispatch.backtrace_cleaner[1;31m"[0m[31m[0m=>
      [32m#<Rails::BacktraceCleaner:0x0000000310e818[0m
       @filters[32m=[0m
        [[32m#<Proc:0x0000000310e5e8@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/railties-5.0.2/lib/rails/backtrace_cleaner.rb:14>[0m,
         [32m#<Proc:0x0000000310e4a8@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/railties-5.0.2/lib/rails/backtrace_cleaner.rb:15>[0m,
         [32m#<Proc:0x0000000310e480@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/railties-5.0.2/lib/rails/backtrace_cleaner.rb:16>[0m,
         [32m#<Proc:0x0000000310dc60@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/railties-5.0.2/lib/rails/backtrace_cleaner.rb:29>[0m],
       @root[32m=[0m[31m[1;31m"[0m[31m/home/mykhailo/Desktop/Rails/school_area_api/[1;31m"[0m[31m[0m,
       @silencers[32m=[0m
        [[32m#<Proc:0x0000000310dc38@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/railties-5.0.2/lib/rails/backtrace_cleaner.rb:19>[0m][32m>[0m,
     [31m[1;31m"[0m[31maction_dispatch.key_generator[1;31m"[0m[31m[0m=>
      [32m#<ActiveSupport::CachingKeyGenerator:0x0000000385afb8[0m
       @cache_keys[32m=[0m
        [32m#<Concurrent::Map:0x0000000385af40 entries=1 default_proc=nil>[0m,
       @key_generator[32m=[0m
        [32m#<ActiveSupport::KeyGenerator:0x0000000385afe0[0m
         @iterations[32m=[0m[1;34m1000[0m,
         @secret[32m=[0m
          [31m[1;31m"[0m[31m042f57ba6e5fbef80a4c1325501293cd6343a48ddba8c0fabd1bf083b36751f817f3e4e6f4ea2819c0fc662090425b748ba05db0b8950dd5ecde1d420bed4ce0[1;31m"[0m[31m[0m[32m>[0m[32m>[0m,
     [31m[1;31m"[0m[31maction_dispatch.http_auth_salt[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mhttp authentication[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.signed_cookie_salt[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31msigned cookie[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.encrypted_cookie_salt[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mencrypted cookie[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.encrypted_signed_cookie_salt[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31msigned encrypted cookie[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.cookies_serializer[1;31m"[0m[31m[0m=>[1;36mnil[0m,
     [31m[1;31m"[0m[31maction_dispatch.cookies_digest[1;31m"[0m[31m[0m=>[1;36mnil[0m,
     [31m[1;31m"[0m[31mrack.session[1;31m"[0m[31m[0m=>{},
     [31m[1;31m"[0m[31mrack.session.options[1;31m"[0m[31m[0m=>
      {[33m:key[0m=>[31m[1;31m"[0m[31mrack.session[1;31m"[0m[31m[0m,
       [33m:path[0m=>[31m[1;31m"[0m[31m/[1;31m"[0m[31m[0m,
       [33m:domain[0m=>[1;36mnil[0m,
       [33m:expire_after[0m=>[1;36mnil[0m,
       [33m:secure[0m=>[1;36mfalse[0m,
       [33m:httponly[0m=>[1;36mtrue[0m,
       [33m:defer[0m=>[1;36mfalse[0m,
       [33m:renew[0m=>[1;36mfalse[0m,
       [33m:sidbits[0m=>[1;34m128[0m,
       [33m:cookie_only[0m=>[1;36mtrue[0m,
       [33m:secure_random[0m=>[1;34;4mSecureRandom[0m},
     [31m[1;31m"[0m[31mHTTP_COOKIE[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction_dispatch.request.path_parameters[1;31m"[0m[31m[0m=>
      {[33m:format[0m=>[31m[1;31m"[0m[31mjson[1;31m"[0m[31m[0m,
       [33m:presence_report_id[0m=>[31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m,
       [33m:controller[0m=>[31m[1;31m"[0m[31mv1/report_times[1;31m"[0m[31m[0m,
       [33m:action[0m=>[31m[1;31m"[0m[31mindex[1;31m"[0m[31m[0m},
     [31m[1;31m"[0m[31maction_dispatch.request.flash_hash[1;31m"[0m[31m[0m=>
      [32m#<ActionDispatch::Flash::FlashHash:0x00000003055688[0m
       @discard[32m=[0m[32m#<Set: {[0m}>,
       @flashes[32m=[0m{},
       @now[32m=[0m[1;36mnil[0m[32m>[0m,
     [31m[1;31m"[0m[31maction_controller.instance[1;31m"[0m[31m[0m=>
      [32m#<V1::ReportTimesController:0x0000000311d278[0m
       @_action_name[32m=[0m[31m[1;31m"[0m[31mindex[1;31m"[0m[31m[0m,
       @_config[32m=[0m{},
       @_db_runtime[32m=[0m[1;35m0.293583[0m,
       @_lookup_context[32m=[0m
        [32m#<ActionView::LookupContext:0x0000000305c8e8[0m
         @cache[32m=[0m[1;36mtrue[0m,
         @details[32m=[0m
          {[33m:locale[0m=>[[33m:en[0m],
           [33m:formats[0m=>[[33m:json[0m],
           [33m:variants[0m=>[],
           [33m:handlers[0m=>[[33m:raw[0m, [33m:erb[0m, [33m:html[0m, [33m:builder[0m, [33m:ruby[0m, [33m:jbuilder[0m]},
         @details_key[32m=[0m
          [32m#<ActionView::LookupContext::DetailsKey:0x000000030509f8[0m
           @digest_cache[32m=[0m
            [32m#<Concurrent::Map:0x000000030509d0 entries=0 default_proc=nil>[0m[32m>[0m,
         @prefixes[32m=[0m[[31m[1;31m"[0m[31mv1/report_times[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31mapplication[1;31m"[0m[31m[0m],
         @rendered_format[32m=[0m[33m:json[0m,
         @view_paths[32m=[0m
          [32m#<ActionView::PathSet:0x0000000305c5f0[0m
           @paths[32m=[0m
            [[32m#<ActionView::OptimizedFileSystemResolver:0x0000000263d4c0[0m
              @cache[32m=[0m[32m#<ActionView::Resolver::Cache:0x263d3d0 keys=1 queries=0>[0m,
              @path[32m=[0m[31m[1;31m"[0m[31m/home/mykhailo/Desktop/Rails/school_area_api/app/views[1;31m"[0m[31m[0m,
              @pattern[32m=[0m
               [31m[1;31m"[0m[31m:prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}[1;31m"[0m[31m[0m[32m>[0m,
             [32m#<ActionView::OptimizedFileSystemResolver:0x0000000263e898[0m
              @cache[32m=[0m[32m#<ActionView::Resolver::Cache:0x263e848 keys=0 queries=0>[0m,
              @path[32m=[0m
               [31m[1;31m"[0m[31m/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/devise-4.2.1/app/views[1;31m"[0m[31m[0m,
              @pattern[32m=[0m
               [31m[1;31m"[0m[31m:prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}[1;31m"[0m[31m[0m[32m>[0m][32m>[0m[32m>[0m,
       @_params[32m=[0m[1;36mnil[0m,
       @_request[32m=[0m[32m#<ActionController::TestRequest:0x0000000305df18[0m ...[32m>[0m,
       @_response[32m=[0m[32m#<ActionDispatch::TestResponse:0x0000000305dd38[0m ...[32m>[0m,
       @_response_body[32m=[0m
        [[31m[1;31m"[0m[31m[{[1;35m\"[0m[31mid[1;35m\"[0m[31m:1,[1;35m\"[0m[31mstart_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-29T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mend_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-05-03T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mreportable_id[1;35m\"[0m[31m:1,[1;35m\"[0m[31mreportable_type[1;35m\"[0m[31m:[1;35m\"[0m[31mPresenceReport[1;35m\"[0m[31m,[1;35m\"[0m[31mcreated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.420Z[1;35m\"[0m[31m,[1;35m\"[0m[31mupdated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.420Z[1;35m\"[0m[31m},{[1;35m\"[0m[31mid[1;35m\"[0m[31m:2,[1;35m\"[0m[31mstart_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-12T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mend_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-12T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mreportable_id[1;35m\"[0m[31m:1,[1;35m\"[0m[31mreportable_type[1;35m\"[0m[31m:[1;35m\"[0m[31mPresenceReport[1;35m\"[0m[31m,[1;35m\"[0m[31mcreated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.423Z[1;35m\"[0m[31m,[1;35m\"[0m[31mupdated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.423Z[1;35m\"[0m[31m}][1;31m"[0m[31m[0m],
       @_routes[32m=[0m[1;36mnil[0m,
       @_url_options[32m=[0m[1;36mnil[0m,
       @_view_context_class[32m=[0m[32m#<Class:0x0000000304d2f8>[0m,
       @_view_renderer[32m=[0m
        [32m#<ActionView::Renderer:0x00000003048500[0m
         @lookup_context[32m=[0m
          [32m#<ActionView::LookupContext:0x0000000305c8e8[0m
           @cache[32m=[0m[1;36mtrue[0m,
           @details[32m=[0m
            {[33m:locale[0m=>[[33m:en[0m],
             [33m:formats[0m=>[[33m:json[0m],
             [33m:variants[0m=>[],
             [33m:handlers[0m=>[[33m:raw[0m, [33m:erb[0m, [33m:html[0m, [33m:builder[0m, [33m:ruby[0m, [33m:jbuilder[0m]},
           @details_key[32m=[0m
            [32m#<ActionView::LookupContext::DetailsKey:0x000000030509f8[0m
             @digest_cache[32m=[0m
              [32m#<Concurrent::Map:0x000000030509d0 entries=0 default_proc=nil>[0m[32m>[0m,
           @prefixes[32m=[0m[[31m[1;31m"[0m[31mv1/report_times[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31mapplication[1;31m"[0m[31m[0m],
           @rendered_format[32m=[0m[33m:json[0m,
           @view_paths[32m=[0m
            [32m#<ActionView::PathSet:0x0000000305c5f0[0m
             @paths[32m=[0m
              [[32m#<ActionView::OptimizedFileSystemResolver:0x0000000263d4c0[0m
                @cache[32m=[0m
                 [32m#<ActionView::Resolver::Cache:0x263d3d0 keys=1 queries=0>[0m,
                @path[32m=[0m[31m[1;31m"[0m[31m/home/mykhailo/Desktop/Rails/school_area_api/app/views[1;31m"[0m[31m[0m,
                @pattern[32m=[0m
                 [31m[1;31m"[0m[31m:prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}[1;31m"[0m[31m[0m[32m>[0m,
               [32m#<ActionView::OptimizedFileSystemResolver:0x0000000263e898[0m
                @cache[32m=[0m
                 [32m#<ActionView::Resolver::Cache:0x263e848 keys=0 queries=0>[0m,
                @path[32m=[0m
                 [31m[1;31m"[0m[31m/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/devise-4.2.1/app/views[1;31m"[0m[31m[0m,
                @pattern[32m=[0m
                 [31m[1;31m"[0m[31m:prefix/:action{.:locale,}{.:formats,}{+:variants,}{.:handlers,}[1;31m"[0m[31m[0m[32m>[0m][32m>[0m[32m>[0m[32m>[0m,
       @_view_runtime[32m=[0m[1;35m5.207546000549554[0m,
       @report_times[32m=[0m
        [[32m#<ReportTime:0x0000000302b2e8[0m
          id: [1;34m1[0m,
          start_time: [1;34;4mSat[0m, [1;34m29[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m00[0m:[1;34m00[0m:[1;34m00[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          end_time: [1;34;4mWed[0m, [1;34m03[0m [1;34;4mMay[0m [1;34m2017[0m [1;34m00[0m:[1;34m00[0m:[1;34m00[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          reportable_id: [1;34m1[0m,
          reportable_type: [31m[1;31m"[0m[31mPresenceReport[1;31m"[0m[31m[0m,
          created_at: [1;34;4mWed[0m, [1;34m05[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m17[0m:[1;34m48[0m:[1;34m12[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          updated_at: [1;34;4mWed[0m, [1;34m05[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m17[0m:[1;34m48[0m:[1;34m12[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m[32m>[0m,
         [32m#<ReportTime:0x0000000302b158[0m
          id: [1;34m2[0m,
          start_time: [1;34;4mWed[0m, [1;34m12[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m00[0m:[1;34m00[0m:[1;34m00[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          end_time: [1;34;4mWed[0m, [1;34m12[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m00[0m:[1;34m00[0m:[1;34m00[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          reportable_id: [1;34m1[0m,
          reportable_type: [31m[1;31m"[0m[31mPresenceReport[1;31m"[0m[31m[0m,
          created_at: [1;34;4mWed[0m, [1;34m05[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m17[0m:[1;34m48[0m:[1;34m12[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m,
          updated_at: [1;34;4mWed[0m, [1;34m05[0m [1;34;4mApr[0m [1;34m2017[0m [1;34m17[0m:[1;34m48[0m:[1;34m12[0m [1;34;4mUTC[0m [1;34m+00[0m:[1;34m00[0m[32m>[0m][32m>[0m,
     [31m[1;31m"[0m[31maction_dispatch.request.content_type[1;31m"[0m[31m[0m=>[1;36mnil[0m,
     [31m[1;31m"[0m[31maction_dispatch.request.request_parameters[1;31m"[0m[31m[0m=>{},
     [31m[1;31m"[0m[31mrack.request.query_string[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mrack.request.query_hash[1;31m"[0m[31m[0m=>{},
     [31m[1;31m"[0m[31maction_dispatch.request.query_parameters[1;31m"[0m[31m[0m=>{},
     [31m[1;31m"[0m[31maction_dispatch.request.parameters[1;31m"[0m[31m[0m=>
      {[31m[1;31m"[0m[31mformat[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mjson[1;31m"[0m[31m[0m,
       [31m[1;31m"[0m[31mpresence_report_id[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m,
       [31m[1;31m"[0m[31mcontroller[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mv1/report_times[1;31m"[0m[31m[0m,
       [31m[1;31m"[0m[31maction[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mindex[1;31m"[0m[31m[0m},
     [31m[1;31m"[0m[31maction_dispatch.request.formats[1;31m"[0m[31m[0m=>
      [[32m#<Mime::Type:0x00000001d90f48[0m
        @hash[32m=[0m[1;34m-3914614378388798493[0m,
        @string[32m=[0m[31m[1;31m"[0m[31mapplication/json[1;31m"[0m[31m[0m,
        @symbol[32m=[0m[33m:json[0m,
        @synonyms[32m=[0m[[31m[1;31m"[0m[31mtext/x-json[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31mapplication/jsonrequest[1;31m"[0m[31m[0m][32m>[0m]},
   @filtered_env[32m=[0m[1;36mnil[0m,
   @filtered_parameters[32m=[0m
    {[31m[1;31m"[0m[31mformat[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mjson[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mpresence_report_id[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31mcontroller[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mv1/report_times[1;31m"[0m[31m[0m,
     [31m[1;31m"[0m[31maction[1;31m"[0m[31m[0m=>[31m[1;31m"[0m[31mindex[1;31m"[0m[31m[0m},
   @filtered_path[32m=[0m[1;36mnil[0m,
   @fullpath[32m=[0m[31m[1;31m"[0m[31m/v1/presence_reports/1/report_times.json[1;31m"[0m[31m[0m,
   @headers[32m=[0m
    [32m#<ActionDispatch::Http::Headers:0x00000003052348[0m
     @req[32m=[0m[32m#<ActionController::TestRequest:0x0000000305df18[0m ...[32m>[0m[32m>[0m,
   @ip[32m=[0m[1;36mnil[0m,
   @method[32m=[0m[1;36mnil[0m,
   @original_fullpath[32m=[0m[1;36mnil[0m,
   @port[32m=[0m[1;36mnil[0m,
   @protocol[32m=[0m[1;36mnil[0m,
   @remote_ip[32m=[0m[1;36mnil[0m,
   @request_method[32m=[0m[31m[1;31m"[0m[31mGET[1;31m"[0m[31m[0m,
   @variant[32m=[0m[][32m>[0m,
 @response_parser[32m=[0m
  [32m#<Proc:0x0000000305d770@/home/mykhailo/.rvm/gems/ruby-2.4.0/gems/actionpack-5.0.2/lib/action_dispatch/testing/request_encoder.rb:7 (lambda)>[0m,
 @sending[32m=[0m[1;36mfalse[0m,
 @sent[32m=[0m[1;36mtrue[0m,
 @status[32m=[0m[1;34m200[0m,
 @stream[32m=[0m
  [32m#<ActionDispatch::Response::Buffer:0x0000000300c050[0m
   @buf[32m=[0m
    [[31m[1;31m"[0m[31m[{[1;35m\"[0m[31mid[1;35m\"[0m[31m:1,[1;35m\"[0m[31mstart_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-29T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mend_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-05-03T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mreportable_id[1;35m\"[0m[31m:1,[1;35m\"[0m[31mreportable_type[1;35m\"[0m[31m:[1;35m\"[0m[31mPresenceReport[1;35m\"[0m[31m,[1;35m\"[0m[31mcreated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.420Z[1;35m\"[0m[31m,[1;35m\"[0m[31mupdated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.420Z[1;35m\"[0m[31m},{[1;35m\"[0m[31mid[1;35m\"[0m[31m:2,[1;35m\"[0m[31mstart_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-12T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mend_time[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-12T00:00:00.000Z[1;35m\"[0m[31m,[1;35m\"[0m[31mreportable_id[1;35m\"[0m[31m:1,[1;35m\"[0m[31mreportable_type[1;35m\"[0m[31m:[1;35m\"[0m[31mPresenceReport[1;35m\"[0m[31m,[1;35m\"[0m[31mcreated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.423Z[1;35m\"[0m[31m,[1;35m\"[0m[31mupdated_at[1;35m\"[0m[31m:[1;35m\"[0m[31m2017-04-05T17:48:12.423Z[1;35m\"[0m[31m}][1;31m"[0m[31m[0m],
   @closed[32m=[0m[1;36mfalse[0m,
   @response[32m=[0m[32m#<ActionDispatch::TestResponse:0x0000000305dd38[0m ...[32m>[0m,
   @str_body[32m=[0m[1;36mnil[0m[32m>[0m[32m>[0m
