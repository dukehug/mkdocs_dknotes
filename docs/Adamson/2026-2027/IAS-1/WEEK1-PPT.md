
# Module 1 - Information Assurances Introduction

2026-08-06 11:19

Tags: #IAS

Author:  Duke Hsu

---

## Topic 
1. Information Assurances VS Information Security
2. Core Cybersecurity Concepts
3. Information Assets and Classification 
4. Security Objectives (CIA Triad)
5. Cybersecurity Domains
6. Cybersecurity Professionals
7. Current Cybersecurity Challenges

### 1.0 Information Assurances  vs Information Security

IA vs IS

|          | IA                                                                                                      | IS                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| Scope    | IA Covers the big picture, including compliance, auditing, privacy, and policies.                       | InfoSec focuses narrowly on defending hardware, software, and networks.                       |
| Approach | IA is strategic and administrative                                                                      | InfoSec is technical and operational                                                          |
| Pillars  | IA relies on five pillars(Availability, Integrity, Authenticity,Confidentiality, Non-repudiation) AIACN | InfoSec primarily centers on the classic triad (Confidentiality, Integrity, Availability) CIA |
| Assets   | IA protects all company information assets, incuding analog and physical records.                       | InfoSec targets digital data and electronic systems.                                          |

![[Pasted image 20260806113023.png]]  

![[Pasted image 20260806113904.png]] 
####  1.1 Keyword in IA and IS

IA
- risks, processing, storage, transmission 

IS
- confidentiality, integrity, availability, encryption, firewall, access controls


### 2.0 Cybersecurity

Cybersecurity is a practice of protecting systems, networks, programs, and data from digital attacks.

#### 2.1 Core Concepts

Threats  - Menaces
- Any potential danger that exploit vulnerability to breach security.
Vulnerability - Weakness
- A weakness in the system that can be exploited by a threat actor
Risks -  Dangers
- The potential for loss when a threat exploit the vulnerability
Attacks - Hacker 
- An intentional act that can be exploit vulnerability and compromise a system
Countermeasures - What we do 
- An action or device deployed to reduce or eliminate a threat
Exploit - Abuse
- A piece of code or technique that takes advantage of vulnerability.

#### 2.2 Cyber Threats

| Malware - Viruses   | Worms, Trojans, Ransomware, spyware                      |
| ------------------- | -------------------------------------------------------- |
| Phishing - Social   | Engineering attacks via deceptive emails or messagers    |
| DDOS - Distributed  | Denial of service attacks that overwhelm systems         |
| Man in - The middle | Interception of communication between tow parties        |
| Zero -Day           | Attacks on unknown vulnerabilities before patches exists |

### 3.0 Information Assets  ,  Asset Valuation  and Classification 

- Information Assets is any data, device, systems, and other components of the environment that supports information -related activities. 
- These are resources that an organization must protect to maintain operations and competitive advantage. 
- Information Assets have measurable value to an organization and required appropriate levels of protection based on their sensitivity and criticality. 

#### 3.1 Types of Information Assets

Digital Data
- Databases , files, intellectual property, source code , emails. 

Physical Assets 
- Servers, workstations, network devices, storage media.

Software 
- Operating systems, applications, development tools, licenses.

People
- Employees, contractors, their knowledge and expertise.

Services 
- Cloud services, utilities, network connectivity, hosting 

Intangibles
- Reputation, brand value, trade secrets, customer trusts.

#### 3.2 Asset Valuation and Classification 

Organization mush classify assets based on sensitivity and impact of loss

Public
- Information freely available with no impact if disclosed

Internal
- For organizational used only , minor impact if leaked

Confidential 
- restricted access, significant impacted if compromised 

Top Secret 
- Highest sensitivity, severe damage if disclosed.


#### 3.3  The CIA Triad

Confidentiality  - Secret 
- Ensuring information is accessible only to authorized individuals. Achieved through encryption, access controls, and authentication.

Integrity -  Completeness
-  Ensuring data is accurate, complete, and unaltered during storage and transmission.Achieved through hashing, digital signatures, and checksums. 

Availability  - Readiness
- Ensuring systems and data are accessible when needed by authorized users. Achieved redundancy, backups, and disaster recovery. 

#### 3.4 5 Pillars of Information Security 

![](5_Pillars_of_Information_Security.png)


### 4.0 The Cybersecurity Domains

Cybersecurity Domains are the specialized focus areas and categories used do organize and apply security practices, policies, and defenses. 

Security and Risk Management
- Governance, compliance, risk assessment, security policies, business continuity planning.
Asset Security 
- Data classification, ownership retention policies, privacy protection, secure handling. 
Security Architecture and Engineering 
- Cryptography, physical security, vulnerability assessment. 
Communication and Network Security 
- Network architecture, protocols, firewalls, VPNs, Wireless security, segmentation . 

