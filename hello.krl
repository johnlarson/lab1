ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
  
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }

  rule monkey_defaults_to {
    select when echo monkey_d
    pre {
      name = event:attr("name").defaultsTo("Monkey")
      message = "Hello " + name
    }
    send_directive("say", {"msg": message})
  }

  rule monkey_ternary {
    select when echo monkey_t
    pre {
      name = event:attr("name") => event:attr("name") | "Monkey"
      message = "Hello " + name
    }
    send_directive("say", {"msg": message})
  }
  
}