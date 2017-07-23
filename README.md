# IPFS on Cloud Foundry

A very basic example of `ipfs daemon` running on Cloud Foundry

## Overview

The `up.sh` script will stand up 1 app called `ipfs` running `ipfs daemon --init`. All the data is written to `/home/vcap/app/.ipfs/`.

You can access the node with `cf ssh` and use the `ipfs` binary at `app/ipfs` but may need to `export HOME=/home/vcap/app`.

## Testing

The `test.sh` script will:

1. `cf ssh` into the node
1. On the node, run `ipfs add` adding a message like `I <3 IPFS -vcap on Sun Jul 23 03:12:01 UTC 2017` 
1. On the node, run `curl "http://127.0.0.1:8080/ipfs/$hash"`
1. Disconnect from the node
1. On your local machine, run `curl "https://ipfs.io/ipfs/$hash"`
1. The output from the above commands should be identical

## Prerequisites

* [Cloud Foundry CLI](https://github.com/cloudfoundry/cli)
* Account on Cloud Foundry environment with [Container-to-Container networking](https://docs.pivotal.io/pivotalcf/1-10/concepts/understand-cf-networking.html) and [SSH](https://docs.pivotal.io/pivotalcf/1-10/opsguide/config-ssh.html) enabled
  * Recommended: Pivotal Web Services (you may need to [request C2C networking](mailto:support@run.pivotal.io?subject=Access%20to%20Container%20Networking%20on%20PWS&body=Can%20I%20please%20get%20access%20to%20Container%20Networking%20stack%20on%20PWS%3F%20Thank%20you.))
  * Supported on [Pivotal Cloud Foundry 1.10](https://docs.pivotal.io/pivotalcf/1-10/pcf-release-notes/index.html) and higher

## Usage

* Log in to Cloud Foundry and target an org and space
```
cf login -a https://api.your-cf.com -u your-email@example.com -o your-org -s your-space
```

* Run `up.sh` and wait for it to finish

* Run `tests.sh`. Read the prompts and compare it to the output to confirm the cluster is working

## References

* [IPFS Getting Started](https://ipfs.io/docs/getting-started)