Indentity and Access Management (IAM)
- Authentication mechanisms, authorization, SSO, MFA, access control models,(RBAC, MAC, DAC)

Security Assessments and Testing 
- Penetration testing, vulnerability scanning , audit, security metrics, compliance testing. 

Security Operations 
- Incident response, forensic, logging, monitoring, disaster recovery , SOC operations.

Software Development Security 
- Secure SDLC, Code Review, Application, vulnerabilities , DevSecOps, OWASP Top 10 

#### 4.1 SDLC in Software Development 

Software Development Life Cycle

|                    |                                                |                                          |
| ------------------ | ---------------------------------------------- | ---------------------------------------- |
| **Phase**          | **Key activities**                             | **Deliverables**                         |
| 1.     Planning    | Identify project scope, goals and requirements | Initial project plan                     |
| 2.     Analysis    | Gather and review data on project requirements | Fully detailed requirement documentation |
| 3.     Design      | Define project architecture                    | Software design document (SDD)           |
| 4.     Coding      | Write initial code                             | Functional software prototype            |
| 5.     Testing     | Review code and eliminate bugs                 | Refined, optimized software              |
| 6.     Deployment  | Deploy code to production environment          | Software available to end users          |
| 7.     Maintenance | Continual fixes and improvements               | Updated and optimized code               |
#### 4.2 SOLID in Software Development 

SOLID stands for:

- [**S** - Single-responsibility Principle](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design#single-responsibility-principle)
- [**O** - Open-closed Principle](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design#open-closed-principle)
- [**L** - Liskov Substitution Principle](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design#liskov-substitution-principle)
- [**I** - Interface Segregation Principle](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design#interface-segregation-principle)
- [**D** - Dependency Inversion Principle](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design#dependency-inversion-principle)

In this article, you will be introduced to each principle individually to understand how SOLID can help make you a better developer.

#### 4.3  OWASP Top 10

The List of Risks

- **A01: Broken Access Control:** Users can act outside their intended permissions or access unauthorized data.

- **A02: Security Misconfiguration:** Overly permissive cloud settings, default passwords, or unhardened frameworks.

- **A03: Software Supply Chain Failures:** Vulnerable dependencies, compromised packages, or build pipeline flaws.

- **A04: Cryptographic Failures:** Weak hashing algorithms or exposing sensitive data without encryption.

- **A05: Injection:** Untrusted user input interpreted as active code or database queries.

- **A06: Insecure Design:** Flaws in application architecture or missing threat modeling from the start.

- **A07: Authentication Failures:** Weak credential handling, session mismanagement, or brute-force vulnerabilities.

- **A08: Software or Data Integrity Failures:** Unverified updates, insecure CI/CD pipelines, or untrusted code plugins.

- **A09: Security Logging and Alerting Failures:** Inadequate monitoring that allows breaches to go unnoticed.

- **A10: Mishandling of Exceptional Conditions:** Improper error handling or failing open during system faults

#### 4.4 Cybersecurity Professionals

Security Analyst 
- Monitors systems, Analyzes threats , Responds to incidents.
Penetration Tester 
- Simulates attacks to identify vulnerabilities.
Security Engineer
- Designs and implements security systems and architecture.
CISO Chief
- Information Security officer. Leads security strategy at executive level.
Forensic Analyst
- Investigates cybercrimes and recovers digital evidences. 

### 5.0 Current Cybersecurity Challenges

- Attackers in ransomware, encrypts data, exfiltrate sensitive information, and threaten to publish it unless payment is made 
- It evolved into sophisticated double and triple extortion schemes. 
- Average ransom payments exceeds $1.5M
- Critical infrastructure increasingly targeted such as hospitals and utilities.
- Ransomware-As-A-Service(RAAS) lowers barrier to entry for attackers. 
- Artificial Intelligence is being weaponized to create more sophisticated attacks that are harder to detect and faster to deploy .
- Deepfakes. AI-generated audio/video used for social engineering and fraud.
- Automated Attacks. AI crafts phishing emails, indistinguishable to legitimate ones. 
- Evasion- Techniques. ML- based malware adapts to bypass security tools. 
- Speeds. AI accelerates vulnerability discovery and exploit development. 
- The expanding attack surface through interconnected devices and third-party dependencies creates complex security challenges. 
- Supply chain attacks. Compromising software updates to infiltrate thousands of organizations simultaneously.
- IoT vulnerabilities. Billions of connected devices with minimal security controls.
- Cloud Misconfigurations . Exposed data and services due to complex multi-cloud environments. 
- Skills shortage. 3.4M+ unfilled cybersecurity .




----
## References

https://www.ibm.com/think/topics/sdlc

https://owasp.org/Top10/2025/

https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design

https://owasp.org/www-project-top-ten/
