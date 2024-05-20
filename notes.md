### what is docker
- -> 

### what's difference between docker and vm?
- -> both virtualization tools, the main difference between them is what part of the OS virtualize
- = OS Application layer
- = OS Kernel
- = Hardware
- -> docker virtualize the OS application layer
    - contains the OS application layer
    - Services and apps installed on the top of that layer (java runtime, python, ...)
    - it uses the kernel of the host because it doesn't have its own kernel
- -> vm virtualize the OS application layer and it's kernel (the complete operating system)
- -> docker images is smaller and faster at running than vm images

### what the problem docker solve?
- [What is Docker and what problem does it solve?](https://ankitsahay.medium.com/what-is-docker-and-what-problem-does-it-solve-a019b73ff8aa)
- [What problems does Docker really solve? 🐳](https://dev.to/techworld_with_nana/what-problems-does-docker-really-solve-496a)

### how docker solve that problem?

### how development process looks like before docker?
- -> Each developer needs to install and configure all services directly on their OS on their local machine
- -> installation process different for each OS environment

### how development process looks like after docker?
- -> isolated environment
- -> Start service as a Docker container (for ex: Postgres packaged with all dependencies and configs)
- -> Standardizes process of running any service on any local dev environment
    - command same for all OS & command same for all services
- -> run different versions of same app without any conflicts

### how deployment process looks like before docker?
- -> Need of textual guide of deployment
- -> Back and forth communication (additional communication overhead where developers have to communicate with ops team how the application should run)
### how deployment process looks like after docker?
- -> developers create an application package that doesn't only include the code itself but also all the dependencies and configuration for the application so instead of having to write that in some textual format they just package all of that inside the application artifact

### what is the disadvantages of docker?
- -> Resource Overhead: While containers are lightweight compared to virtual machines, they still incur some overhead in terms of CPU, memory, and disk space. Running multiple containers on a single host can consume significant system resources, especially if not properly managed.
- -> Security Concerns: Although Docker provides isolation between containers using Linux namespaces and control groups (cgroups), there are still potential security risks associated with containerized environments. Vulnerabilities in container images, misconfigurations, and privilege escalation attacks are some of the security concerns that need to be addressed.
- Compatibility: Compatible only with linux discos
- -> 
### terms:
#### Docker image:
- -> a read-only file with a bunch of instructions. When these instructions are executed, it creates a Docker container.
- -> an executable application artifact (include app source code, but also complete environment configuration)
- -> you can add environment variables, create directories, files etc.
- -> immutable template that defines how a container will be realized

#### Docker container:
- -> a running instance of an image

#### Docker registry (collection of public/private repositories):
- -> a storage and distribution system for docker images

#### Docker repository:
- -> collection of related images with same name but different versions

#### Docker hub:
- -> one of the biggest public docker registry, where you can find any of these official images and many other images that different companies or individual developers created and uploaded there
#### NB (Docker registry and Docker hub related): 
- Docker has a dedicated team responsible for reviewing and publishing all content on the docker official images repositories

#### docker network:
- ->

#### docker volume:
- -> A Docker volume is an independent file system entirely managed by Docker and exists as a normal file or directory on the host, where data is persisted.

#### Docker compose:
- ->

- how the containers is separated
- why I needs to specify the port to get the container (nginx for example) works check (https://www.youtube.com/watch?v=pg19Z8LL06w binding-port part)
- how to create a DOCKERFILE
- what does means use Docker in rootless mode

## resources
- [FAQs for Docker Desktop for Linux](https://docs.docker.com/desktop/faqs/linuxfaqs/)
- 