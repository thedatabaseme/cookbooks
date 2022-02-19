# Initialize Molecule Role and Scenario

You can create an empty role structure including Molecule default scenario using `molecule init role`. This will initialize
a role structure as ansible-galaxy init would do but in addition the Molecule folder structure will be created.
If you have an already existing role (structure), you can use `molecule init scenario`. You may want to define a different
container runtime for Molecule with (e.g. for Docker `-d docker`. Default is `podman`.

    - molecule init role <role_name> [-d docker]

    - molecule init scenario <scenario_name> [-d docker]

# Run a Molecule test

To run a Molecule test, head to the roles root directory and run molecule with the wanted scenario. If you do not specify
a scenario name, the default scenario is started. Here is an example:

    - molecule test [-s <scenario_name>]

If you don't want to get the container destroyed after a test run, add the `--destroy=never` parameter to your `molecule` command.

You can also run specific steps of a Molecule test (e.g. `create`):

    - molecule create [-s <scenario_name>]

    - molecule converge [-s <scenario_name>]

    - molecule destroy [-s <scenario_name>]

In order to login to a created test container, you can use `login` for this. The container needs to exist here (so not destroyed):
    
    - molecule login [-s <scenario_name>]

# Molecule Tutorial

For more tutorials on Molecule see my Blog article [here](https://thedatabaseme.de/2022/01/17/automated-testing-your-ansible-role-with-molecule-and-github-actions/).