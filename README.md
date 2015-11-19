tutum Cookbook
==============
This is as cookbook to setup docker tutum for your chef clients

Tutum Agent comes with it's own docker binary, so installation of docker is not needed explitcly.

Requirements
------------

- Debian or Ubuntu system
- Go to Tutum Dashboard > Nodes and click ```bring your own node```
- Add this key into your node attributes
- run recipe

Attributes
----------
see attributes .rb 

e.g.
#### tutum::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tutum']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### tutum::default
The default cookbook includes tumtum-agent at the moment

#### tutum::agent
Installs the tumtum-agent from the repository

TODO
----
- add tutum-cli method with username and password to extract the auth key

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
