# How to design an application.
source and copyright to: https://www.oreilly.com/content/software-architecture-patterns/

## Types os architectures.
#### Layered

The **Layered**, or n-tier, is the most common one and closely matches traditional IT infrastructure. <br>
The architecture is organized into horizontal layers and each layer performs a particular role (i.e. presentation or business logic.). Usually but not always these are 4 layers: presentation, business, persistence, and data base layer which business and persistence layers sometimes combined. Each layer has a specific task, i.e. handle user interaction. They build an abstraction around the work that needs to be done for that specific task. The power of this architecture is the *separation of concerns*, layers only care about their specific task. <br>
Usually layers are *closed*, so each layer can only communicate with the layer below. This is to *isolate* the layers, meaning that changes in a layer only affect, if at all, the layer above. Each layer only needs to know the api of the layer above and not it's internal workings. <br> 
Sometimes it makes sense to have open layers, meaning request from above can bypass this layer.
<br>

#### Event driven

Popular distributed asynchronous architecture pattern. Made up of highly decoupled single-purpose event processing components that asynchronously receive and process events. It consists of two main topologies, the broker and mediator. The mediator orchestrates several events from a central mediator why a broker chains events without the use of a mediator. <br>

#### Microkernel

The microkernel architecture pattern consists of two types of architecture components: a core system and plug-in modules. Application logic is divided between independent plug-in modules and the basic core system, providing extensibility, flexibility, and isolation of application features and custom processing logic. <br>
The core system of the microkernel architecture pattern traditionally contains only the minimal functionality required to make the system operational. Many operating systems implement the microkernel architecture pattern, hence the origin of this pattern’s name. From a business-application perspective, the core system is often defined as the general business logic sans custom code for special cases, special rules, or complex conditional processing. <br>
The plug-in modules are stand-alone, independent components that contain specialized processing, additional features, and custom code that is meant to enhance or extend the core system to produce additional business capabilities. Generally, plug-in modules should be independent of other plug-in modules, but you can certainly design plug-ins that require other plug-ins to be present. Either way, it is important to keep the communication between plug-ins to a minimum to avoid dependency issues.  <br>

#### Microservice

Architecture consisting of separately deployed units. Rather than think about services within a microservices architecture, it is better to think about service components, which can vary in granularity from a single module to a large portion of the application. <br>
*Distributed architecture*, meaning that all the components within the architecture are fully decoupled from one other and accessed through some sort of remote access protocol (e.g., JMS, AMQP, REST, SOAP, RMI, etc.).


#### Space based

The space-based pattern (also sometimes referred to as the cloud architecture pattern) minimizes the factors that limit application scaling. This pattern gets its name from the concept of tuple space, the idea of distributed shared memory. High scalability is achieved by removing the central database constraint and using replicated in-memory data grids instead. Application data is kept in-memory and replicated among all the active processing units. Processing units can be dynamically started up and shut down as user load increases and decreases, thereby addressing variable scalability. Because there is no central database, the database bottleneck is removed, providing near-infinite scalability within the application. <br>
There are two primary components within this architecture pattern: a processing unit and virtualized middleware.
The processing-unit component contains the application components (or portions of the application components). This includes web-based components as well as backend business logic. The virtualized-middleware component handles housekeeping and communications. It contains components that control various aspects of data synchronization and request handling. Included in the virtualized middleware are the messaging grid, data grid, processing grid, and deployment manager. These components, which are described in detail in the next section, can be custom written or purchased as third-party products.   
