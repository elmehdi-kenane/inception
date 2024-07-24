### 🔸 what is docker?
- docker is a software/tool used to isolate your application and its dependencies into a container. 

### 🔸 what's difference between docker and vm?
- both virtualization tools, the main difference between them is what part of the OS virtualize
- = OS Application layer
- = OS Kernel
- = Hardware
- docker virtualize the OS application layer
    - contains the OS application layer
    - Services and apps installed on the top of that layer (java runtime, python, ...)
    - it uses the kernel of the host because it doesn't have its own kernel
- vm virtualize the OS application layer and it's kernel (the complete operating system)
- docker images is smaller and faster at running than vm images

### 🔸 what the problem docker solve?
- [What is Docker and what problem does it solve?](https://ankitsahay.medium.com/what-is-docker-and-what-problem-does-it-solve-a019b73ff8aa)
- [What problems does Docker really solve? 🐳](https://dev.to/techworld_with_nana/what-problems-does-docker-really-solve-496a)

### 🔸 there is a softwares created before docker and do the same job so what the new features docker come with?
1. Simplified Container Management
Docker made container technology accessible to a broader audience by providing a high-level interface and a set of tools that simplified the process of creating, deploying, and managing containers. Prior to Docker, container technologies like LXC (Linux Containers) required more manual setup and configuration, making them less user-friendly.

    - Dockerfile: 
    Docker introduced the Dockerfile, a simple scripting language to define the steps needed to build a container image. This allows for a declarative approach to container creation, making it easy to automate and reproduce the creation of container images.

2. Docker Hub
Docker introduced Docker Hub, a centralized repository for container images. This allowed users to easily share and distribute containerized applications. Docker Hub provides a vast library of pre-built images, which simplifies the process of finding and deploying software.

3. Image Layering and Versioning
Docker uses a layered filesystem approach for images. Each Docker image is built in layers, and these layers can be reused across different images. This makes images more efficient in terms of storage and network transfer. Docker also supports versioning of images, making it easy to roll back to previous versions if needed.

    and more features..., So docker come with new ones and rebust others.
### 🔸 how development process looks like?
- before docker:
    - Each developer needs to install and configure all services directly on their OS on their local machine
    - installation process different for each OS environment
- after docker:
    - Start service as a Docker container (for ex: Postgres packaged with all dependencies and configs)
    - Standardizes process of running any service on any local dev environment
    - command same for all OS & command same for all services
    - run different versions of same app without any conflicts

### 🔸 how deployment process looks like?
- before docker:
    - Need of textual guide of deployment
    - Back and forth communication (additional communication overhead where developers have to communicate with ops team how the application should run)
- after docker:
    - developers create an application package that doesn't only include the code itself but also all the dependencies and configuration for the application so instead of having to write that in some textual format they just package all of that inside the application artifact

### 🔸 The underlying technologies used inside docker engine:
Docker leverages the host's kernel and various existing tools to provide containerization. Here are some key technologies and components used in Docker:

Kernel Utilization: Docker uses the host's kernel, requiring mechanisms to isolate containers from one another. Docker adopts a philosophy of utilizing existing tools within its engine.

- __cgroups (Control Groups)__: cgroups are used to manage and limit the resources (such as CPU, memory, and storage) that containers can use. This ensures that one container does not consume resources at the expense of others.

- __Namespaces__: (from docker-docs) Docker is written in the Go programming language and takes advantage of several Linux kernel features to provide its functionality.
Namespaces are a key technology used by Docker to create isolated workspaces called containers. When a container is run, Docker creates a set of namespaces for that container.
These namespaces provide a layer of isolation, ensuring each aspect of a container runs in a separate namespace, limiting access to that namespace only. This isolation is critical for security and resource management.
Types of namespaces used include (pid, net, mnt, uts, ipc, user)
[docs.docker.com/guides/docker-overview/#the-underlying-technology](https://docs.docker.com/guides/docker-overview/#the-underlying-technology)

- __runc__: runc is a CLI tool used to spawn and run containers based on Open Container Initiative (OCI) specifications. It provides the core functionality to run containers according to industry standards.

### 🔸 what's the role of .dockerignore file?
The .dockerignore file in a Docker project specifies which files and directories should be ignored by the Docker build process. It works similarly to a .gitignore file in Git, helping to exclude unnecessary or sensitive files from being copied into the Docker image, thereby reducing the image size and improving build performance.

### 🔸 what is the disadvantages of docker?
- __Resource Overhead__: While containers are lightweight compared to virtual machines, they still incur some overhead in terms of CPU, memory, and disk space. Running multiple containers on a single host can consume significant system resources, especially if not properly managed.
- __Security Concerns__: Although Docker provides isolation between containers using Linux namespaces and control groups (cgroups), there are still potential security risks associated with containerized environments. Vulnerabilities in container images, misconfigurations, and privilege escalation attacks are some of the security concerns that need to be addressed.
- __Compatibility__:
    Docker originally started on Linux, and its underlying technology relies heavily on Linux kernel features (cgroups, namespaces).
    While Docker can run on Windows and macOS, it uses a virtual machine (like Docker Desktop's use of Hyper-V or Docker for Mac's use of HyperKit) to emulate the Linux kernel, which can add overhead and complexity.

### 🔸 CMD vs ENTRYPOINT
Both ENTRYPOINT and CMD are essential for building and running Dockerfiles—it simply depends on your use case. As a general rule of thumb:
- Use ENTRYPOINT instructions when building an executable Docker image using commands that always need to be executed.
- Use CMD instructions when you need an additional set of arguments that act as default instructions until there is explicit command-line usage when a Docker container runs.

### terms:
#### 🔹 Docker image
- a read-only file with a bunch of instructions. When these instructions are executed, it creates a Docker container, it's an executable application artifact (include app source code, but also complete environment configuration). it's also an immutable template that defines how a container will be realized

#### 🔹 Docker container:
- a running instance of an image

#### 🔹 Docker registry (collection of public/private repositories):
- a storage and distribution system for docker images

#### 🔹 Docker repository:
- collection of related images with same name but different versions

#### 🔹 Docker hub:
- one of the biggest public docker registry, where you can find any of these official images and many other images that different companies or individual developers created and uploaded there
#### 🔹 NB (Docker registry and Docker hub related): 
- Docker has a dedicated team responsible for reviewing and publishing all content on the docker official images repositories

#### 🔹 docker volume:
- Docker volumes are a feature designed to solve the problem of data persistence in Docker containers. By default, Docker containers do not retain data once they are stopped or removed, leading to potential data loss. Docker volumes provide a way to persist data, ensuring that it remains intact even if the container is stopped, restarted, or deleted.
- A Docker volume is an independent file system entirely managed by Docker and exists as a normal file or directory on the host, where data is persisted.

#### 🔹 Docker compose:
- docker compose is a feature or a tool that provide a way for defining and running with multi-containers applications

## resources
- [FAQs for Docker Desktop for Linux](https://docs.docker.com/desktop/faqs/linuxfaqs/)