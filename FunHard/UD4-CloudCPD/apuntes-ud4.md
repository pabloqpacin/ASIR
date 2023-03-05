# UD4 Estructura CPD — Apuntes

- custom documentation
  - @CertBros: [**Cloud Computing** Explained | IaaS SaaS PaaS](https://www.youtube.com/watch?v=lex-DYi1UpU)


<details>
<summary>ChatGPT on Cloud Computing</summary>

```markdown
There are three main types of cloud computing services:
1. __Infrastructure as a Service (IaaS)__: This type of service provides access to fundamental computing resources such as servers, storage, and networking. IaaS allows businesses to quickly scale up or down their computing resources as needed, and pay only for what they use. Examples of IaaS providers include Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform.
2. __Platform as a Service (PaaS)__: This type of service provides a platform for developers to build and deploy applications without having to manage the underlying infrastructure. PaaS providers offer tools and services such as operating systems, development frameworks, databases, and middleware. Examples of PaaS providers include Heroku, Google App Engine, and Salesforce.
3. __Software as a Service (SaaS)__: This type of service provides access to software applications that are hosted and managed by a third-party provider. SaaS applications are accessed through a web browser or a mobile app, and users typically pay a subscription fee to access the software. Examples of SaaS providers include Salesforce, Microsoft Office 365, and Dropbox.

Types of cloud computing services based on their deployment model:
1. __Public Cloud__: This type of cloud computing service is owned and operated by a third-party provider and offers computing resources, such as servers and storage, over the internet. Public cloud services are accessible to anyone who has an internet connection and can be used on a pay-per-use basis. Examples of public cloud providers include Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform.
2. __Private Cloud__: This type of cloud computing service is dedicated to a single organization and is not accessible to the public. Private clouds can be hosted on-premises or by a third-party provider and offer greater control and customization than public clouds. Examples of private cloud providers include VMware, Dell, and Hewlett Packard Enterprise (HPE).
3. __Hybrid Cloud__: This type of cloud computing service combines public and private cloud services and allows organizations to use the most appropriate platform for each workload. Hybrid clouds can offer greater flexibility and cost efficiency than using either public or private cloud services alone. Examples of hybrid cloud providers include AWS Outposts, Microsoft Azure Stack, and Google Anthos.
```

</details>


## ud4-teoria + ud4-presentacion

- **Centros de Procesamiento de Datos**
  - **INTRO** — Arquitecturas de Grandes Ordenadores
    - Características sistemas informáticos: 'FDEI — fiabilidad, disponibilidad, eficiencia e integración' // *nube & virtualización*
    - Mainframes: tremendos ordenadores alto rendimiento
    - **Hipervisores**: eg. Proxmox, VMware, Citrix
  - **CLOUD COMPUTING**
    - Ventajas: Economía a gran escala, cliente paga según gasto -no inversión-, agilidad, teletrabajo, ... <!--reduced upfront cost, low maintenance, scalability, security-->
    - TIPOS:
      - *IaaS:* cliente gestiona hardware, OS y aplicaciones
      - *PaaS:* cliente solo gestiona aplicaciones 
      - *SaaS:* cliente USA aplicaciones, no gestiona ningún componente Infraestructura
    - SEGÚN DEPLOYMENT:
      - *Públicas:* eg. AWS, Microsoft Azure // un proveedor, muchos clientes
      - *Privadas:* proveedor == cliente
      - *Híbridas:* 1 proveedor ~on-premise~ 1 cliente
  - **ORGANIZACIÓN CPDs**
    - Características diseño: ubicación, seguridad, suministro eléctrico, temperatura y humedad, ...
    - Controles de acceso: códigos, bandas magnéticas, RFID, Biométrico
    - Centros de respaldo && *plan de contingencia*
    - Mecanismos vigilancia: guardias seguridad, sensores movimiento-temperatura-infrarrojos, cámaras
    - Mecanismos seguridad física: **SAI**, **AVR**
  - **ELSE**
    - Servidores de Almacenamiento Empresarial
      - *Servidor SAN:* StorageAreaNetwork mediante Fibra
        - *Almacenamiento Flash:* SSD o NVMe 
        - *Almacenamiento VVOLS:* Virtual Volumes <!--GUID único-->
