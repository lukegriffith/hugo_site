---
title: "CaptainHook"
date: 2020-08-29T00:55:10Z
draft: false
---

For my final year project on my BSc computing course at Birkbeck, i designed and created an internet webhook router that can dispatch recieved events to configured targets, parsing the body data and mutating it to match the signatures of downstream API's. 

The project was build in GoLang, and takes a lot of inspiration from software project like Kubernetes or Ansible, with a fully declarative yaml configured interface.

[Repository](https://github.com/lukemgriffith/captainhook)

_Extract from project report_

Captain Hook is an embedded HTTP server that processes incoming web requests against a configured set of endpoints, rules and secrets. The configuration resides in a text configuration file on disk produced in YAML. The server and configuration are static artefacts and deliberately have no external dependencies on components like databases or queues (Design choices are covered in a later chapter). 

A domain-specific language (DSL) configures the system. Inspiration has been taken from popular open-source projects like [Ansible](https://www.redhat.com/en/technologies/management/ansible) and [Kubernetes](https://kubernetes.io/), having a YAML document be the building blocks of the services configuration. The configuration DSL defines endpoints and rules. 

An endpoint is the data structure that is processed by the application to open up a uniform resource identifier on the HTTP server; External services are then configured to emit HTTP event data to this resource identifier to invoke the endpoints configured set of rules. An example of an emitted event could be a webhook from GitHub notifying that a repository has received a new commit. 

Rules are associated with an endpoint and consist of a list of defined functions that are invoked on the payload and forwarded onto downstream services, typically forwarding to HTTP/JSON endpoints. A set of default functions are available, for debugging and developing purposes. However, the primary use case is the template function, where the system uses Golangs templating engine to produce the desired output from the given inputs to the rule. An example of a template would be converting an incoming JSON object and mapping the incoming fields to an output object with a different field schema. Additional template functions can be used on the values and keys, provided by the Sprig library, see documentation referenced in the appendix [@sprig_repository]. This library provides standard string and math functions typically found in standard libraries. 

The Secrets structure is associated with the running application and contains a string to string map of sensitive values. Endpoints can define what secrets should be passed to the executing rules at runtime by declaring the secrets key, from the string map in the endpoint configuration. The system expects an encrypted YAML file to be passed through the command line arguments to the application entry point, along with a passphrase used to decrypt the data at runtime. No unencrypted secret is accessible on disk, and only in the application memory. 

The types of problems the software is trying to solve are interconnection problems, typically responding to events in one platform or system to invoke or queue an action in another or to log data. 

Golang is the language of the embedded server and core library. The language is a statically linked and source dependant compiling down to a single binary specific to the chosen system architecture; The Golang language also has a vast amount of opensource libraries for interfacing with standard infrastructure tooling already present in the language. 

To sum up the system in a sentence, the workflow CaptainHook implements is to receive, change and forward web event data, via a single point. 
