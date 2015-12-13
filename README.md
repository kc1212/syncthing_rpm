# syncthing_rpm

### Description
This is a Syncthing SPEC file for Fedora.
It'll probably work for other distributions but that's not tested.
This RPM is currently being built on https://copr.fedoraproject.org/coprs/kc1212/syncthing/

I want to keep the SPEC file as simple as possible.
Therefore all I'm doing is extracting official binary release, and copy the systemd files (also provided by the binary release).

For the syncthing documentation please refer to http://docs.syncthing.net/.
If there is a Syncthing issue please report to the upstream project - https://github.com/syncthing/syncthing.

Code is based on based on https://github.com/thunderbirdtr/syncthing_rpm.

### Installing via copr
    dnf copr enable kc1212/syncthing
    dnf install syncthing

    # after installation, you can run syncthing directly
    syncthing

    # or run it as a service
    systemctl start syncthing@$(whoami).service

    # please see http://docs.syncthing.net/ for more documentation


