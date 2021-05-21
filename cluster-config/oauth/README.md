# Add IdentityProvider configuration

Adds IdentityProvider configuration. The provided `htpasswd` overlay creates a htpass secret with the following users:

| User | Password |
| ---  | ---      |
|`admin` | `r3dh4t1!`|
| `dev1` | `d3v3lop3r` |


The sealed secret has been created using the following script

```bash
#! /bin/bash

htpasswd -c -B -b users.htpasswd admin 'r3dh4t1!'
htpasswd  -B -b users.htpasswd dev1 'd3v3lop3r'

oc create secret generic -n openshift-config htpass-secret \
    --from-file=htpasswd=users.htpasswd --dry-run=client \
    -o yaml | \
    kubeseal --controller-namespace sealed-secrets -o yaml > htpass-sealed-secret.yaml

rm -f users.htpasswd
```
