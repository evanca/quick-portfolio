# Self Building Jenkins Project

**Project Description:** At a previous job we set up a Jenkins server to setup some Continuous Integration (CI) on a Inner Source Project that we were maintaining. No problem right?
<br>
Well... Who was going to maintain that server, and keep it secure, reproduce it if the server admin left? I decided that it would be more sustainable and reduce my workload to automate the building, configuration, and scaling of the Jenkins CI server.
<br>

## Build the CI server with one command

The goal was, as the heading states, to build/re-build the CI server with a single command: `vagrant up`. The companies tool of choice for automation was Jenkins so I wrote a Jenkins job to do just that. A general outline of the steps:
1. Build a Jenkins server using a Vagrantfile
1. Build several identical client servers using a Vagrantfile
1. Utilize swarm-client project to have clients autoconnect to the Jenkins server
1. Codify build and test steps into the bootstrap files so they run as a part of `vagrant up`

Now every time that Jenkins crashed, a version updgrade was needed, or the hardware the server was being hosted on changed, we could just clone the repo and run `vagrant up`.
<br>

Time to recovery for this system was greatly improved by this automation. It went from approximately 24 hours to less than 1 hour.

