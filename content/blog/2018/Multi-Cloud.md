# How to IAAS in multi-cloud

## Introduction
Infrastructure as a Service is hugely popular with multiple public and private cloud provider offerings, offering their own implementation of services. Repackaging well-known technology as bundles accessible via an API and allowing users to created required virtual compute resources themselves. Each provider implements abstractions around these technologies to integrate into API's enabling users to create and configure. Providers build well known workflows, terminology and automation tools for their platforms to help users make learning and working simpler.

Due to these differences in services and implementation of their interfaces, cloud providers do not allow for easy portability between each other. A deployment pipeline and application deeply integrated with a single providers technology seriously impedes future ability for migration, or portability of their application and infrastructure.

## Options 

1. Let IAAS users use the native API.

2. Use an agnostic tool.

3. Host the workflow.