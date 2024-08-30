# Overview

This code is a manaul add-on to the automated tests to help test the ACR.  The automated Terraform resources are created in the `./test/fixture` directory.  This code is used to test the ACR by pushing and pulling images from the ACR.

Notes:
* The resources in the ./text/fixture directory are randomaly named.  Therefore, inputs must be adjusted for this code to work.