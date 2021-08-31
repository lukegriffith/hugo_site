---
title: "Opensource: Gitlab Provider Development"
date: 2020-09-29T00:55:10Z
draft: false
---

I worked on the Gitlab provider to add the remote mirrors api, as a terraform resource. This creates a mirror object that syncs to a remote git repository.

To achieve this I had to update the upstream go library, using the [gitlab API documentation](https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html). Once merged and released created I added changes to the Terraform provider.

- xanzy/go-gitlab [(Pull Request)](https://github.com/xanzy/go-gitlab/pull/879)
- gitlabhq/terraform-provider-gitlab [(Pull Request)](https://github.com/gitlabhq/terraform-provider-gitlab/pull/358)

